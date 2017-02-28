// Guia 06 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/03/2011

 //-- Complemento 

 module complemento1 (s, x);
 input [3:0]x;
 output [3:0]s;

 not NOT1 (s[0], x[0]);
 not NOT2 (s[1], x[1]);
 not NOT3 (s[2], x[2]);
 not NOT4 (s[3], x[3]);

 endmodule 

 //--Teste 
 
 module teste;

 reg  [3:0] x, y;
 wire [3:0 ]Comp;

 complemento1 COM1 (Comp, x);


   initial begin
	   $display("Guia 06");
		$display("Karen Alves Pereira - 407451");
      $display("Teste ALU");
      $display("\n Complemento x\n");

		x = 0;
		y = 0;
  		while(x != 15)
		  begin
		    x = (y == 0)? x :x + 1;
			 y = 0;
  #1      $display("%b ",Comp);
			 while(y != 15)
			   begin
				  y = y + 1;
  #1              $display("%b ",Comp);
		      end
		  end
  end
endmodule 