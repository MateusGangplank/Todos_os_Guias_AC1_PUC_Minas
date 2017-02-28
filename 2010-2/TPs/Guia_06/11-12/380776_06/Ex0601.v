// ---------------------
// Exemplo 06_01 - ALU 4 BITS
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
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
module somaCompleta (s0, s1, a, b, vaium );

input a, b, vaium;
output s0, s1;
wire w1, w2;

meiasoma MS1 (w1,w2,a,b);
meiasoma MS2 (s0,w3,w1,vaium);
or (s1,w3,w2);

endmodule

// ---------------------
// -- SOMA 4 bits
// ---------------------
module soma (s, a, b, op);

input  [3:0] a, b;
input op;
output [3:0] s;

xor XOR1 (n0,b[0],op);
somaCompleta FA1 (s[0],c1,a[0],n0,op);

xor XOR2 (n1,b[1],op);
somaCompleta FA2 (s[1],c2,a[1],n1,c1);

xor XOR3 (n2,b[2],op);
somaCompleta FA3 (s[2],c3,a[2],n2,c2);

xor XOR4 (n3,b[3],op);
somaCompleta FA4 (s[3],c4,a[3],n3,c3);

endmodule//soma

// ---------------------
// -- Comparador logico 4-bits
// ---------------------

module comparador (s, a, b);

input [3:0] a, b;
output s;
wire [3:0] c;

xnor XNOR1 (c[0], a[0], b[0]);
xnor XNOR2 (c[1], a[1], b[1]);
xnor XNOR3 (c[2], a[2], b[2]);
xnor XNOR4 (c[3], a[3], b[3]);

and AND1 (s, c[3], c[2], c[1], c[0]);

endmodule//comparador

// ---------------------
// ------- ALU ---------
// ---------------------

module alu ( s, i, a, b, op);

input  [3:0] a, b;
input op;
output [3:0] s;
output i;

soma SOMA1 (s, a, b, op);
comparador COMPARADOR1 (i, a, b);

endmodule//ALU

// ---------------------
// --- Teste ALU -------
// ---------------------

module testeALU;

reg [3:0] a, b;
reg op = 0;
wire [3:0]s;
wire i;

alu ALU1(s, i, a, b, op);

  initial begin:start
   a[3]= 0; a[2]=0; a[1]=0; a[0]=0;
   b[3]= 0; b[2]=0; b[1]=0; b[0]=0;
  end

  initial begin: main
 
  $display("Exercicio 06-01 - Julio Cezar Taveira Araujo - 380776");
     $display("\n     ALU 4bits\n");
     $display("[fator1] + [fator2] = [soma] - comparacao \n");
     $monitor("   %b   +   %b    =  %b   -   comparacao = [%b]  ", a, b, s, i);

   #1
        a[3]= 0; a[2]=0; a[1]=0; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=0; b[0]=1;
   #1
        a[3]= 0; a[2]=0; a[1]=1; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=0; b[0]=1;
   #1
        a[3]= 1; a[2]=1; a[1]=0; a[0]=0;
        b[3]= 1; b[2]=1; b[1]=0; b[0]=1;
        
    #1
        a[3]= 1; a[2]=0; a[1]=0; a[0]=1;
        b[3]= 0; b[2]=0; b[1]=0; b[0]=1;
		  
	 #1
        a[3]= 1; a[2]=1; a[1]=1; a[0]=0;
        b[3]= 1; b[2]=1; b[1]=1; b[0]=0;

    
  end
endmodule