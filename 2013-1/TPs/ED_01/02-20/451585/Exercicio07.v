// ---------------------
// Exercicio 07  - XNOR
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- xnor gate
// ---------------------
module xnorgate (output s, input p, input q);

    assign s = ( (p & q) | (~(p) & ~(q)) );

endmodule


// ---------------------
// -- test xnorgate
// ---------------------
module testxnorgate;

    reg a, b;
    wire s;

    xnorgate XNOR1 (s, a, b);

    initial begin:main
        $display("test xnor:");
        $display("\n ( (p & q) | (~(p) & ~(q)) ) = s \n");
        $monitor(" ( (%b & %b) | (~(%b) & ~(%b)) ) = %b", a, b, a, b, s);

        a = 0;
        b = 0;

        #1  a = 0;    b = 1;
        #1  a = 1;    b = 0;
        #1  a = 1;    b = 1;
    end

endmodule
