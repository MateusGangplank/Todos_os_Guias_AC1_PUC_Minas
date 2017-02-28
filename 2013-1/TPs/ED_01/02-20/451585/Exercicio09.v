// ---------------------
// Exercicio 09  - AND
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- and gate
// ---------------------
module andgate2in (output s, input p, input q);

    assign s = (p & q);

endmodule

// ---------------------
// -- and gate
// ---------------------
module andgate3in (output s, input p, input q, input r);

    wire x;
    andgate2in AND1(x, p, q);
    assign s = (x & r);

endmodule


// ---------------------
// -- test andgate
// ---------------------
module testandgate;

    reg a, b, c;
    wire s;

    andgate3in AND1 (s, a, b, c);

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
