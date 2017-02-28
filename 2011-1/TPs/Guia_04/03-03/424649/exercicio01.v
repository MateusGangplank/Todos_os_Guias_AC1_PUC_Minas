// Giselle Caroline Vieira
// Matricula:424649

module Meiasoma (s, V1, a, b);
 
output s, V1;
input  a, b;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11;

nor NOR1 (temp1, a);
nor NOR2 (temp2, temp1);
nor NOR3 (temp3, b);
nor NOR4 (temp4, temp2, temp3);
nor NOR5 (temp5, b);
nor NOR6 (temp6, temp5);
nor NOR7 (temp7, a);
nor NOR8 (temp8, temp6, temp7);
nor NOR9 (temp9, temp4, temp8);
nor NOR10 (s, temp9);
nor NOR11 (temp10, b);
nor NOR12 (temp11, a);
nor NOR13 (V1, temp10, temp11);

 endmodule 



module TesteMeiasoma;

reg   a, b;
wire  s, V1;
 
Meiasoma Meiasoma1 (s, V1, a, b);

 initial begin
      $display("\na  b   V1  s\n");
      $monitor("%b  %b   %b   %b", a, b, V1, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
