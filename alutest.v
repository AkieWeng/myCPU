`timescale 1ns/1ps

module alutest();
    reg             alusrc;
    reg     [31:0]  din1;
    reg     [31:0]  dreg;
    reg     [31:0]  dext;
    reg     [ 2:0]  aluctrl;
    wire            aluzero;
    wire    [31:0]  aluresult;

    alu U1
    (
        .alusrc(alusrc),
        .din1(din1),
        .dreg(dreg),
        .dext(dext),
        .aluctrl(aluctrl),
        .aluzero(aluzero),
        .aluresult(aluresult)
    );

    initial
    begin
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h0;
        // 1

        #20
        alusrc = 1;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h0;
        // 0

        #20
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h1;
        // 7

        #20
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h2;
        // 8

        #20
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h4;
        // 6

        #20
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h6;
        // 2

        #20
        alusrc = 0;
        din1 = 5;
        dreg = 3;
        dext = 2;
        aluctrl = 3'h7;
        // 0
    end

endmodule