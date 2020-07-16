module aluctrl(aluop, funct, aluctrl)
    input   [1:0]   aluop;
    input   [5:0]   funct;
    output  [3:0]   aluctrl;

    reg     [3:0]   aluctrl;

    if (aluop == 3'b000)
        aluctrl = 3'h2;
    else if (aluop == 3'b001)
        aluctrl = 3'h6;
    else if (aluop == 3'b011)
        aluctrl = 3'h1;
    else if (aluop == 3'b100)
        aluctrl = 3'h4;
    else if (aluop == 3'b010)
        if (funct == 6'bxx0000)
            aluctrl = 3'h2;
        else if (funct == 6'bxx0010)
            aluctrl = 3'h6;
        else if (funct == 6'bxx0100)
            aluctrl = 3'h0;
        else if (funct == 6'bxx0101)
            aluctrl = 3'h1;
        else if (funct == 6'bxx1010)
            aluctrl = 3'h7;
        else if (funct == 6'bxx0110)
            aluctrl = 3'h4;
        else
            aluctrl = 3'hx;
endmodule