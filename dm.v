module dm_4k(addr, din, memwrite, memread, clk, dout)
    input   [11:2]  addr;
    input   [31:0]  din;
    input           memwrite;
    input           memread;
    input           clk;
    output  [31:0]  dout;

    reg     [31:0]  dm[1023:0];

    always @ (posedge clk)
    begin
        if (memwrite)
            dm[addr] = din;
        if (memread)
            dout = dm[addr];
    end

endmodule