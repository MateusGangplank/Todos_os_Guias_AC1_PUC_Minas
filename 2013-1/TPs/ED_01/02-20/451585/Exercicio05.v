// ---------------------
// Exercicio 05  - NOR
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- nor gate
// ---------------------
module norgate (output s, input p, input q);

    assign s = ( ~(p) & ~(q) );

endmodule


// ---------------------
// -- test norgate
// ---------------------
module testnorgate;

    reg a, b;
    wire s;

    norgate NOR1 (s, a, b);

    initial begin:main
        $display("test nor:");
        $display("\n\~ a & ~ b = s\n");
        $monitor("~ %b & ~ %b = %b ", a, b, s);

        a = 0;
        b = 0;

        #1  a = 0;    b = 1;
        #1  a = 1;    b = 0;
        #1  a = 1;    b = 1;
    end

endmodule
