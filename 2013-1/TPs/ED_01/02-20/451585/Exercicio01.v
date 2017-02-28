// ---------------------
// Exercicio 01  - NAND
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- nand gate
// ---------------------
module nandgate (output s, input p, input q);

    assign s = (~(p&q));

endmodule


// ---------------------
// -- test nandgate
// ---------------------
module testnandgate;

    reg a, b;
    wire s;

    nandgate NAND1 (s, a, b);

    initial begin:main
        $display("test NAND:");
        $display("\n~(a & b) = s\n");
        a = 0;   b = 0;
        #1  $display("~ (%b & %b = %b ) ", a, b, s);
        a = 0;    b = 1;
        #1  $display("~ ( %b & %b = %b ) ", a, b, s);
        a = 1;    b = 0;
        #1  $display("~ ( %b & %b = %b ) ", a, b, s);
        a = 1;    b = 1;
        #1  $display("~ ( %b & %b = %b ) ", a, b, s);
    end

endmodule
