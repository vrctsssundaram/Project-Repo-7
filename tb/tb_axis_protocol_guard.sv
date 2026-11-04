module tb_axis_protocol_guard;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0, clear=0;
    reg [63:0] data=0;
    reg [7:0] keep=0;
    reg valid=0, ready=0, last=0;
    wire [31:0] beats,frames,errors;
    wire stall_error,keep_error;
    axis_protocol_guard dut(.clk(clk),.rst_n(rst_n),.clear(clear),
        .tdata(data),.tkeep(keep),.tvalid(valid),.tready(ready),.tlast(last),
        .accepted_beats(beats),.accepted_frames(frames),.error_events(errors),
        .sticky_stall_error(stall_error),.sticky_keep_error(keep_error));
    task automatic drive(input [63:0] d,input [7:0] k,input v,input r,input l);
        begin
            @(negedge clk); data=d;keep=k;valid=v;ready=r;last=l;
            @(posedge clk); #1;
        end
    endtask
    initial begin
        #23; rst_n=1;
        drive(64'h1234,8'hff,1,1,0);
        drive(64'h5678,8'h0f,1,1,1);
        if (beats!=2 || frames!=1 || errors!=0)
            $fatal(1,"Clean frame counts");
        drive(64'hbeef,8'h03,1,1,0); // TKEEP invalid for non-final beat.
        if (!keep_error || errors!=1) $fatal(1,"TKEEP error not caught");
        drive(64'h1,8'hff,1,0,0); // Hold under backpressure.
        drive(64'h2,8'hff,1,0,0); // Illegal change while stalled.
        if (!stall_error || errors!=2) $fatal(1,"Stall change not caught");
        @(negedge clk); clear=1;valid=0;
        @(posedge clk); #1;
        if (errors!=0 || beats!=0 || frames!=0 || stall_error || keep_error)
            $fatal(1,"Counter clear failed");
        $display("PASS: frame counts, keep rules, stall stability, sticky errors and clear");
        $finish;
    end
    initial begin #10000; $fatal(1,"Watchdog timeout"); end
endmodule
