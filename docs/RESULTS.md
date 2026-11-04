# Verification record

Date: 05 November 2026
Source revision tested: `a527f7cb1131ce25449695b610900dce9a2116c1`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-7/actions/runs/41902460245
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-7/actions/runs/41902460273

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | frame counts, keep rules, stall stability, sticky errors and clear |
| Generic Yosys synthesis | **PASS**; 700 technology-independent cells |
| Device-specific FPGA/ASIC utilization | **Not measured** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.

The generic cell count is obtained from the cited Yosys `stat` output and is not an FPGA LUT estimate, ASIC area, or a timing result.
