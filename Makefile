IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_axis_protocol_guard -o build/sim rtl/axis_protocol_guard.sv tb/tb_axis_protocol_guard.sv
	$(VVP) build/sim
