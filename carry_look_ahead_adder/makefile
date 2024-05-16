# Verilog source files
SRCS = *.v

#tb file type
TB_FILE = *tb.v
#tb folder
TB_FOLDER = tb
# Compiler and simulator settings
COMPILER = iverilog
SIMULATOR = vvp
SIM_OPTIONS = -n
# VVP file
VVP_FILE = simulation.vvp
# waveform file
VCD_FILE = *.vcd
# waveform viewer
GTKWAVE = gtkwave
# Default target
all: $(VVP_FILE)
# Compile Verilog source files and generate VVP file
$(VVP_FILE): $(SRCS)
	$(COMPILER) -o $(VVP_FILE) $(SRCS)

# Run simulation
run: $(VVP_FILE)
	$(SIMULATOR) $(SIM_OPTIONS) $(VVP_FILE)

show: $(VCD_FILE)
	$(GTKWAVE) $(VCD_FILE)
# Clean generated files
clean:
	del $(VVP_FILE) $(VCD_FILE)

rm_tb:
	del $(TB_FILE) 
.PHONY: all run clean
