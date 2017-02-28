// ---------------------
// Exercicio 08  - AND
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- and gate
// ---------------------
module andgate (output s, input p, input q, input r);

    assign s = (p & q) & r;

endmodule


// ---------------------
// -- test andgate
// ---------------------
module testandgate;

    reg a, b, c;
    wire s;

    andgate AND1 (s, a, b, c);

    initial begin:main
        $display("test and:");
        $display("\n ( (p & q) & r = s \n");
        $monitor(" (%b & %b) & %b = %b", a, b, c, s);

        a = 0;
        b = 0;
        c = 0;

        #1  a = 0;    b = 0;  c = 1;
        #1  a = 0;    b = 1;  c = 0;
        #1  a = 0;    b = 1;  c = 1;
        #1  a = 1;    b = 0;  c = 0;
        #1  a = 1;    b = 0;  c = 1;
        #1  a = 1;    b = 1;  c = 0;
        #1  a = 1;    b = 1;  c = 1;
    end

endmodule
