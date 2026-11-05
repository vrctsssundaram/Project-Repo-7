# Technical design

Accepted transfers increment the beat counter. A transferred TLAST marks a completed frame. When TVALID is asserted while TREADY is low, the monitor retains TDATA/TKEEP/TLAST and checks that TVALID and payload controls remain stable on the following clock.

For each non-final beat, TKEEP must contain all ones. For the final beat, valid bytes must form a nonempty contiguous mask starting at lane zero. Violations set sticky flags and increment the error-event count.

The monitor counts completed frames on accepted TLAST transfers and reports local AXI4-Stream handshake and TKEEP protocol observations.
