// ---------------------
//      GUIA 07
//  CELSO R FRAN�A JR 404590 
// ---------------------

// ---------------------
// -- Meia-Soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0,s1;
 input a, b;
 xor (s0,a,b);
 and (s1,a,b);
 
endmodule

// ---------------------
// -- SOMA COMPLETA
// ---------------------
module somaCompleta (s0, s1, a, b, c );

input a, b, c;
output s0, s1;

meiasoma HA1 (r,c1,a,b);
meiasoma HA2 (s0,c2,r,c);
or (s1,c2,c1);

endmodule

// ---------------------
// -- SOMA 4 bits
// ---------------------
module soma (s, c4, a, b, op);

input  [3:0] a, b;
input op;
output [3:0] s;
output c4;

xor XOR1 (n0,b[0],op);
somaCompleta FA1 (s[0],c1,a[0],n0,op);

xor XOR2 (n1,b[1],op);
somaCompleta FA2 (s[1],c2,a[1],n1,c1);

xor XOR3 (n2,b[2],op);
somaCompleta FA3 (s[2],c3,a[2],n2,c2);

xor XOR4 (n3,b[3],op);
somaCompleta FA4 (s[3],c4,a[3],n3,c3);

endmodule

// ---------------------
// -- Comparador logico 4-bits
// ---------------------
module comparadorL (s, a, b);

input [3:0] a, b;
output s;
wire [3:0] c;

xnor XNOR1 (c[0], a[0], b[0]);
xnor XNOR2 (c[1], a[1], b[1]);
xnor XNOR3 (c[2], a[2], b[2]);
xnor XNOR4 (c[3], a[3], b[3]);

and AND1 (s, c[3], c[2], c[1], c[0]);

endmodule

// ---------------------
// -- Comparador Aritimetico 4-bits
// ---------------------
module comparadorA (c1, c2, c3, a, b);

input [3:0] a, b;
output c1, c2, c3;
wire [3:0] s;

soma SOMA1 (s,c, a, b, op);
comparadorL COMPARADOR1 (c2, a, b);
nor NOR1 (c1,c2,s[3]);
assign c3 = s[3];


endmodule
// ---------------------
// --Overflow
// ---------------------
module overflow (o, a, b, op, s);

input [3:0] a, b, s;
input op;
output o;

xnor XNOR1 (t1,b[3],op);
not NOT1 (t2,a[3]);
and AND1 (t3,s[3],t2);
and AND2(o,t1,t3);
wire [3:0] s;

endmodule

// ---------------------
// -- zero -------------
// ---------------------
module zero (z, f, p);

input [3:0] f, p;
output z;
comparadorL COMPARADOR1 (z, f, p);

endmodule

// ---------------------
// -- carry ------------
// ---------------------
module carry (c, a, b, op);

input [3:0] a, b;
input op;
output c;
output [3:0] s;
soma SOMA1 (s,c, a, b, op);

endmodule
// ---------------------
// -- complemento de ---
// ---------------------
module complemento1 (c, a);

input [3:0] a;
output [3:0] c;

not NOT1 (c[0],a[0]);
not NOT1 (c[1],a[1]);
not NOT1 (c[2],a[2]);
not NOT1 (c[3],a[3]);

endmodule
// ---------------------
// -- Incremento de 1 ---
// ---------------------
module incremento1 (c, a);

input [3:0] a;
reg [3:0] u = 1;
output [3:0] c;
reg [0:0] op = 0;
soma Soma1 (c, c4, a, u, op);

endmodule

// ---------------------
// -- Decremento de 1 ---
// ---------------------
module decremento1 (c, a);

input [3:0] a;
reg [3:0] u = 1;
output [3:0] c;
reg [0:0] op = 1;
soma Soma1 (c, c4, a, u, op);

endmodule

// ---------------------
// -- complemento de 2--
// ---------------------
module complemento2 (c, a);

input [3:0] a;
output [3:0] c;
wire [3:0] t;

complemento1 comp(t,a);
incremento1 inc(c,t);

endmodule

// ---------------------
// -- Produto por 2--
// ---------------------
module produto (c, a);

input [3:0] a;
output [3:0] c;
reg [0:0] op = 0;
soma Soma1 (c, c4, a, a, op);

endmodule
// ---------------------
// ------- ALU ---------
// ---------------------
module alu ( s, c1, i, c2, d1, p2, a, b, op);

input  [3:0] a, b, p;
input op;
output [3:0] s, c1, i, c2, d1, p2;

soma SOMA1 (s, c4, a, b, op);
complemento1 COMP1 (c1, b);
incremento1 inc (i,b);
complemento2 COMP2 (c2,b);
decremento1 dec (d1,b);
produto prod (p2,b);

endmodule

// ---------------------
// --- Teste ALU -------
// ---------------------
module testeALU( );

reg [3:0] a, b;
reg op;
wire [3:0] s, c1, i, c2, d1, p2;

alu ALU1 ( s, c1, i, c2, d1, p2, a, b, op);

  initial begin:start
   a[3]= 0; a[2]=0; a[1]=0; a[0]=0;
   b[3]= 0; b[2]=0; b[1]=0; b[0]=0;
	op = 0;
  end

  initial begin: main
 
   $display("Guia 07");
   $display("Celso R Franca Jr - 404590");
   $display("\n     ALU 4bits\n");
   $display("[fator1] - [fator2] = [soma] \n");
   $monitor("   %b   +   %b    =  %b\n  complemento1 de b = [%b] | complemento2 de b = [%b]\n incremento1 de b = [%b] Decremento1 de b [%b] Produto(x2) = [%b]\n ", a, b, s, c1, c2, i, d1, p2);
   
   #1
	a[3]= 0; a[2]=0; a[1]=0; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=0; b[0]=1;
   #1
	a[3]= 0; a[2]=0; a[1]=1; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=0; b[0]=1;
   #1
        a[3]= 0; a[2]=0; a[1]=1; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=1; b[0]=0;
        
    #1
        a[3]= 0; a[2]=1; a[1]=0; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=1; b[0]=0;
        
   
  end
endmodule