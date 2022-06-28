# shift-regs-8-bits
## About the project:
- A fully featured 8-bit shift register in VHDL.
- Inputs: clock signal, reset, RIN, LIN, parallel_in bus and control bits.
- Output: Q (8-bits bus where bit 0 is from the first register)
- The register has a 3-bit control input to allow it to perform certain functions.

## Functions the register can do:

| control | function  |
|--|--|
| 0 | hold the previous register value |
| 1 | load in parallel |
| 2 | shift bits right (lowest bit is lost, highest is given from serial input) |
| 3 | shift left |
| 4 | rotate right (lowest bit becomes new highest bit) |
| 5 | rotate left |
| 6 | arithmetic shift right (binary number retains its sign) |
| 7 | arithmetic shift right |


## What I did I learn from this:
- Using case statement in VHDL.
- Using unsigned signals
- Including case statements into a process.
