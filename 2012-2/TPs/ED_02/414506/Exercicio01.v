//----------------
//Exercicio1
//Nome:Fernando dos Santos Silva
//Matricula:414506
//----------------


module exercicio1;
//----------------Definir dados

   reg[5:0]a;
	reg[4:0]b;
	reg[6:0]c;
	reg[5:0]d;
	reg[4:0]e;

//----------------parte principal

initial begin

    $display("Exercicio - Fernando dos Santos Silva - 414506");
	 
	 
	 a=2+14;
	 b=3*9;
	 c=32/5;
	 d=24-11;
	 e=2*6+7-1;
	 
	 $display("\nOperacoes");
	 $display("a=%5b",a);
	 $display("b=%5b",b);
	 $display("c=%3b",c);
	 $display("d=%4b",d);
	 $display("e=%4b",d);
	 
	
	end
	
	endmodule //exercicio1
	 