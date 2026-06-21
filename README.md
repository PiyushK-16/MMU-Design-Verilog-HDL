# MMU-Design-Verilog-HDL
# Memory Management Unit (MMU) Design using Verilog HDL

## Overview
This project implements a simplified Memory Management Unit (MMU) in Verilog HDL that performs virtual-to-physical address translation using a page table with protection and validity checks. The design is verified using EDA Playground simulation.

---

## Features
- 16-bit virtual address support  
- Page table based translation  
- Valid bit checking  
- Read/Write permission control  
- Page fault detection  
- Protection fault detection  
- Fully combinational RTL design  

---

## Architecture

Virtual Address → Page Number + Offset  
↓  
Page Table Lookup  
↓  
Valid Check  
↓  
Permission Check  
↓  
Physical Address / Fault Generation  

---

## Address Format

Virtual Address (16-bit):
- [15:8] Page Number  
- [7:0]  Offset  

Physical Address (16-bit):
- [15:8] Frame Number  
- [7:0]  Offset  

---

## Outputs
- `phys_addr` → Translated physical address  
- `page_fault` → Invalid page access  
- `protection_fault` → Unauthorized write access  
- `translation_valid` → Successful translation  

---

## Simulation
Tool: EDA Playground  
Simulator: Icarus Verilog / QuestaSim  
Waveform Viewer: EPWave  

Steps:
1. Paste RTL and testbench
2. Enable EPWave
3. Run simulation
4. Observe waveform outputs

---

## Test Cases
- Valid read access → Success  
- Valid write access → Success  
- Invalid page → Page fault  
- Write on read-only page → Protection fault  

---

## Project Structure
MMU-Design-Verilog-HDL/
├── rtl/
├── tb/
├── simulation/
├── waveforms/
├── images/
├── docs/
└── README.md

---

## Key Learnings
- Virtual memory concepts  
- Page table implementation  
- RTL design in Verilog  
- Fault handling logic  
- Simulation using EDA tools  

---

## Future Scope
- Add TLB (cache for page table)
- Multi-level paging
- FPGA implementation
- Pipeline MMU design

---

## Author
Piyush k Ahirwar – Digital Design / VLSI
