# AxisSentinel

Passive AXI4-Stream protocol and integrity monitor with accepted-beat/frame counters and sticky error registers.

The monitor checks ready/valid backpressure stability and standard contiguous TKEEP usage. It never modifies or delays the observed bus. Run `make test` to exercise protocol violations and counter clear.

Project owner: Sundaram S S.
