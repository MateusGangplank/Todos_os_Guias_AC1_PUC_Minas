// ------------------------- 
// Exemplo0035 - 
// Nome: Yousef Otacilio 
// Matricula: 441714
// ------------------------- 
// ------------------------- 
// exemplo 0035
// ------------------------- 

module and3 (output [2:0]s, input [2:0] a, input [2:0] b );

and and1 (s[0], a[0], b[0]);
and and1 (s[1], a[1], b[1]);
and and1 (s[2], a[2], b[2]);

endmodule

//---------------------------------------------------------------------------

module or3 (output [2:0]s, input [2:0] a, input [2:0] b );

or and1 (s[0], a[0], b[0]);
or and1 (s[1], a[1], b[1]);
or and1 (s[2], a[2], b[2]);

endmodule
//--------------------------------------------------------------------------------------


module minusplus (output [2:0] s, input [2:0]a, input chave, input mp);

wire [2:0]s1, s3, s4, ch;
wire s2;
assign ch[0] = chave;
assign ch[1] = chave;
assign ch[2] = chave;

ex31 mais(s1, s2, a, 001, mp);

and and1 (vai, s2, chave);
and3 and2 (s3, s1, ch);
and3 and3 (s4, s1, ~ch);

or3 or1 (s, s3, s4);

 endmodule//

//--------------------------------------------------------------------

module inc (output [2:0]s,output vai, input [2:0]a, input chave); 

wire [2:0]s1, s3, s4, ch;
wire s2;
assign ch[0] = chave;
assign ch[1] = chave;
assign ch[2] = chave;

ex31 mais(s1, s2, a, 001, 0);

and and1 (vai, s2, chave);
and3 and2 (s3, s1, ch);
and3 and3 (s4, s1, ~ch);

or3 or1 (s, s3, s4);

 
endmodule // inc 

//--------------------------------------------------------------------------
module fullAdder (output s,output vai, input a, input b, input chave); 

wire s1,s2,s3;

and and1 (s1, a, b);
xor xor1 (s2, a, b);
and and2 (s3, chave, s2);
xor xor2 (s, s2, chave);
or or1 (vai, s3, s1); 
 
 
endmodule // fullAdder 

//-----------------------------------------------------------------

module zero (output s, input [2:0]a, input ove); 

wire s1,s2,s3,s4;


xnor xor1 (s1, a[0], 0);
xnor xor2 (s2, a[1], 0);
xnor xor3 (s3, a[2], 0);
xnor xor4 (s4, ove, 0);

and and1 (s, s1,s2,s3,s4);
   
endmodule // zero

//-------------------------------------------------------------------------------------
module ex31 (output [2:0] s, output ov, input [2:0] a, input [2:0] b, input chave);

wire w1, w2;
wire s1,s2,s3,s4,s5;

xor x1 (s1, b[0], chave);
xor x2 (s2, b[1], chave);
xor x3 (s3, b[2], chave);


fullAdder f1 (s[0], w1, a[0], s1, chave);
fullAdder f2 (s[1], w2, a[1], s2, w1);
fullAdder f3 (s[2], s5, a[2], s3, w2);

xor x4 (ov, s5, chave);

endmodule


module teste; 
// ------------------------- definir dados 
reg [2:0]x; 
reg [2:0]y; 
reg chave; 
reg chavemp;

wire [2:0] soma;
wire over;
wire over1;
wire [2:0]inc1;

minusplus teste (inc1, x, 1, chavemp);

ex31 modulo(soma, over, inc1, y, chave);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Yousef - 441714"); 
$display("Test ALU's Exemplo 35");

$monitor("x = %3b -- y = %3b chave = %1b Resultado = %4b ",inc1,y,chave, soma);


#1x = 3'b000; y = 3'b000; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b001; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b010; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b011; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b100; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b101; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b110; chave = 0; chavemp =0;
#1x = 3'b000; y = 3'b111; chave = 0; chavemp =0;
//-----------------------------------
#1x = 3'b000; y = 3'b000; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b001; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b010; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b011; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b100; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b101; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b110; chave = 0; chavemp =1;
#1x = 3'b000; y = 3'b111; chave = 0; chavemp =1;
//----------------------------------------
end 
endmodule // test_fullAdder 