// S = A'D' + AB'C' + ACD + ABD

module circuito(input A, input B, input C, input D,
                output S);
    wire NOTA, NOTB, NOTC, NOTD;
    wire ANDS1, ANDS2, ANDS3, ANDS4;
    
    not NOT1(NOTA, A);
    not NOT2(NOTB, B);
    not NOT3(NOTC, C);
    not NOT4(NOTD, D);
    
    and AND1(ANDS1, NOTA, NOTD);
    and AND2(ANDS2, A, NOTB, NOTC);
    and AND3(ANDS3, A, C, D);
    and AND4(ANDS4, A, B, D);
    
    or OR1(S, ANDS1, ANDS2, ANDS3, ANDS4);
endmodule

module teste();
    reg A, B, C, D;
    wire S;
    
    circuito CIRC(A, B, C, D, S);
    
    reg [3:0] COUNTER; // contador
    
    initial begin
        $monitor("%b%b%b%b => %b (%d)", A, B, C, D, S, COUNTER);
        
        COUNTER = 0;
        while (COUNTER < 15)
            #1 COUNTER = COUNTER + 1;
    end
    always @ (COUNTER) begin
        A = COUNTER[3];
        B = COUNTER[2];
        C = COUNTER[1];
        D = COUNTER[0];
    end
endmodule