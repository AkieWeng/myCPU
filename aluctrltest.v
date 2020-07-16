`timescale 1ns/1ps

module aluctrltest();
    reg     [2:0]   aluop;
    reg     [5:0]   funct;
    wire    [2:0]   aluctrl;

    aluctrl U1
    (
        .aluop(aluop),
        .funct(funct),
        .aluctrl(aluctrl)
    );

    initial
    begin
        aluop = 3'b010;
        funct = 6'b100000;
        // 2

        #20
        aluop = 3'b010;
        funct = 6'b100010;
        // 6

        #20
        aluop = 3'b010;
        funct = 6'b100100;
        // 0
        
        #20
        aluop = 3'b010;
        funct = 6'b100101;
        // 1

        #20
        aluop = 3'b010;
        funct = 6'b101010;
        // 7

        #20
        aluop = 3'b010;
        funct = 6'b100110;
        // 4

        #20
        aluop = 3'b000;
        funct = 6'b100110;
        // 2

        #20
        aluop = 3'b001;
        funct = 6'b100110;
        // 6

        #20
        aluop = 3'b011;
        funct = 6'b100110;
        // 1

        #20
        aluop = 3'b100;
        funct = 6'b100110;
        // 4
    end
endmodule