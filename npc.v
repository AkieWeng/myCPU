module npc(pc, b, j, branch, aluzero, jump, npc);
    input   [31:0]  pc;
    input   [31:0]  b;
    input   [25:0]  j;
    input           branch;
    input           aluzero;
    input           jump;
    output  [31:0]  npc;

    wire    [31:0]  pc4;
    wire    [27:0]  j2;
    wire    [31:0]  jpc;
    wire    [31:0]  bpc;

    assign pc4 = pc + 4;
    assign j2 = j << 2;
    assign jpc = {{pc4[31:28]}, j2};
    assign bpc = (b << 2) + pc4;

    assign npc =
        !jump               ? jpc :
        branch & aluzero    ? bpc :
                              pc4;
endmodule