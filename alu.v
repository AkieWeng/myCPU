module alu(alusrc, din1, dreg, dext, aluctrl, aluzero, aluresult)
    input           alusrc;
    input   [31:0]  din1;
    input   [31:0]  dreg;
    input   [31:0]  dext;
    input   [3:0]   aluctrl;
    output          aluzero;
    output  [31:0]  aluresult;

    reg     [31:0]  din2;
    
    if (alusrc)
        din2 = dext;
    else
        din2 = dreg;

    if (aluctrl == 3'h0)
        aluresult = din1 & din2;
    else if (aluctrl == 3'h1)
        aluresult = din1 | din2;
    else if (aluctrl == 3'h2)
        aluresult = din1 + din2;
    else if (aluctrl == 3'h4)
        aluresult = din1 ^ din2;
    else if (aluctrl == 3'h6)
        aluresult = din1 - din2;
    else if (aluctrl == 3'h7)
        if (din1 < din2)
            aluresult = 1;
        else
            aluresult = 0;
    else
        aluresult = 32'hxxxxxxxx;

    if (aluresult == 0)
        aluzero = 1;
    else
        aluzero = 0;
endmodule