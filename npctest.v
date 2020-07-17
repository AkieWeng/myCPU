`timescale 1ns/1ps

module npctest();
    reg     [31:0]  pc;
    reg     [31:0]  b;
    reg     [25:0]  j;
    reg             branch;
    reg             aluzero;
    reg             jump;
    wire    [31:0]  npc;

    npc U1
    (
        .pc(pc),
        .b(b),
        .j(j),
        .branch(branch),
        .aluzero(aluzero),
        .jump(jump),
        .npc(npc)
    );

    initial
    begin
        pc = 32'h00003000;
        b = 32'h00003200;
        j = 26'b01_00100010_00110010_00000000;

        branch = 0;
        aluzero = 1;
        jump = 1;

        #20
        branch = 1;
        aluzero = 0;
        jump = 1;

        #20
        branch = 0;
        aluzero = 0;
        jump = 1;

        #20
        branch = 1;
        aluzero = 1;
        jump = 1;

        #20
        branch = 0;
        aluzero = 0;
        jump = 0;
    end
endmodule