module axis_protocol_guard #(
    parameter integer DATA_W = 64
) (
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  clear,
    input  wire [DATA_W-1:0]     tdata,
    input  wire [DATA_W/8-1:0]   tkeep,
    input  wire                  tvalid,
    input  wire                  tready,
    input  wire                  tlast,
    output reg  [31:0]           accepted_beats,
    output reg  [31:0]           accepted_frames,
    output reg  [31:0]           error_events,
    output reg                   sticky_stall_error,
    output reg                   sticky_keep_error
);
    localparam integer KEEP_W = DATA_W/8;
    reg previous_stall;
    reg [DATA_W-1:0] held_data;
    reg [KEEP_W-1:0] held_keep;
    reg held_last;
    wire stalled_violation = previous_stall &&
        (!tvalid || tdata != held_data || tkeep != held_keep || tlast != held_last);
    wire keep_noncontiguous = (tkeep == 0) ||
        ((tkeep & (tkeep + {{(KEEP_W-1){1'b0}},1'b1})) != 0);
    wire keep_violation = tvalid &&
        ((!tlast && tkeep != {KEEP_W{1'b1}}) ||
         (tlast && keep_noncontiguous));

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            accepted_beats <= 0;
            accepted_frames <= 0;
            error_events <= 0;
            sticky_stall_error <= 0;
            sticky_keep_error <= 0;
            previous_stall <= 0;
            held_data <= 0;
            held_keep <= 0;
            held_last <= 0;
        end else if (clear) begin
            accepted_beats <= 0;
            accepted_frames <= 0;
            error_events <= 0;
            sticky_stall_error <= 0;
            sticky_keep_error <= 0;
            previous_stall <= 0;
        end else begin
            if (tvalid && tready) begin
                accepted_beats <= accepted_beats + 1;
                if (tlast) accepted_frames <= accepted_frames + 1;
            end
            if (stalled_violation || keep_violation)
                error_events <= error_events + 1;
            if (stalled_violation) sticky_stall_error <= 1;
            if (keep_violation) sticky_keep_error <= 1;
            previous_stall <= tvalid && !tready;
            if (tvalid && !tready) begin
                held_data <= tdata;
                held_keep <= tkeep;
                held_last <= tlast;
            end
        end
    end
endmodule
