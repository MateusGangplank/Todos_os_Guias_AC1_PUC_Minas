//Autor: Eduardo Botelho
//Matricula: 427395

module mux (output s, input a, input b, input chave);
  wire s,w1,w2,w3;

  and and1 (w1,a,chave);
  not not1 (w2,chave);
  and and2 (w3,b,w2);
  or  or1  (s,w1,w3);

endmodule

module fourbitor (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;
  
  or (w1,a[3],b[3]);
  or (w2,a[2],b[2]);
  or (w3,a[1],b[1]);
  or (w4,a[0],b[0]);
  or (w5,w1,w2);
  or (w6,w3,w4);
  or (s,w5,w6);
  
endmodule

module fourbitand (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;
  
  and (w1,a[3],b[3]);
  and (w2,a[2],b[2]);
  and (w3,a[1],b[1]);
  and (w4,a[0],b[0]);
  and (w5,w1,w2);
  and (w6,w3,w4);
  and (s,w5,w6);
  
endmodule

module fourbitnor (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;
  
  nor (w1,a[3],b[3]);
  nor (w2,a[2],b[2]);
  nor (w3,a[1],b[1]);
  nor (w4,a[0],b[0]);
  nor (w5,w1,w2);
  nor (w6,w3,w4);
  nor (s,w5,w6);

endmodule

module fourbitnand (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;

  nand (w1,a[3],b[3]);
  nand (w2,a[2],b[2]);
  nand (w3,a[1],b[1]);
  nand (w4,a[0],b[0]);
  nand (w5,w1,w2);
  nand (w6,w3,w4);
  nand (s,w5,w6);

endmodule

module fourbitxor (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;

  xor (w1,a[3],b[3]);
  xor (w2,a[2],b[2]);
  xor (w3,a[1],b[1]);
  xor (w4,a[0],b[0]);
  xor (w5,w1,w2);
  xor (w6,w3,w4);
  xor (s,w5,w6);

endmodule

module fourbitxnor (output s, input [3:0] a, input [3:0] b);
  wire w1,w2,w3,w4,w5,w6;

  xnor (w1,a[3],b[3]);
  xnor (w2,a[2],b[2]);
  xnor (w3,a[1],b[1]);
  xnor (w4,a[0],b[0]);
  xnor (w5,w1,w2);
  xnor (w6,w3,w4);
  xnor (s,w5,w6);

endmodule



module testAlu;
  reg [3:0] x;
  reg [3:0] y;
  reg chave;
  wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10;

  initial begin
    x = 4'b0000;
    y = 4'b0000;
    chave = 1'b0;
  end

  fourbitor     or1 (s1,x,y);
  fourbitnor   nor1 (s2,x,y);
  fourbitxor   xor1 (s3,x,y);
  fourbitxnor xnor1 (s4,x,y);
  or            or2 (s5,s1,s2);
  or            or3 (s6,s3,s4);
  not          not1 (s7,chave);
  and          and2 (s8,s7,s5);
  and          and3 (s9,chave,s6);
  or            or4 (s10,s8,s9);

  mux mux1 (s,s1,s2,chave);
  initial begin
  $display ("Exemplo0034 - Autor: Eduardo Botelho - 427395");
  $display ("Chave = 0 -> OR / Chave = 1 -> AND");
  $display ("a    b     chave  s");
  $monitor ("%3b %3b    %b     %b",x,y,chave,s);
  	#1 x=4'b0000; y=4'b0001;
	#1 x=4'b0000; y=4'b0010; chave = 1'b1;
	#1 x=4'b0011; y=4'b0011;
	#1 x=4'b0100; y=4'b0100;
	#1 x=4'b1000; y=4'b0101;
	#1 x=4'b1000; y=4'b0110;
	#1 x=4'b1000; y=4'b0111;
	#1 x=4'b0110; y=4'b1000;
	#1 x=4'b0110; y=4'b1001; chave = 1'b0;
	#1 x=4'b0010; y=4'b1010;
	#1 x=4'b0001; y=4'b1011;
	#1 x=4'b0001; y=4'b1100;
	#1 x=4'b1110; y=4'b1101;
	#1 x=4'b0010; y=4'b1110;
	#1 x=4'b1111; y=4'b1111;
	#1 chave = 1'b1;
	end
endmodule

//OBS: Não consegui projetar uma porta XOR de 4 bits no Verilog.