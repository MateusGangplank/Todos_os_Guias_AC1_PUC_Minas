// ---------------------
// Guia 05_02 - 3 bits Full Subtractor with NOR gate
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- 4 bits full adder with with NOR gate
// -------------------------------

module three_bits_fullsubtractor_nor (c,a,b);
output [3:0] c;
input [2:0] a;
input [2:0] b;


halfsubtractor_nor HS1 (carry1,c[0],a[0],b[0]);
fullsubtractor_nor FS1 (carry2,c[1],a[1],b[1],carry1);
fullsubtractor_nor FS2 (c[3],c[2],a[2],b[2],carry2);

endmodule // 4_bits_full_adder_nor


// -------------------------------
// -- full subtractor with NOR gate
// -------------------------------

module fullsubtractor_nor (c1,c0,r,s,t);
output c0,c1;
input r,s,t;

halfsubtractor_nor HS1 (cout,carry1,r,s);
halfsubtractor_nor HS2 (c0,carry2,cout,t);
or_nor OR1 (c1,carry1,carry2);

endmodule // full_subtractor




/// -------------------------------
// -- half subtractor with NOR gate
// -------------------------------

module halfsubtractor_nor (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor_nor XOR1 (s0,a,b);
  not_nor NOT1(temp1, a);
  and_nor AND1 (s1,temp1,b);

endmodule // halfsubtractor_nor

// ---------------------
// -- xor with NOR gate
// ---------------------

module xor_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1,temp2,temp3,temp4,temp5,temp6;
 
  nor NOR1 (temp1,b,b);
  nor NOR2 (temp2,a,a);
  nor NOR3 (temp3,a,temp1);
  nor NOR4 (temp4,b,temp2);
  nor NOR5 (temp5, temp3, temp4); 
  nor NOR6 (s, temp5, temp5); 
  
endmodule // xor_nor


// ---------------------
// -- and with NOR gate
// ---------------------

module and_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1,temp2;
 
  nor NOR1 (temp1,a,a);
  nor NOR2 (temp2,b,b);
  nor NOR3 (s, temp1,temp2);

endmodule // and_nor

// ---------------------
// -- or with NOR gate
// ---------------------

module or_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1;
 
  nor NOR1 (temp1,a,b);
  nor NOR2 (s,temp1,temp1);
  
endmodule // or_nor

// ---------------------
// -- not with NOR gate
// ---------------------

module not_nor (s, a);
 output s;
 input  a;
 
  nor NOR1 (s,a,a);
  
endmodule // not_nor


// --------------------------------------
// -- test 3_bits_fullsubtractor_nor
// --------------------------------------

module test;
 reg [2:0]  a;
 reg [2:0]  b;
 wire [3:0] c;
 integer i,j;
          
// instancia
 three_bits_fullsubtractor_nor TBFS1 (c,a,b);
 
initial begin:start
      a=0; b=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 05_02 - Alyson Deives - 416589");
      $display("Full Subtractor de 3 bits\n");
		$display("\n// --   A   -   B  =   S  \n");
		$monitor("// --  %b%b%b - %b%b%b = %b%b%b%b", a[2],a[1],a[0],b[2],b[1],b[0],c[3],c[2],c[1],c[0]); 
  for(i=0;i<=7;i=i+1) 
  	begin
	
  		for(j=0;j<=7;j=j+1) 
  			begin
			#1 a = i;b=j;
								 			 
  		end	
  end 
end    

endmodule // test_3_bits_fullsubtractor_nor


	 // -----------------------------
	 // -- TESTE
	 // -----------------------------
	 //--Guia 05_02 - Alyson Deives - 416589
	 //--Full Subtractor de 3 bits
	 //--    A  -  B  =  S
	 
    // --  000 - 000 = 0000
    // --  000 - 001 = 1111
    // --  000 - 010 = 1110
    // --  000 - 011 = 1101
    // --  000 - 100 = 1100
    // --  000 - 101 = 1011
    // --  000 - 110 = 1010
    // --  000 - 111 = 1001
    // --  001 - 000 = 1110
    // --  001 - 001 = 0000
    // --  001 - 010 = 1100
    // --  001 - 011 = 1110
    // --  001 - 100 = 1010
    // --  001 - 101 = 1100
    // --  001 - 110 = 1000
    // --  001 - 111 = 1010
    // --  010 - 000 = 0010
    // --  010 - 001 = 0001
    // --  010 - 010 = 0000
    // --  010 - 011 = 1111
    // --  010 - 100 = 1110
    // --  010 - 101 = 1101
    // --  010 - 110 = 1100
    // --  010 - 111 = 1011
    // --  011 - 000 = 0000
    // --  011 - 001 = 0010
    // --  011 - 010 = 1110
    // --  011 - 011 = 0000
    // --  011 - 100 = 1100
    // --  011 - 101 = 1110
    // --  011 - 110 = 1010
    // --  011 - 111 = 1100
    // --  100 - 000 = 0100
    // --  100 - 001 = 0011
    // --  100 - 010 = 0010
    // --  100 - 011 = 0001
    // --  100 - 100 = 0000
    // --  100 - 101 = 1111
    // --  100 - 110 = 1110
    // --  100 - 111 = 1101
    // --  101 - 000 = 0010
    // --  101 - 001 = 0100
    // --  101 - 010 = 0000
    // --  101 - 011 = 0010
    // --  101 - 100 = 1110
    // --  101 - 101 = 0000
    // --  101 - 110 = 1100
    // --  101 - 111 = 1110
    // --  110 - 000 = 0110
    // --  110 - 001 = 0101
    // --  110 - 010 = 0100
    // --  110 - 011 = 0011
    // --  110 - 100 = 0010
    // --  110 - 101 = 0001
    // --  110 - 110 = 0000
    // --  110 - 111 = 1111
    // --  111 - 000 = 0100
    // --  111 - 001 = 0110
    // --  111 - 010 = 0010
    // --  111 - 011 = 0100
    // --  111 - 100 = 0000
    // --  111 - 101 = 0010
    // --  111 - 110 = 1110
    // --  111 - 111 = 0000