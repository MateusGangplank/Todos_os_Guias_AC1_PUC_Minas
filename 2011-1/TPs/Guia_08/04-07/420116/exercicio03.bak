// S = AB'C'D + A'C'D' + ACD' + B'E + CE

module circuito(input A, input B, input C, input D, input E,
                output S);
    wire NOTA, NOTB, NOTC, NOTD;
    wire ANDS1, ANDS2, ANDS3, ANDS4, ANDS5;
    
    not NOT1(NOTA, A);
    not NOT2(NOTB, B);
    not NOT3(NOTC, C);
    not NOT4(NOTD, D);
    
    and AND1(ANDS1, A, NOTB, NOTC, D);
    and AND2(ANDS2, NOTA, NOTC, NOTD);
    and AND3(ANDS3, A, C, NOTD);
    and AND4(ANDS4, NOTB, E);
    and AND5(ANDS5, C, E);
    
    or OR1(S, ANDS1, ANDS2, ANDS3, ANDS4, ANDS5);
endmodule

module teste();
    reg A, B, C, D, E;
    wire S;
    
    circuito CIRC(A, B, C, D, E, S);
    
    reg [4:0] COUNTER; // contador
    
    initial begin
        $monitor("%b%b%b%b%b => %b (%d)", A, B, C, D, E, S, COUNTER);
        
        COUNTER = 0;
        while (COUNTER < 31)
            #1 COUNTER = COUNTER + 1;
    end
    always @ (COUNTER) begin
        A = COUNTER[4];
        B = COUNTER[3];
        C = COUNTER[2];
        D = COUNTER[1];
        E = COUNTER[0];
    end
endmodule