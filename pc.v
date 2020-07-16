module pc(npc, clk, rst, pc)
    input   [31:0]  npc;
    input           clk;
    input           rst;
    output  [31:0]  pc;

    reg     [31:0]  pc;

    always @ (posedge clk)
    begin
        if(rst)
            pc = 32'h00003000;
        else
            pc = npc;
    end

endmodule