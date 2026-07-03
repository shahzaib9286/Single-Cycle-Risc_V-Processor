# Single-Cycle RISC-V Processor

A single-cycle implementation of a 32-bit RISC-V (RV32I) processor, designed and simulated in Xilinx Vivado. Every instruction is fetched, decoded, executed, and written back within a single clock cycle, making this project a clean reference implementation of the classic single-cycle datapath described in *Digital Design and Computer Architecture (RISC-V Edition)*.

## Overview

This project implements the core datapath and control logic of a RISC-V processor from the ground up in SystemVerilog. It's built as a Vivado project, so the repository includes the full project structure — sources, simulation sets, IP metadata, and generated caches — needed to open, simulate, and (optionally) synthesize the design for an FPGA target.

## Features

- **Single-cycle datapath** — each instruction completes in exactly one clock cycle, simplifying control logic at the cost of a longer critical path.
- **RV32I base instruction support**, including:
  - R-type arithmetic/logic instructions (`add`, `sub`, `and`, `or`, `xor`, `slt`, etc.)
  - I-type instructions (immediate arithmetic, loads, `jalr`)
  - S-type store instructions (`sw`, `sh`, `sb`)
  - B-type branch instructions (`beq`, `bne`, `blt`, `bge`, etc.)
  - U-type and J-type instructions (`lui`, `auipc`, `jal`)
- **Modular architecture** — separate blocks for the Program Counter, Instruction Memory, Register File, ALU, Control Unit, Immediate Generator, and Data Memory, connected through a single top-level datapath module.
- **Testbenches** for functional verification of individual modules and the integrated processor.
- **Vivado-native project** with simulation waveforms (xsim) for behavioral verification.

## Repository Structure

```
├── SIGNLE CYCLE PROCESSOR.srcs/          # RTL source files and testbenches
├── SIGNLE CYCLE PROCESSOR.sim/           # Simulation sets and xsim waveform outputs
├── SIGNLE CYCLE PROCESSOR.hw/            # Hardware/synthesis run artifacts
├── SIGNLE CYCLE PROCESSOR.ip_user_files/ # Generated IP core metadata
├── SIGNLE CYCLE PROCESSOR.cache/         # Vivado project cache
├── SIGNLE CYCLE PROCESSOR.xpr            # Vivado project file (open this in Vivado)
└── README.md
```

## Architecture

The processor follows the standard single-cycle RISC-V datapath:

1. **Instruction Fetch** — the Program Counter addresses Instruction Memory; PC is incremented (or redirected on branch/jump) each cycle.
2. **Instruction Decode** — the opcode, `funct3`/`funct7` fields, and register addresses are extracted; the Control Unit generates all datapath control signals.
3. **Execute** — the ALU performs arithmetic/logic operations or computes branch/memory addresses; the Immediate Generator sign-extends immediates per instruction format.
4. **Memory Access** — load/store instructions read from or write to Data Memory.
5. **Write Back** — results (ALU output, memory data, or PC+4) are written back to the Register File.

## Tools & Requirements

- **Xilinx Vivado** (Design Suite) — used for project management, simulation, and synthesis.
- **SystemVerilog** — primary RTL language for design and testbenches.
- An FPGA development board (optional) if you intend to synthesize and deploy to hardware.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/shahzaib9286/Single-Cycle-Risc_V-Processor.git
   ```
2. Open `SIGNLE CYCLE PROCESSOR.xpr` in Vivado.
3. Run behavioral simulation on the top-level testbench to verify instruction execution via the xsim waveform viewer.
4. (Optional) Run synthesis and implementation if targeting a physical FPGA board.

## Simulation

Testbenches are provided to verify both individual modules (ALU, Register File, Control Unit, etc.) and the fully integrated processor. Simulation waveforms can be inspected directly in Vivado's xsim viewer to trace instruction execution cycle by cycle.

## Motivation

This project was built to gain hands-on experience with computer architecture fundamentals — instruction encoding, datapath design, and control logic — by implementing a working RISC-V core from scratch rather than using a pre-built IP.

## License

No license has been specified for this repository. If you intend for others to use, modify, or distribute this code, consider adding a license file (e.g., MIT or Apache 2.0).

## Acknowledgments

Architecture inspired by the single-cycle RISC-V design presented in *Digital Design and Computer Architecture: RISC-V Edition* by Sarah Harris and David Harris.
