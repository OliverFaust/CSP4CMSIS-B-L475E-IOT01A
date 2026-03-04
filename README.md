# CSP4CMSIS Relay Chain Pipeline

## DISCO-L475VG-IOT01A (B-L475E-IOT01A)

This project demonstrates a high-integrity data pipeline using the **CSP (Communicating Sequential Processes)** pattern on the STM32L475 Discovery kit.

It implements a 7-process network (1 Sender, 5 Relays, 1 Receiver) to verify data consistency across multiple synchronization boundaries using zero-capacity rendezvous channels.

---
## 1. Hardware & Environment

* **Board**: STM32L475VG Discovery Kit (B-L475E-IOT01A)
* **Core**: ARM Cortex-M4 @ 80MHz
* **Memory**: 1 MB Flash, 128 KB SRAM
* **IDE**: STM32CubeIDE
* **OS**: FreeRTOS (Native API)
* **Library**: [CSP4CMSIS](https://oliverfaust.github.io/)

## 2. System Architecture
The project follows the **SPN (Sequential Process Network)** principle. Data flows through a series of independent actors, each running in its own protected thread context.

### The Relay Chain
```Plaintext
Sender -> [C0] -> Relay 1 -> [C1] -> Relay 2 -> [C2] -> Relay 3 -> [C3] -> Relay 4 -> [C4] -> Relay 5 -> [C5] -> Receiver
```
| Component | Role |
| :--- | :--- |
| **CountingSender** | Generates a stream of $N$ incrementing integers. |
| **Relay (x5)** | Pure sequential actors that pass data from an input channel to an output channel. |
| **CheckerReceiver** | Validates the integrity of the received stream and reports errors via UART. |

## 3. Critical Configuration (Determinism & Safety)
To ensure the CSP engine runs reliably on the L475, the following "Advanced Settings" are used in CubeMX:

### Thread-Safe Strategy (Strategy 4)
The project is configured with **STM32_THREAD_SAFE_STRATEGY=4**. This maps standard C library locks to FreeRTOS mutexes, ensuring that `printf` and `malloc` are reentrant and safe to call from multiple CSP processes simultaneously.

### Timebase Source
To prevent interference between the HAL and the RTOS scheduler, the **Timebase Source** is moved from `SysTick` to `TIM1`.

### Memory Management
Given the 128 KB SRAM limit of the L475:
* **FreeRTOS Heap**: Set to 64 KB (`configTOTAL_HEAP_SIZE`).
* **Process Stacks**: Set to 512 words (2048 bytes) for processes using `printf` to prevent stack overflow.
* **Execution Mode**: `StaticNetwork` (Zero-heap after initialization).

### 4. Implementation Example
The network is constructed by connecting `Chanin` and `Chanout` ports:

```C++

void MainApp_Task(void* params) {
    // 6 Channels needed for a 5-relay chain
    static Channel<int> channels[6];

    // Instantiate Processes
    static CountingSender  sender(channels[0].writer());
    static Relay           r1(channels[0].reader(), channels[1].writer(), 1);
    static Relay           r2(channels[1].reader(), channels[2].writer(), 2);
    static Relay           r3(channels[2].reader(), channels[3].writer(), 3);
    static Relay           r4(channels[3].reader(), channels[4].writer(), 4);
    static Relay           r5(channels[4].reader(), channels[5].writer(), 5);
    static CheckerReceiver receiver(channels[5].reader());

    // Execute in Parallel
    Run(
        InParallel(sender, r1, r2, r3, r4, r5, receiver),
        ExecutionMode::StaticNetwork
    );
}
```

## 5. Why CSP on STM32?
1. Decoupling: Processes do not know about each other; they only know their channels.
2. Synchronization: Rendezvous channels eliminate the need for manual Mutex/Semaphore management.
3. Safety: Data is "owned" by only one process at a time.
4. Predictability: The use of `StaticNetwork` mode ensures no dynamic memory allocation occurs after the system starts.

## 6 How To Build
Clone this repository into your STM32CubeIDE workspace.

Ensure the `CSP4CMSIS` library is linked in the include paths.

Check `FreeRTOSConfig.h` to ensure `configTOTAL_HEAP_SIZE` is at least `65536`.

Build and Flash to the **B-L475E-IOT01A**.

Open a serial terminal (e.g., PuTTY or Screen) at **115200 baud**.

## 7. Example Output
```Plaintext
--- Launching CSP Relay Chain (SPN Principle) ---
[Sender] Starting stream...
[Receiver] Started ...
[Receiver] Verified up to 100...
[Receiver] Verified up to 200...
...
[Receiver] SUCCESS: All 1000 values verified through 5 relays.
[Sender] Stream complete.
```

## Learning Outcomes
* Implementing multi-stage pipelines in embedded C++.
* Configuring Strategy 4 reentrancy in STM32CubeIDE.
* Managing memory constraints (128KB SRAM) for RTOS-based systems.
* Synchronizing hardware I/O with sequential logic using CSP channels.

## Author
Oliver Faust
