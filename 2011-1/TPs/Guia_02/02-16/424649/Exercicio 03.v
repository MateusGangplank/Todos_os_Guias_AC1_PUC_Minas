// Giselle Caroline Vieira
// Matricula:424649

module exercicioNOT (s,a);

output s;
input a;


assign s = ~(a & a);
 



endmodule // fim exercicio NOT

module testenot;



reg a;
wire s;
exercicioNOT NOT1 (s,a);

 initial begin
      $display("\Exercicio 03\n");
      $display("NOT usando apenas NAND\n");
      $display("\n~a = s\n");
      $monitor("~ %b = %b", a , s);
  
	     a=0; 
    #1  a=1; 
	 
	  end
 
endmodule // fim testenot
 