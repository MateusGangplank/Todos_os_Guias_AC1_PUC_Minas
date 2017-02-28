// ---------------------
// Guia 05_03 - FAZER um circuito lógico para realizar 
//     um produto completo de dois valores binários
//     com dois bits cada.
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- modules
// ---------------------
module full_adder (a, b, cin, s, co);
 input a, b, cin;
 output s, co;
 wire t1, t2, t3;
 
 xor #3 xor_1 (s, a, b, cin);
 
 and #2 and_1 (t1, a, b),
        and_2 (t2, a, cin),
		  and_3 (t3, b, cin);
		  
 or #(2,3) or_1 (co, t1, t2, t3);
 
 endmodule //full_adder

module andgate (s, p, q);
 output s;
 input  p, q;

 assign s = p & q;

endmodule // andgate

module multiple (a0, a1, b0, b1, m0, m1, m2, m3);
input a0, a1, b1, b0;
output m0, m1, m2, m3;
wire t1, t2, t3;

and #1 and_1 (t1, a1, b1),
        and_2 (t2, a1, b0),
		  and_3 (t3, a0, b1),
		  and_4 (mo, a0, b0);
		  
full_adder fa_0 (m2, m3, cin, t1, co);
full_adder fa_1 (co, m1, cin, t2, t3);
endmodule //multiple

// ---------------------
// -- exercicio 05_03
// ---------------------
module Exercicio0503;
reg a0, a1, b1, b0;
wire m0, m1, m2, m3;

multiple  m_1 (a0, a1, b0, b1, m0, m1, m2, m3);


          // parte principal
 initial begin: start
      a0=0; a1=0; b1=0; b0=0; 
      $display("Guia 05_03 - Luiz Felipe Fonseca - 405817");
      $display("");
      $display("\na0 & a1 & b1 & b0 = m0 m1 m2 m3");
      $monitor("%b | %b | %b | %b = %b", a0, a1, b1, b0, m0, m1, m2, m3);
  #1  a0=0; a1=0; b1=0; b0=0; 
  #1  a0=1; a1=0; b1=1; b0=0; 
  #1  a0=1; a1=1; b1=1; b0=1; 
 end

endmodule // Exercicio0503