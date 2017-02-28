// -------------------------
// Exemplo0035 – COMPARADOR ARITIMETICO
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// equals
// -------------------------
module equals (output s,
input [0:1] a,
input [0:1] b);

wire temp1,temp2;

xnor xnor1 ( temp1,a[1],b[1] );
xnor xnor2 ( temp2,a[0],b[0] );
and and1   ( s, temp1, temp2 );


endmodule // equals

// greater
// -------------------------
module greater (output s,
input [0:1] a,
input [0:1] b);

wire temp1,temp2,temp3,temp4,b0,b1;

not not1   ( b1, b[1] );
not not1   ( b0, b[0] );

and and1   ( temp1, a[1], b1 );
or or1     ( temp2, a[0], b0 );
and and2   ( temp3 , temp1, temp2 );
and and3   ( temp4, a[0], b0 );
or or2     ( s, temp3, temp4 );


endmodule // greater

// less
// -------------------------
module less (output s,
input [0:1] a,
input [0:1] b);

wire temp1,temp2,temp3,temp4,a0,a1;

not not1   ( a1, a[1] );
not not1   ( a0, a[0] );

and and1   ( temp1, b[1], a1 );
or or1     ( temp2, b[0], a0 );
and and2   ( temp3 , temp1, temp2 );
and and3   ( temp4, b[0], a0 );
or or2     ( s, temp3, temp4 );


endmodule // less

module test_comparador;
// ------------------------- definir dados
reg  [0:1] a;
reg  [0:1] b;
wire e,g,l;

equals  eq1 (e,a,b);
greater gr1 (g,a,b);
less    le1 (l,a,b);

// ------------------------- parte principal
initial begin
$display("Exemplo0035 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s comparadorAritimetico");

a = 2'b00; b = 2'b00;
// projetar testes do modulo
$display(" a     b     G  E  L");
#1 $monitor("%2b   %2b    %b  %b  %b",a,b,g,e,l);

#1 a = 2'b00; b = 2'b01;
#1 a = 2'b00; b = 2'b10;
#1 a = 2'b00; b = 2'b11;
#1 a = 2'b01; b = 2'b00;
#1 a = 2'b01; b = 2'b01;
#1 a = 2'b01; b = 2'b10;
#1 a = 2'b01; b = 2'b11;
#1 a = 2'b10; b = 2'b00;
#1 a = 2'b10; b = 2'b01;
#1 a = 2'b10; b = 2'b10;
#1 a = 2'b10; b = 2'b11;
#1 a = 2'b11; b = 2'b00;
#1 a = 2'b11; b = 2'b01;
#1 a = 2'b11; b = 2'b10;
#1 a = 2'b11; b = 2'b11;
end
endmodule // test_comparador