include makefile.f

all: build run

build:
	@echo "=== Building all RTL + Testbench files ==="
	@iverilog -o $(OUT) $(RTL_FILES) $(TB_FILES)

run:
	@echo "=== Running simulation ==="
	@vvp $(OUT)

wave:
	@echo "=== Running simulation and opening waveform ==="
	@vvp $(OUT)
	@gtkwave wave.vcd &

clean:
	@echo "=== Cleaning project ==="
	@rm -f $(OUT) wave.vcd

.PHONY: all build run wave clean
