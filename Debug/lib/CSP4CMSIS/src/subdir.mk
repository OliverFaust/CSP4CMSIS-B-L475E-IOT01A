################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/CSP4CMSIS/src/alt_channel_sync.cpp \
../lib/CSP4CMSIS/src/alternative.cpp \
../lib/CSP4CMSIS/src/barrier.cpp \
../lib/CSP4CMSIS/src/buffered_channel.cpp \
../lib/CSP4CMSIS/src/channel_sync.cpp \
../lib/CSP4CMSIS/src/csp_wrapper.cpp \
../lib/CSP4CMSIS/src/glue.cpp \
../lib/CSP4CMSIS/src/kernel.cpp \
../lib/CSP4CMSIS/src/sync_channel.cpp 

OBJS += \
./lib/CSP4CMSIS/src/alt_channel_sync.o \
./lib/CSP4CMSIS/src/alternative.o \
./lib/CSP4CMSIS/src/barrier.o \
./lib/CSP4CMSIS/src/buffered_channel.o \
./lib/CSP4CMSIS/src/channel_sync.o \
./lib/CSP4CMSIS/src/csp_wrapper.o \
./lib/CSP4CMSIS/src/glue.o \
./lib/CSP4CMSIS/src/kernel.o \
./lib/CSP4CMSIS/src/sync_channel.o 

CPP_DEPS += \
./lib/CSP4CMSIS/src/alt_channel_sync.d \
./lib/CSP4CMSIS/src/alternative.d \
./lib/CSP4CMSIS/src/barrier.d \
./lib/CSP4CMSIS/src/buffered_channel.d \
./lib/CSP4CMSIS/src/channel_sync.d \
./lib/CSP4CMSIS/src/csp_wrapper.d \
./lib/CSP4CMSIS/src/glue.d \
./lib/CSP4CMSIS/src/kernel.d \
./lib/CSP4CMSIS/src/sync_channel.d 


# Each subdirectory must supply rules for building sources it contributes
lib/CSP4CMSIS/src/%.o lib/CSP4CMSIS/src/%.su lib/CSP4CMSIS/src/%.cyclo: ../lib/CSP4CMSIS/src/%.cpp lib/CSP4CMSIS/src/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"/home/oliver/GitHub/CSP4CMSIS-B-L475E-IOT01A/lib/CSP4CMSIS/include" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lib-2f-CSP4CMSIS-2f-src

clean-lib-2f-CSP4CMSIS-2f-src:
	-$(RM) ./lib/CSP4CMSIS/src/alt_channel_sync.cyclo ./lib/CSP4CMSIS/src/alt_channel_sync.d ./lib/CSP4CMSIS/src/alt_channel_sync.o ./lib/CSP4CMSIS/src/alt_channel_sync.su ./lib/CSP4CMSIS/src/alternative.cyclo ./lib/CSP4CMSIS/src/alternative.d ./lib/CSP4CMSIS/src/alternative.o ./lib/CSP4CMSIS/src/alternative.su ./lib/CSP4CMSIS/src/barrier.cyclo ./lib/CSP4CMSIS/src/barrier.d ./lib/CSP4CMSIS/src/barrier.o ./lib/CSP4CMSIS/src/barrier.su ./lib/CSP4CMSIS/src/buffered_channel.cyclo ./lib/CSP4CMSIS/src/buffered_channel.d ./lib/CSP4CMSIS/src/buffered_channel.o ./lib/CSP4CMSIS/src/buffered_channel.su ./lib/CSP4CMSIS/src/channel_sync.cyclo ./lib/CSP4CMSIS/src/channel_sync.d ./lib/CSP4CMSIS/src/channel_sync.o ./lib/CSP4CMSIS/src/channel_sync.su ./lib/CSP4CMSIS/src/csp_wrapper.cyclo ./lib/CSP4CMSIS/src/csp_wrapper.d ./lib/CSP4CMSIS/src/csp_wrapper.o ./lib/CSP4CMSIS/src/csp_wrapper.su ./lib/CSP4CMSIS/src/glue.cyclo ./lib/CSP4CMSIS/src/glue.d ./lib/CSP4CMSIS/src/glue.o ./lib/CSP4CMSIS/src/glue.su ./lib/CSP4CMSIS/src/kernel.cyclo ./lib/CSP4CMSIS/src/kernel.d ./lib/CSP4CMSIS/src/kernel.o ./lib/CSP4CMSIS/src/kernel.su ./lib/CSP4CMSIS/src/sync_channel.cyclo ./lib/CSP4CMSIS/src/sync_channel.d ./lib/CSP4CMSIS/src/sync_channel.o ./lib/CSP4CMSIS/src/sync_channel.su

.PHONY: clean-lib-2f-CSP4CMSIS-2f-src

