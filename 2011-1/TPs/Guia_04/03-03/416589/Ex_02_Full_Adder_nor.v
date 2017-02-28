// ---------------------
// Guia 04_02 - Full Adder with NOR gate
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- full adder with NOR gate
// -------------------------------

module fulladder_nor (c0,c1,r,s,t);
output c0,c1;
input r,s,t;
wire carry1,carry2,cout;

halfadder_nor HA1 (cout,carry1,r,s);
halfadder_nor HA2 (c1,carry2,cout,t);
or_nor OR1 (c0,carry1,carry2);

endmodule // full_adder




// -------------------------------
// -- half adder with NOR gate
// -------------------------------

module halfadder_nor (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor_nor XOR1 (s0,a,b);
  and_nor AND1 (s1,a,b);

endmodule // halfadder_nor

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


// -----------------------------
// -- test fulladder_with_nor
// -----------------------------

module testfulladder_nor;
 reg   a,b,c;
 wire  s0,s1,s2;
          
// instancia
 fulladder_nor HA1 (s0,s1,a,b,c);
 
 initial begin:start
      a=0; b=0;c=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 04_02 - Alyson Deives - 416589");
      $display("FULL ADDER com portas NOR\n");
		$display("\nA + B = S\n");
      $monitor("%b + %b + %b = %b%b", a, b, c, s0,s1);
  #1  a=0; b=0;c=0;
  #1  a=0; b=0;c=1;
  #1  a=0; b=1;c=0;
  #1  a=0; b=1;c=1;
  #1  a=1; b=0;c=0;
  #1  a=1; b=0;c=1;
  #1  a=1; b=1;c=0;
  #1  a=1; b=1;c=1; 
  end

endmodule // testhalfadder_nor


// -----------------------------
// -- TESTE
// -----------------------------

//-- 	Guia 04_02 - Alyson Deives - 416589
//-- 	FULL ADDER com portas NOR
//-- 
//-- 
//-- 	A + B + C = S
//-- 
//-- 	0 + 0 + 0 = 00
//-- 	0 + 0 + 1 = 01
//-- 	0 + 1 + 0 = 01
//-- 	0 + 1 + 1 = 10
//-- 	1 + 0 + 0 = 01
//-- 	1 + 0 + 1 = 10
//-- 	1 + 1 + 0 = 10
//-- 	1 + 1 + 1 = 11
