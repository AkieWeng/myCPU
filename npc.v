module npc(pc, b, j, branch, aluzero, jump, npc);
    input   [31:0]  pc;
    input   [31:0]  b;
    input   [25:0]  j;
    input           branch;
    input           aluzero;
    input           jump;
    output  [31:0]  npc;

    reg     [31:0]  npc;
    reg     [31:0]  pc4;
    reg     [31:0]  jpc;
    reg     [31:0]  bpc;

    assign pc4 = pc + 4;
    assign jpc = {pc4[31:28], j << 2};
    assign bpc = b<<2 + pc4;

    if (!jump)
        npc = jpc;
    else if (branch & aluzero)
        npc = bpc;
    else
        npc = pc4;

endmodule