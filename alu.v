module alu(alusrc, din1, dreg, dext, aluctrl, aluzero, aluresult);
    input           alusrc;
    input   [31:0]  din1;
    input   [31:0]  dreg;
    input   [31:0]  dext;
    input   [2:0]   aluctrl;
    output          aluzero;
    output  [31:0]  aluresult;

    wire    [31:0]  din2;

    assign din2 = alusrc ? dext : dreg;

    assign aluresult = 
        aluctrl == 3'h0 ? din1 & din2 :
        aluctrl == 3'h1 ? din1 | din2 :
        aluctrl == 3'h2 ? din1 + din2 :
        aluctrl == 3'h4 ? din1 ^ din2 :
        aluctrl == 3'h6 ? din1 - din2 :
        aluctrl == 3'h7 ? (din1 < din2 ? 1 : 0):
                          32'hxxxxxxxx;

    assign aluzero = aluresult ? 0 : 1;
endmodule