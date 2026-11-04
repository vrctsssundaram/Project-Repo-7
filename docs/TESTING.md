# Test procedure

Run `make test` and confirm `PASS` plus a zero process exit.

Directed tests cover two-beat frame counts, bad non-final TKEEP, a stalled-payload change, sticky flags and clear.

Extend with random stall timing, assertion coverage, legal parameter widths, malformed TLAST sequences and integration to the target bus.

Run `make synth` with Yosys installed to reproduce the generic RTL synthesis check. Hardware placement, timing and power remain separate.
