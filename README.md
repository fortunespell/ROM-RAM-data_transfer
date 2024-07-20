# ROM-RAM-data_transfer
This program demonstrates array copying and exchange operations in ARM assembly language.

**Features:**

* **Stack Setup:** Defines a stack with 256 bytes of memory.
* **Vector Table:** Sets up a basic vector table with the reset handler address.
* **ROM Arrays:** Initializes two arrays (ROMARRAY1 and ROMARRAY2) in ROM memory.
* **RAM Arrays:** Allocates space for two arrays (ARRAY1 and ARRAY2) in RAM memory.
* **Array Copying:** Copies the contents of ROMARRAY2 to ARRAY2 in RAM.
* **Array Exchange:** Exchanges the elements of ARRAY1 and ARRAY2 in RAM.

**Code Structure:**

* **AREA RESET:** Defines the reset vector table.
* **AREA tempData:** Contains the initialized ROM arrays.
* **AREA .data:** Allocates space for the RAM arrays.
* **AREA .text:** Contains the main program code.

**Instructions:**

* **MOV:** Moves immediate values or register contents.
* **LDR:** Loads data from memory into a register.
* **STR:** Stores data from a register into memory.
* **SUBS:** Subtracts a value from a register and sets flags.
* **BNE:** Branches if the zero flag is not set.
* **STOP:** Halts program execution.

**Explanation:**

1. **Initialization:** The program initializes the stack pointer and sets up the vector table.
2. **Array Copying:** The `MEMCPY_LOOP` copies the elements of ROMARRAY2 to ARRAY2 in RAM.
3. **Array Exchange:** The `EXCH_LOOP` exchanges the elements of ARRAY1 and ARRAY2 in RAM.

**Notes:**

* This is a basic example and can be extended with more complex operations.
* The code assumes a specific ARM architecture and memory map.
* You may need to adjust the code based on your target platform.
