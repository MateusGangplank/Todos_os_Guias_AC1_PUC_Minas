//----------------
//Exercicio3
//Nome:Fernando Silva
//Matricula:414506
//----------------


module exercicio3;
//----------------Definir dados

   reg[6:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[3:0]e;
	

//----------------parte principal

initial begin

    $display("Exercicio3 - Fernando Silva - 414506");
	 
	 a=~'b100111 + 'b1;
	 b=~'h23+'b1;
	 c=~'d23 + 'b1;
	 d=~'h2B + 'b1;
	 e=~(26-36)+'b1;
	 
	 
	 $display("\nOperacoes");
	 $display("a=%6b",a);
	 $display("b=%6b",b);
	 $display("c=%4b",c);
	 $display("d=%5b",d);
	 $display("e=%3b",e);
	 
	 
	 
	
	end
	
	endmodule //exercicio1
	 