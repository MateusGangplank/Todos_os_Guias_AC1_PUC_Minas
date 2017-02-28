//----------------
//Exercicio5
//Nome:Fernando Silva
//Matricula:414506
//----------------


module exercicio3;
//----------------Definir dados

   reg[7:0]a;
	reg[7:0]b;
	reg[7:0]c;
	reg[7:0]d;
	reg[7:0]e;
	

//----------------parte principal

initial begin

    $display("Exercicio5 - Fernando Silva - 414506");
	 
	 a='b101010 + ((~'b1101)+'b1);
	 b='b11010+((~'o15)+'b1);
	 c='o34 + (~('hB)+'b1);
	 d='hCA + ((~'b10111001)+'b1);
	 e='d25+((~'h1A)+'b1);
	 
	 
	 $display("\nOperacoes de Subtracao");
	 $display("a=%7b",a);
	 $display("b=%7b",b);
	 $display("c=%7b",c);
	 $display("d=%7b",d);
	 $display("e=%7b",e);
	 
	 
	 
	
	end
	
	endmodule //exercicio1
	 