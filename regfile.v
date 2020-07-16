module regfile(rs, rt, rd, aluresult, memdata, memtoreg, regwrite, regdst, clk, rst, dout1, dout2);
    input   [25:21] rs;
    input   [20:16] rt;
    input   [15:11] rd;
    input   [31:0]  aluresult;
    input   [31:0]  memdata;
    input           memtoreg;
    input           regwrite;
    input           regdst;
    input           clk;
    input           rst;
    output  [31:0]  dout1;
    output  [31:0]  dout2;

    integer i;
    reg     [31:0]  register[31:0];
    reg     [31:0]  din;

    if (memtoreg)
        din = memdata;
    else
        din = aluresult;

    always @ (posedge clk)
    begin
        if (rst)
            for (i = 0; i < 32; i = i + 1)
                register[i] = 0;
        if (regwrite)
            if (regdst)
                register[rd] = din;
            else
                register[rt] = din;
        dout1 = register[rs];
        dout2 = register[rt];
        register[0] = 0;
    end
    
endmodule