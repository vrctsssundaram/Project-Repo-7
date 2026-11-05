# AxisSentinel

Passive AXI-Stream handshake and TKEEP behavior monitor.

## Features

- Beat/frame traffic counters
- Payload stability checks under stall
- Sticky TKEEP and stall-violation diagnostics

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Architecture:** Passive AXI4-Stream protocol monitor with traffic counters and sticky violation flags.

Project owner: Sundaram S S.
