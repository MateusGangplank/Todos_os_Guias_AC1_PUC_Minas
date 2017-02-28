//Fabricio Rodrigues de Souza - 412737
//Guia 8


module exercicio01(s, a, b, c, d);

input a, b, c, d;
output s;
wire st1, st2, st3, st4, st5, st6, st7;

not N1(st1, d);
and A1(st2, a, b, st1);
not N2(st4, b);
and A3(st5, st4, c);
not N3(st6, a);
and A4(st7, st6, c);
or O1(s, st2, st5, st7);

endmodule

module exercicio02(s, a, b, c, d);

input a, b, c, d;
output s;
wire st1, st2, st3, st4, st5, st6, st7, st8, st9;

not N1(st1, a);
not N2(st2, b);
not N3(st3, c);
not N4(st4, d);

and A1(st5, st1, st2, c, st4);
and A2(st6, st1, b, st3, st4);
and A3(st7, a, st2, st3);
and A4(st8, a, st2, d);
and A5(st9, a, st3, d);

or O1(s, st5, st6, st7, st8, st9);

endmodule


module teste;

reg a, b, c, d;
wire s1, s2;

exercicio01 E1(s1, a, b, c, d);
exercicio02 E2(s2, a, b, c, d);

initial begin: start
a=0;b=0;c=0;d=0;
end

initial begin: main
$display("Fabricio Rodrigues de Souza - Guia 8 - QM");
$display("A B C D = S1 S2");
$monitor("%b %b %b %b = %b %b", a, b, c, d, s1, s2);
#1 a=0;b=0;c=0;d=1;
#1 a=0;b=0;c=1;d=0;
#1 a=0;b=0;c=1;d=1;
#1 a=0;b=1;c=0;d=0;
#1 a=0;b=1;c=0;d=1;
#1 a=0;b=1;c=1;d=0;
#1 a=0;b=1;c=1;d=1;
#1 a=1;b=0;c=0;d=0;
#1 a=1;b=0;c=0;d=1;
#1 a=1;b=0;c=1;d=0;
#1 a=1;b=0;c=1;d=1;
#1 a=1;b=1;c=0;d=0;
#1 a=1;b=1;c=0;d=1;
#1 a=1;b=1;c=1;d=0;
#1 a=1;b=1;c=1;d=1;

end
endmodule

/*

    ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp Exericicio01e02.vvp
    
    Fabricio Rodrigues de Souza - Guia 8 - QM
    A B C D = S1 S2
    0 0 0 0 = 0 0
    0 0 0 1 = 0 0
    0 0 1 0 = 1 1
    0 0 1 1 = 1 0
    0 1 0 0 = 0 1
    0 1 0 1 = 0 0
    0 1 1 0 = 1 0
    0 1 1 1 = 1 0
    1 0 0 0 = 0 1
    1 0 0 1 = 0 1
    1 0 1 0 = 1 0
    1 0 1 1 = 1 1
    1 1 0 0 = 1 0
    1 1 0 1 = 0 1
    1 1 1 0 = 1 0
    1 1 1 1 = 0 0
    
     ----jGRASP: operation complete.

*/