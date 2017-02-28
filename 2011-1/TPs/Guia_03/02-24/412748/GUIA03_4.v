 // -------------------------------
// Guia 03_04 - Meia soma
// Nome: Jessica Luisa BEtonico Andrade
// Matricula: 412748
// --------------------------------

// -------------------------------
// -- Meia soma
// -------------------------------

module HalfAdder (s, p, q);
 
output s, s0;
input  p, q;
wire temp, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10;

nor NOR1 (temp, p);
nor NOR2 (temp1, temp);
nor NOR3 (temp2, q);
nor NOR4 (temp3, temp1, temp2);
nor NOR5 (temp4, q);
nor NOR6 (temp5, temp4);
nor NOR7 (temp6, p);
nor NOR8 (temp7, temp5, temp6);
nor NOR9 (temp8, temp3, temp7);
nor NOR10 (s, temp8);
nor NOR11 (temp9, q);
nor NOR12 (temp10, p);
nor NOR13 (s0, temp9, temp10);

 endmodule // Meia soma

// ---------------------
// -- test Meia soma
// ---------------------

module TestMeiaSoma;

 reg   a, b;
 wire  s, s0, tmp, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10;
 
// instancia

nor NOR1 (tmp, a);
nor NOR2 (tmp1, tmp);
nor NOR3 (tmp2, b);
nor NOR4 (tmp3, tmp1, tmp2);
nor NOR5 (tmp4, b);
nor NOR6 (tmp5, tmp4);
nor NOR7 (tmp6, a);
nor NOR8 (tmp7, tmp5, tmp6);
nor NOR9 (tmp8, tmp3, tmp7);
nor NOR10 (s, tmp8);
nor NOR11 (tmp9, b);
nor NOR12 (tmp10, a);
nor NOR13 (s0, tmp9, tmp10);

// parte principal

 initial begin
      $display("\nGuia_03_04 - Jessica Luisa Betonico Andrade - 412748");
      $display("Test Meia soma\n");
      $display("\na \t b \t s0 \t s\n");
      $monitor("%b  +\t %b \t  %b  \t  %b", a, b, s0, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // testmeiasoma
