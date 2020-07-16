module aluctrl(aluop, funct, aluctrl);
    input   [1:0]   aluop;
    input   [5:0]   funct;
    output  [3:0]   aluctrl;

    assign aluctrl =
        aluop == 3'b000 ? 3'h2 :
        aluop == 3'b001 ? 3'h6 :
        aluop == 3'b011 ? 3'h1 :
        aluop == 3'b100 ? 3'h4 :
        aluop == 3'b010 ?
        (
            funct == 6'xx0000 ? 3'h2 :
            funct == 6'xx0010 ? 3'h6 :
            funct == 6'xx0100 ? 3'h0 :
            funct == 6'xx0101 ? 3'h1 :
            funct == 6'xx1010 ? 3'h7 :
            funct == 6'xx0110 ? 3'h4 :
                                3'hx
        ) : 3'hx;
endmodule