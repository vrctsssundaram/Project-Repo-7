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

**Scope:** A monitor, not an AXI-Stream interposer or exhaustive formal protocol checker.

Project owner: Sundaram S S.
