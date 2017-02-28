//Fabricio Rodrigues de Souza - 412737
//Guia 8

module exercicio03(s, a, b, c, d, e);

input a, b, c, d, e;
output s;

wire st1, st2, st3, st4, st5, st6, st7, st8, st9, st10, st11, st12, st13;

not N1(st1, a);
not N2(st2, b);
not N3(st3, c);
not N4(st4, d);
not N5(st5, e);

and A1(st6, a, st2, st3, d, st5);
and A2(st7, a, b, d, e);
and A3(st8, st1, st3, st4);
and A4(st9, st2, st4, e);
and A5(st10, st2, c, st4);
and A6(st11, c, d, e);
and A7(st12, b, c, e);
and A8(st13, b, c, d);

or O1(s, st6, st7, st8, st9, st10, st11, st12, st13);
endmodule

module teste;

reg a, b, c, d, e;
wire s;

exercicio03 E1(s, a, b, c, d, e);

initial begin: start
a=0;b=0;c=0;d=0;e=0;
end

initial begin: main
$display("Fabricio Rodrigues de Souza - Guia 8 - QM");
$display("A B C D E = S");
$monitor("%b %b %b %b %b = %b", a, b, c, d, e, s);
#1 a=0;b=0;c=0;d=0;e=0;
#1 a=0;b=0;c=0;d=0;e=1;
#1 a=0;b=0;c=0;d=1;e=0;
#1 a=0;b=0;c=0;d=1;e=1;
#1 a=0;b=0;c=1;d=0;e=0;
#1 a=0;b=0;c=1;d=0;e=1;
#1 a=0;b=0;c=1;d=1;e=0;
#1 a=0;b=0;c=1;d=1;e=1;
#1 a=0;b=1;c=0;d=0;e=0;
#1 a=0;b=1;c=0;d=0;e=1;
#1 a=0;b=1;c=0;d=1;e=0;
#1 a=0;b=1;c=0;d=1;e=1;
#1 a=0;b=1;c=1;d=0;e=0;
#1 a=0;b=1;c=1;d=0;e=1;
#1 a=0;b=1;c=1;d=1;e=0;
#1 a=0;b=1;c=1;d=1;e=1;
#1 a=1;b=0;c=0;d=0;e=0;
#1 a=1;b=0;c=0;d=0;e=1;
#1 a=1;b=0;c=0;d=1;e=0;
#1 a=1;b=0;c=0;d=1;e=1;
#1 a=1;b=0;c=1;d=0;e=0;
#1 a=1;b=0;c=1;d=0;e=1;
#1 a=1;b=0;c=1;d=1;e=0;
#1 a=1;b=0;c=1;d=1;e=1;
#1 a=1;b=1;c=0;d=0;e=0;
#1 a=1;b=1;c=0;d=0;e=1;
#1 a=1;b=1;c=0;d=1;e=0;
#1 a=1;b=1;c=0;d=1;e=1;
#1 a=1;b=1;c=1;d=0;e=0;
#1 a=1;b=1;c=1;d=0;e=1;
#1 a=1;b=1;c=1;d=1;e=0;
#1 a=1;b=1;c=1;d=1;e=1;

end
endmodule

/*
     ----jGRASP exec: C:\Programas\ProgramasAC\Icarus_Verilog\bin\vvp Exercicio03.vvp
    
    Fabricio Rodrigues de Souza - Guia 8 - QM
    A B C D E = S
    0 0 0 0 0 = 1
    0 0 0 0 1 = 1
    0 0 0 1 0 = 0
    0 0 0 1 1 = 0
    0 0 1 0 0 = 1
    0 0 1 0 1 = 1
    0 0 1 1 0 = 0
    0 0 1 1 1 = 1
    0 1 0 0 0 = 1
    0 1 0 0 1 = 1
    0 1 0 1 0 = 0
    0 1 0 1 1 = 0
    0 1 1 0 0 = 0
    0 1 1 0 1 = 1
    0 1 1 1 0 = 1
    0 1 1 1 1 = 1
    1 0 0 0 0 = 0
    1 0 0 0 1 = 1
    1 0 0 1 0 = 1
    1 0 0 1 1 = 0
    1 0 1 0 0 = 1
    1 0 1 0 1 = 1
    1 0 1 1 0 = 0
    1 0 1 1 1 = 1
    1 1 0 0 0 = 0
    1 1 0 0 1 = 0
    1 1 0 1 0 = 0
    1 1 0 1 1 = 1
    1 1 1 0 0 = 0
    1 1 1 0 1 = 1
    1 1 1 1 0 = 1
    1 1 1 1 1 = 1
    
     ----jGRASP: operation complete.
    

*/
