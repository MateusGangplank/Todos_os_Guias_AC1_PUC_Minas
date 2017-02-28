// ---------------------
// Exercicio 10  - OR
// Nome: Josué
// Matricula: 451585
// ---------------------


// ---------------------
// -- or gate
// ---------------------
module orgate2in (output s, input p, input q);

    assign s = (p | q);

endmodule

// ---------------------
// -- or gate
// ---------------------
module orgate3in (output s, input p, input q, input r);

    wire x;
    orgate2in OR1(x, p, q);
    assign s = (x | r);

endmodule


// ---------------------
// -- test orgate
// ---------------------
module testorgate;

    reg a, b, c;
    wire s;

    orgate3in OR1 (s, a, b, c);

    initial begin:main
        $display("test or:");
        $display("\n ( (p | q) | r = s \n");
        $monitor(" (%b | %b) | %b = %b", a, b, c, s);

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
