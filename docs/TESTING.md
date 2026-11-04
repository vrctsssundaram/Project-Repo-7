# Test procedure

Run `make test` and confirm `PASS` plus a zero process exit.

Directed tests cover two-beat frame counts, bad non-final TKEEP, a stalled-payload change, sticky flags and clear.

Extend with random stall timing, assertion coverage, legal parameter widths, malformed TLAST sequences and integration to the target bus.
