//----------------
//Exercicio4
//Nome:Fernando dos Santos Silva
//Matricula:414506
//----------------


module exercicio3;
//----------------Definir dados

   reg[7:0]a;
	reg[6:0]b;
	reg[5:0]c;
	reg[4:0]d;
	reg[7:0]e;
	

//----------------parte principal

initial begin

    $display("Exercicio4 - Fernando dos Santos Silva - 414506");
	 
	 a=~('b101011) + 'b1;
	 
	 c=~('d27) + 'b1;
	 d=~('hC) + 'b1;
	 e=~('o21)+'b1;
	 
	 
	 $display("\nOperacoes");
	 $display("a=%7b",a);
	 $display("b=%6b",b);
	 $display("c=%5b",c);
	 $display("d=%4b",d);
	 $display("e=%7b",e);
	 
	 
	 
	
	end
	
	endmodule //exercicio1
	 