# DigitalSystemDesign
A repository for containing sample projects of Digital System Design using verilog HDL and Icarus HDL compiler.

## Tech Stack
- HDL: verilog
- compiler: icarus verilog (iverilog)
- wave form visualizer: GTKWave

## Design process

1. Module Block Diagram's (on paper)
2. Module Logic (on paper)
- 2.1. Truth Table
- 2.2. Boolean Algebra
- 2.3. Logic Diagram

3. Write Verilog based on on paper design
4. Write Test Bench based on Truth Table for module design
5. Compile verilog and run test bench.

```bash
iverilog -o out_name verilog_source.v verilog_source_tb.v
```

6. Analyse wave viewer 

First we generate the vcd file for compilation which is the simulation runtime 
engine output.
```bash 
vvp out_name
```

view the waves in waveform viewer GTKWave

```bash
gtkwave out.vcd
```

now we can analyse the code works as expected. 

