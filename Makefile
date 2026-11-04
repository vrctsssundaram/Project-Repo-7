IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_axis_protocol_guard -o build/sim rtl/axis_protocol_guard.sv tb/tb_axis_protocol_guard.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/axis_protocol_guard.sv; hierarchy -check -top axis_protocol_guard; synth -top axis_protocol_guard; stat'
