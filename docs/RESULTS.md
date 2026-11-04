# Verification record

Date: 04 November 2026
Source revision tested: `4fc033c4dbd1c321c3ff354d76a5380fc14eca3a`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-7/actions/runs/41870640372

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | frame counts, keep rules, stall stability, sticky errors and clear |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
