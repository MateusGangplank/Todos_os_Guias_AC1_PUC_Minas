//----------------
//Exercicio2
//Nome:Fernando dos Santos Silva
//Matricula:414506
//----------------


module exercicio2;
//----------------Definir dados

   reg[6:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[10:0]e;
	

//----------------parte principal

initial begin

    $display("Exercicio2 - Fernando Silva - 414506");
	 
	 a=6'b101010 + 5'b11011;
	 b=5'b11011 + 6'o25;
	 c='o1234 / 'h3C;
	 d='h1BA - 'b101110001;
	 e=25*'o32 + 'h7A;
	 
	 
	 $display("\nOperacoes");
	 $display("a=%6b",a);
	 $display("b=%6b",b);
	 $display("c=%4b",c);
	 $display("d=%7b",d);
	 $display("e=%4b",e);
	 
	 
	 
	
	end
	
	endmodule //exercicio1