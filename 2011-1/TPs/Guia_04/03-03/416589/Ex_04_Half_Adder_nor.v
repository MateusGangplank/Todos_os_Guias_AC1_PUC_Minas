// ---------------------
// Guia 04_01 - Half Adder with NOR gate
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

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

// -----------------------------
// -- test halfadder_with_nor
// -----------------------------

module testhalfadder_nor;
 reg   a,b;
 wire  s0,s1;
          
// instancia
 halfadder_nor HA1 (s0,s1,a,b);
 
 initial begin:start
      a=0; b=0;
 end
 
 // parte principal
 initial begin:main
      $display("Guia 04_01 - Alyson Deives - 416589");
      $display("HALF ADDER com portas NOR\n");
		$display("\nA + B = S\n");
      $monitor("%b + %b = %b%b", a, b, s1,s0);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testhalfadder_nor