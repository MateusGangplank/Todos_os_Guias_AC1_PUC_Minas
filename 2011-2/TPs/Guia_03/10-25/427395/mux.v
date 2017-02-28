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


module testAlu;
  reg [3:0] x;
  reg [3:0] y;
  reg chave;
  wire s0,s1,s2;

  initial begin
    x = 4'b0000;
    y = 4'b0000;
    chave = 1'b0;
  end

  fourbitand andprincipal (s1,x,y);
  fourbitor   orprincipal (s2,x,y);

  mux mux1 (s,s1,s2,chave);
  initial begin
  $display ("Exemplo0032 - Autor: Eduardo Botelho - 427395");
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