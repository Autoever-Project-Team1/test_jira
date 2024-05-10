################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AppScheduling.c \
../Blinky_LED.c \
../Cpu0_Main.c \
../Cpu1_Main.c \
../Cpu2_Main.c \
../Driver_ADC.c \
../Driver_STM.c \
../Encoder.c \
../GPT12.c \
../GtmTomPwm.c \
../Motor.c \
../PID_Controller.c \
../Trajectory.c \
../asclin.c 

COMPILED_SRCS += \
./AppScheduling.src \
./Blinky_LED.src \
./Cpu0_Main.src \
./Cpu1_Main.src \
./Cpu2_Main.src \
./Driver_ADC.src \
./Driver_STM.src \
./Encoder.src \
./GPT12.src \
./GtmTomPwm.src \
./Motor.src \
./PID_Controller.src \
./Trajectory.src \
./asclin.src 

C_DEPS += \
./AppScheduling.d \
./Blinky_LED.d \
./Cpu0_Main.d \
./Cpu1_Main.d \
./Cpu2_Main.d \
./Driver_ADC.d \
./Driver_STM.d \
./Encoder.d \
./GPT12.d \
./GtmTomPwm.d \
./Motor.d \
./PID_Controller.d \
./Trajectory.d \
./asclin.d 

OBJS += \
./AppScheduling.o \
./Blinky_LED.o \
./Cpu0_Main.o \
./Cpu1_Main.o \
./Cpu2_Main.o \
./Driver_ADC.o \
./Driver_STM.o \
./Encoder.o \
./GPT12.o \
./GtmTomPwm.o \
./Motor.o \
./PID_Controller.o \
./Trajectory.o \
./asclin.o 


# Each subdirectory must supply rules for building sources it contributes
%.src: ../%.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING C/C++ Compiler'
	cctc -cs --dep-file="$(basename $@).d" --misrac-version=2004 -D__CPU__=tc27xd "-fC:/Users/user/AURIX-v1.9.20-workspace/TC275_LED_Project001/TriCore Debug (TASKING)/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc27xd -Y0 -N0 -Z0 -o "$@" "$<" && \
	if [ -f "$(basename $@).d" ]; then sed.exe -r  -e 's/\\/\//g' -e 's/\/\//\//g' -e 's/"//g' -e 's/([a-zA-Z]:\/)/\L\1/g' -e 's/\d32:/@TARGET_DELIMITER@/g; s/\\\d32/@ESCAPED_SPACE@/g; s/\d32/\\\d32/g; s/@ESCAPED_SPACE@/\\\d32/g; s/@TARGET_DELIMITER@/\d32:/g' "$(basename $@).d" > "$(basename $@).d_sed" && cp "$(basename $@).d_sed" "$(basename $@).d" && rm -f "$(basename $@).d_sed" 2>/dev/null; else echo 'No dependency file to process';fi
	@echo 'Finished building: $<'
	@echo ' '

AppScheduling.o: ./AppScheduling.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Blinky_LED.o: ./Blinky_LED.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Cpu0_Main.o: ./Cpu0_Main.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Cpu1_Main.o: ./Cpu1_Main.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Cpu2_Main.o: ./Cpu2_Main.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Driver_ADC.o: ./Driver_ADC.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Driver_STM.o: ./Driver_STM.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Encoder.o: ./Encoder.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

GPT12.o: ./GPT12.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

GtmTomPwm.o: ./GtmTomPwm.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Motor.o: ./Motor.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

PID_Controller.o: ./PID_Controller.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Trajectory.o: ./Trajectory.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

asclin.o: ./asclin.src subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./AppScheduling.d ./AppScheduling.o ./AppScheduling.src ./Blinky_LED.d ./Blinky_LED.o ./Blinky_LED.src ./Cpu0_Main.d ./Cpu0_Main.o ./Cpu0_Main.src ./Cpu1_Main.d ./Cpu1_Main.o ./Cpu1_Main.src ./Cpu2_Main.d ./Cpu2_Main.o ./Cpu2_Main.src ./Driver_ADC.d ./Driver_ADC.o ./Driver_ADC.src ./Driver_STM.d ./Driver_STM.o ./Driver_STM.src ./Encoder.d ./Encoder.o ./Encoder.src ./GPT12.d ./GPT12.o ./GPT12.src ./GtmTomPwm.d ./GtmTomPwm.o ./GtmTomPwm.src ./Motor.d ./Motor.o ./Motor.src ./PID_Controller.d ./PID_Controller.o ./PID_Controller.src ./Trajectory.d ./Trajectory.o ./Trajectory.src ./asclin.d ./asclin.o ./asclin.src

.PHONY: clean--2e-

