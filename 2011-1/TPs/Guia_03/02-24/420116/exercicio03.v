module half_subtractor_nand(output S, output BOUT,
                    input A, input B);
    wire S1, S2, S3, S4, S5;
    
    // Obtem S
    nand NAND1(S1, A, A);
    nand NAND2(S2, B, B);
    nand NAND3(S3, S1, B);
    nand NAND4(S4, S2, A);
    nand NAND5(S, S3, S4);
    
    // Obtem C
    nand NAND6(S5, S1, B);
    nand NAND7(BOUT, S5, S5);
endmodule

module teste();
    reg A, B;
    wire S, BOUT;
    half_subtractor_nand ADDER(S, BOUT, A, B);
    
    initial begin
        $display("A B S BOUT");
        $monitor("%b %b %b %b", A, B, S, BOUT);
        A = 0; B = 0; // 0
        #1 A = 0; B = 1; // 1;
        #1 A = 1; B = 0; // 2;
        #1 A = 1; B = 1; // 3;
    end
endmodule