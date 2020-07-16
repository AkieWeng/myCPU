module aluctrl(aluop, funct, aluctrl);
    input   [2:0]   aluop;
    input   [5:0]   funct;
    output  [2:0]   aluctrl;

    assign aluctrl =
        aluop == 3'b000 ? 3'h2 :
        aluop == 3'b001 ? 3'h6 :
        aluop == 3'b011 ? 3'h1 :
        aluop == 3'b100 ? 3'h4 :
        aluop == 3'b010 ?
        (
            funct == 6'b100000 ? 3'h2 :
            funct == 6'b100010 ? 3'h6 :
            funct == 6'b100100 ? 3'h0 :
            funct == 6'b100101 ? 3'h1 :
            funct == 6'b101010 ? 3'h7 :
            funct == 6'b100110 ? 3'h4 :
                                3'hx
        ) : 3'hx;
endmodule