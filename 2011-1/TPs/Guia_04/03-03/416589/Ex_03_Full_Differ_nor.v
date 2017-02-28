// ---------------------
// Guia 04_03 - Full Differ with NOR gate
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- full differ with NOR gate
// -------------------------------

module fulldiffer_nor (c0,c1,r,s,t);
output c0,c1;
input r,s,t;

halfdiffer_nor HA1 (cout,carry,r,s);
halfdiffer_nor HA2 (cout2,c0,cout,t);
or_nor OR1 (c1,carry,cout2);

endmodule // full_differ




/// -------------------------------
// -- half differ with NOR gate
// -------------------------------

module halfdiffer_nor (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor_nor XOR1 (s0,a,b);
  not_nor NOT1(temp1, a);
  and_nor AND1 (s1,temp1,b);

endmodule // halfdiffer_nor

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



// -----------------------------
// -- test fulldiffer_with_nor
// -----------------------------

module testfulldiffer_nor;
 reg   a,b,c;
 wire  s0,s1,s2;
          
// instancia
 fulldiffer_nor HA1 (s0,s1,a,b,c);
 
 initial begin:start
      a=0; b=0;c=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 04_03 - Alyson Deives - 416589");
      $display("FULL DIFFER com portas NOR\n");
		$display("\nA + B = S\n");
      $monitor("%b - %b - %b = %b%b", a, b, c, s0,s1);
  #1  a=0; b=0;c=0;
  #1  a=0; b=0;c=1;
  #1  a=0; b=1;c=0;
  #1  a=0; b=1;c=1;
  #1  a=1; b=0;c=0;
  #1  a=1; b=0;c=1;
  #1  a=1; b=1;c=0;
  #1  a=1; b=1;c=1; 
  end

endmodule // testhalfdiffer_nor


// -----------------------------
// -- TESTE
// -----------------------------

//-- 	Guia 04_03 - Alyson Deives - 416589
//-- 	FULL DIFFER com portas NOR
//-- 
//-- 
//-- 	A - B - C = S
//-- 
//-- 	0 - 0 - 0 = 00
//-- 	0 - 0 - 1 = 11
//-- 	0 - 1 - 0 = 01
//-- 	0 - 1 - 1 = 00
//-- 	1 - 0 - 0 = 01
//-- 	1 - 0 - 1 = 00
//-- 	1 - 1 - 0 = 00
//-- 	1 - 1 - 1 = 11
//
// -- PS: Não consegui identificar o erro