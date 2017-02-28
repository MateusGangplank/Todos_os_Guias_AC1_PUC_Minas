// Giselle Caroline Vieira
// Matricula:424649

module exercicioAND (s,a,b);

output s;
input a,b;
wire t1,t2;

nor NOR1 (t1,a);
nor NOR2 (t2,b);


assign s = ~(t1|t2);

endmodule // fim exercicio OR

module testeor;



reg a,b;
wire s;
exercicioAND AND1 (s,a,b);

 initial begin
      $display("\Exercicio 02\n");
      $display("AND usando apenas NOR\n");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // fim testeor
