//----------------------------------
//Exercicio01_Guia06 _ ALU
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
//----------------------------------

//-------Construir uma ALU----------

module comparacao(comp, a, b);
input [3:0] a, b;
output comp;

xnor XNOR0 ( c0, a[0], b[0]);
xnor XNOR1 ( c1, a[1], b[1]);
xnor XNOR2 ( c2, a[2], b[2]);
xnor XNOR3 ( c3, a[3], b[3]);
and  AND0  ( comp, c0, c1, c2, c3 );

endmodule // comparacao

//-----Meia-soma

module meiasoma (s0, s1, a, b);
output s0, s1;
input a, b;

xor XOR ( s0, a, b );
and AND ( s1, a, b );

endmodule // meiasoma

//---- Soma-completa

module somacompleta ( s0, s1, a, b, c );
output s0, s1;
input a, b, c;

meiasoma M0 ( s2, s3, a, b) ;
meiasoma M1 ( s0, s4, c, s2);
or       OR0 (s1, s3, s4);

endmodule // somacompleta

//-soma com 4 bits cada operando

mudule somaquatrobits(s0, v, a, b);
input [3:0] a, b;
output [3:0] s0;
wire v, v0, v1, v2;

meiasoma     MS0 ( s0[0], v0, a[0], b[0]);
somacompleta SC0 ( s0[1], v1, v0, a[1], b[1]);
somacompleta SC1 ( s0[2], v2, v1, a[2], b[2]);
somacompleta SC2 ( s0[3], v, v2, a[3], b[3]);

endmodule // somaquatrobits

module ALU (s, comp, a, b);
input [3:0] a, b;
output [3:0] s;
output comp;

comparacao COMP0 ( comp, a, b );
somaquatrobits SC4 ( s, v, v0, a, b);

endmodule // ALU

//--------Teste

module testsomarecomparar;

reg [3:0] a, b;
wire [3:0] s0;
wire comp;

 ALU  alu0 (s, comp, a, b);
 
 initial begin
      $display("Exercicio01_Guia06 - Marcos Felipe Martins Silva - 415719");
      $display("Test SOMA-COMPLETA (4BITS)");
      $display("\n a  +  b   =  s0 comparador\n");
        
      $monitor("  4%b  +  4%b   =  4%b  %b",   a, b, comp, s);

       a[0]=0; a[1]=0; a[2]=0; a[3]=0; b[0]=0; b[1]=0; b[2]=0; b[3]=0;
#1     a[0]=0; a[1]=0; a[2]=0; a[3]=0; b[0]=0; b[1]=0; b[2]=0; b[3]=1;
#1     a[0]=0; a[1]=0; a[2]=0; a[3]=0; b[0]=0; b[1]=0; b[2]=0; b[3]=0;
#1     a[0]=0; a[1]=1; a[2]=0; a[3]=0; b[0]=0; b[1]=1; b[2]=0; b[3]=0;


 end

endmodule // testetresbits




