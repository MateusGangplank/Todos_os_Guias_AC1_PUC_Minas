// Modulo da porta NAND
module NAND(input A, input B,
            output S);
    assign S = ~(A & B);
endmodule

// Modulo da porta NOT
module NOT(input A, 
        output S);
    NAND NAND1(A, A, S);
endmodule

// Modulo de testes
module teste();
    reg A;
    wire S;
    NOT NOT1(A, S);
    
    initial begin
        $display("A S");
        $monitor("%b %b", A, S);
        A = 0; // 0
        #1 A = 1; // 1
    end
endmodule