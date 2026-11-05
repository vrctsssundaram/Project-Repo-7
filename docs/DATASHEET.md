# Interface summary

| Signal | Meaning |
|---|---|
| `DATA_W` | Stream data width, byte multiple, default 64 |
| `tdata/tkeep/tvalid/tready/tlast` | Observed AXI4-Stream signals |
| `accepted_beats` | Completed data handshakes |
| `accepted_frames` | Completed TLAST handshakes |
| `error_events` | Cycles with one or more detected violations |
| `sticky_stall_error` | Stable-while-stalled violation |
| `sticky_keep_error` | Incorrect TKEEP pattern |
| `clear` | Synchronous counter and sticky-flag clear |

Passive, observation-only connection to the monitored AXI4-Stream bus.
