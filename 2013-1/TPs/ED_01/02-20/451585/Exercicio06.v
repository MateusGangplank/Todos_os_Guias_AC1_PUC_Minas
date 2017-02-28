// ---------------------
// Exercicio 06  - XOR
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- xor gate
// ---------------------
module xorgate (output s, input p, input q);

    assign s = ( (~(p) & q) | (p & ~(q)) );

endmodule


// ---------------------
// -- test xorgate
// ---------------------
module testxorgate;

    reg a, b;
    wire s;

    xorgate XOR1 (s, a, b);

    initial begin:main
        $display("test xor:");
        $display("\n  ( (~(p) & q) | (p & ~(q)) ) = s \n");
        $monitor(" ( (~(%b) & %b) | (%b & ~(%b)) )", a, b, a, b, s);

        a = 0;
        b = 0;

        #1  a = 0;    b = 1;
        #1  a = 1;    b = 0;
        #1  a = 1;    b = 1;
    end

endmodule
