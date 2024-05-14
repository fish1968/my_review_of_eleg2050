# Reason of this project

To review basic logic elements noticed in ELEG2050 by writing correlated verilog files.

# How to use
Copy one testbench file from tb folder to its parent dir (which includes relevent .v module files)

- run make commands (inside powershell) at the parent dir
```powershell
make run
make show
make clean
```

- remove testbench file 
Make sure the testbench file is a copy
```powershell
make rm_tb
```
# environment

Make sure iverilog.exe, vvp, and gtkwave.exe are within your path.

If you have xilinx vivado installed, you may be able to find vvp at some place within vivado's program folders.

```powershell
iverilog
vvp
gtkwave
```
