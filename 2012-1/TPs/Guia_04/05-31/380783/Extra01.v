// -------------------------
// Extra01
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783 
// ------------------------- 

module extra01  (output[3:0]s1,
  output[3:0]s2,
  output[3:0]s3,
  output[3:0]s4, 
  input [3:0]carryIn,
  input [3:0]a,
  input [3:0]const,
  input [3:0]b); 
  
wire [3:0]sand1;
wire [3:0]sand2;
wire [3:0]sand3;
wire [3:0]sand4;
wire [3:0]sand5;
wire [3:0]sand6;
wire [3:0]sand7;
wire [3:0]sand8;
wire [3:0]sand9;
wire [3:0]sand10;
wire [3:0]notcarry;
wire [3:0]notxor;
wire [3:0]nota;
wire [3:0]sxor1;
wire [3:0]sxor2;

and AND1 [3:0] (sand1,carryIn,b);
and AND2 [3:0] (sand2,carryIn,a);
not NOT1 [3:0] (notcarry,carryIn);
and AND3 [3:0] (sand3,notcarry,b);
not NOT2 [3:0] (nota,a);
and AND4 [3:0] (sand4,notcarry,a);
and AND5 [3:0] (sand5,carryIn,const);
and AND6 [3:0] (sand6,sand1,sand2);
and AND7 [3:0] (sand7,const,notcarry);
and AND8 [3:0] (sand8,sand4,sand3);
xor XOR1 [3:0] (sxor1,sand1,sand2);
xor XOR2 [3:0] (sxor2,sand4,sand3);
and AND9 [3:0] (sand9,sand1,sxor1);
xor XOR3 [3:0] (s1,sand5,sxor1);
or OR1 [3:0] (s2,sand9,sand6);
not NOT3 [3:0] (notxor,sxor2);
xor XOR4 [3:0] (s3,sxor2,sand7);
and AND10 [3:0] (sand10,notxor,sand7);
or OR2 [3:0] (s4,sand10,sand8);

endmodule //extra01;

module test_extra01; 

// ------------------------- definir dados 
  reg [3:0] x; 
  reg [3:0] y; 
  reg [3:0] carryIn;
  reg [3:0] constante;
  wire[3:0]s1;
  wire[3:0]s2;
  wire[3:0]s3;
  wire[3:0]s4;
  
extra01 ERROR (s1,s2,s3,s4,carryIn,x,constante,y);

// ------------------------- parte principal
 initial begin
x = 4'b0000;		y=4'b1111;	carryIn = 4'b0000;  constante  = 4'b0000;

$display("Extra01 - Lucas Siqueira Chagas - 380783");
$display("Test Somador Algébrico selecionável (CarryIn)");
$display("\n *** Resultado ***  ");
$display("\n carryIn 0 = Diferença \n carryIn 1 = Soma \n");
$monitor("x=%b	y=%b	carryIn=%b	\n        Soma=%b	CarryOut=%b	\n	Diferença=%b	CarryOut=%b\n\n",x,y,carryIn,s1,s2,s3,s4);

#1 x=4'b1111;	y = 4'b1011;
#1 carryIn = 4'b1111;
#1 x=4'b1111;	y = 4'b1111;
#1 x=4'b0011;	y = 4'b0011;


end

endmodule //extra01
