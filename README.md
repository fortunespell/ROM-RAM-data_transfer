# ARM Assembly Program for Data Manipulation

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Use Cases](#use-cases)
4. [Code Breakdown](#code-breakdown)
   - [Stack and Vector Table](#stack-and-vector-table)
   - [Arrays](#arrays)
   - [Data Copying and Swapping](#data-copying-and-swapping)
5. [Instructions](#instructions)
6. [Build and Run](#build-and-run)
7. [Memory Map](#memory-map)
8. [Advantages of Assembly over C](#advantages-of-assembly-over-c)
9. [License](#license)

## Overview
This project demonstrates basic data manipulation in ARM assembly, including copying and swapping array data between ROM and RAM. The program defines the stack, initializes ROM and RAM arrays, and includes routines to copy and exchange data between these arrays. The primary objective of this project is to illustrate the fundamental operations of memory management and data manipulation at a low level using assembly language. By performing these operations, the project showcases the efficiency and control that assembly language provides over hardware resources. The following code is executed on ARM-KEIL and is for ARM based STM32 microcontrollers.

![image](https://github.com/user-attachments/assets/b7586d3c-71bd-42b1-bb2b-22894d1db77c)

## Features
- **Stack Setup**: Defines and initializes the stack memory.
- **Interrupt Vector Table**: Sets up the stack pointer and reset handler in the vector table.
- **ROM Arrays**: Initializes two arrays in read-only memory (ROM).
- **RAM Arrays**: Allocates space for two arrays in read-write memory (RAM).
- **Copy Routine**: Copies data from a ROM array to a corresponding RAM array.
- **Exchange Routine**: Swaps the contents between two RAM arrays.

## Use Cases
- **Embedded Systems**: Useful in low-level embedded systems where direct memory manipulation is required.
- **Performance-Critical Applications**: Ideal for applications that demand high performance and low-level control over hardware.
- **Resource-Constrained Environments**: Suitable for systems with limited processing power and memory, where assembly can optimize resource usage.
- **Educational Purposes**: A great example for learning about data manipulation at a low level, which is beneficial for understanding computer architecture.

## Code Breakdown

### Stack and Vector Table
- **Stack**: The stack is initialized with a size of 256 bytes.
- **Vector Table**: Sets up the stack pointer and reset handler for the system.

### Arrays
- **ROM Arrays**: Two arrays (`ROMARRAY1` and `ROMARRAY2`) are initialized in ROM with predefined values.
- **RAM Arrays**: Two arrays (`ARRAY1` and `ARRAY2`) are allocated in RAM for manipulation.

### Data Copying and Swapping
- **Data Copy**: A loop copies data from `ROMARRAY2` to `ARRAY2` in RAM, working from the end of the arrays to the beginning.
- **Data Exchange**: A loop exchanges values between `ARRAY1` and `ARRAY2` in RAM, element by element.

## Instructions
1. The program begins by initializing the stack and setting the interrupt vector table.
2. The `Reset_Handler` function is the entry point, starting the data copy and exchange routines.
3. The copy loop transfers data from `ROMARRAY2` to `ARRAY2`.
4. The exchange loop swaps the contents of `ARRAY1` and `ARRAY2`.

## Build and Run
To assemble and run this program:
1. Use an ARM assembler to compile the `.s` file.
2. Load the binary onto an ARM Cortex-M processor or simulator.
3. Observe the memory regions to verify the data copying and swapping operations.

## Memory Map
- **Stack**: Starts at `0x00000100`.
- **ROM Arrays**: Defined in read-only memory with preset values.
- **RAM Arrays**: Allocated 32 bytes each for manipulation.

## Advantages of Assembly over C
- **Performance**: Assembly language can be more efficient than C due to reduced overhead and fine-tuned control over hardware resources, leading to faster execution times.
- **Memory Management**: Assembly allows for precise control over memory layout and management, which can lead to better optimization in resource-constrained systems.
- **Size Optimization**: Assembly code can be smaller in size than the equivalent C code, which is crucial in embedded systems with limited memory.
- **Hardware Access**: Direct access to hardware and registers can be achieved more easily in assembly, making it preferable for low-level programming tasks.

## License
This project is open-source and available under the MIT License.
