If you want to check test_bench or rtl code, you can:
1. Access module file
2. Open terminal and move to the module file path by using "cd"
	Ex: cd ~/Desktop/Homework3/alu_2bit/sim
3. Access to sim folder
4. Using command on terminal to run:
	make all: run all
	make build: build the rtl code and check the stimulation
	make wave: open the wave form
	make clean: clear all the file created after run make build

** terminal must access to the sim folder of module that you want to run
** rtl is where to contain the module Verilog code
** tb is where to contain the stimulation Verilog code