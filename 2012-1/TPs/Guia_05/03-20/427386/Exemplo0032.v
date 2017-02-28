// -------------------------
// Exemplo0031 – FULL ADDER/SUBTRACTOR 
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//   
// ------------------------- 
module fullAdder (output s1, output s0,
                               input a,  
                               input b,  
                               input ci);
   wire x,y,z;
   xorgate XOR1(x,a,b);
   andgate AND1(y,a,b);
   xorgate XOR2(s1,x,ci);
   andgate AND2(z,x,ci);
   orgate OR2(s0,z,y);



endmodule // fullAdder

module fullAS4 (output [4:0] s,
                               input [3:0] a,
                               input [3:0] b,
										 input op);
   wire v1,v2,v3,v0,x1,x2,x3,x4;
	xorgate XOR1(x1,b[0],op);
	xorgate XOR2(x2,b[1],op);
	xorgate XOR3(x3,b[2],op);
	xorgate XOR4(x4,b[3],op);
   fullAdder HA1(s[0],v0,a[0],x1,op);
   fullAdder FA1(s[1],v1,a[1],x2,v0);
   fullAdder FA2(s[2],v2,a[2],x3,v1);
   fullAdder FA3(s[3],v3,a[3],x4,v2);
   xorgate XOR5(s[4],v3,op);

endmodule // fullAdder

module verifZero(output s, input [3:0] a);
	wire s1,s2;
	norgate NOR1(s1,a[0],a[1]);
	norgate NOR2(s2,s1,a[2]);
	norgate NOR3(s,s2,a[3]);
endmodule

module andgate (output s,
                               input a,  
                               input b);
  assign s = a & b;
endmodule

module norgate (output s,
                               input a,  
                               input b);
  assign s = ~(a|b);
endmodule

module xorgate (output s,
                               input a,  
                               input b);
  assign s = a ^ b;
endmodule
module orgate (output s,
                               input a,  
                               input b);
  assign s = a | b;
endmodule

module test_fullAdder; 
// ------------------------- definir dados 
      reg [3:0] x = 4'b0000; 
      reg [3:0] y = 4'b0000; 
      reg op = 0;
      wire [4:0] result;
		wire e;
      
      fullAS4 FAS41(result,x,y,op);
		verifZero V0(e,result[3:0]);

 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - André Henriques Fernandes - 427386");
      $display("Test ALU’s full adder"); 
 
      $monitor("op = %4b -> %4b %4b -> %4b",op,x,y,e);
      
      #1 x=4'b0110; y=4'b0100; op=0;

      #1 x=4'b0111; y=4'b0111; op=1;

      #1 x=4'b0101; y=4'b0111; op=0;

      #1 x=4'b0011; y=4'b0100; op=0;

      #1 x=4'b0100; y=4'b0010; op=1;
		
		#1 x=4'b1111; y=4'b0010; op=1;
		
		#1 x=4'b0000; y=4'b0000; op=0;
 
 end 
 
endmodule // test_fullAdder