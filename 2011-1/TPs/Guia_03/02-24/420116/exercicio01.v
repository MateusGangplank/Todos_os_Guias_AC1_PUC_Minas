// FAVOR COLOCAR NOME E MATRICULA

module half_adder(output S, output C,
                input A, input B);
    // Obtem S
    wire SN1, SN2;
    wire SA1, SA2;
    not NOT1(SN1, A);
    not NOT2(SN2, B);
    and AND1(SA1, SN1, B);
    and AND2(SA2, SN2, A);
    or OR1(S, SA1, SA2);
    
    // Obtem C
    and AND3(C, A, B);
endmodule

module teste();
    reg A, B;
    wire S, C;
    half_adder ADDER(S, C, A, B);
    
    initial begin
        $display("A B S C");
        $monitor("%b %b %b %b", A, B, S, C);
        A = 0; B = 0; // 0
        #1 A = 0; B = 1; // 1;
        #1 A = 1; B = 0; // 2;
        #1 A = 1; B = 1; // 3;
    end
endmodule