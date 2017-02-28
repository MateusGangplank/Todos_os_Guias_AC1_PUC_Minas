//Exemplo0015
//Nome: Eduardo Botelho
//Matricula: 427395

//Test number system

module test_base_01;
	reg [5:0] a;
	reg [3:0] b;
	reg [4:0] c;
	reg [5:0] d;
	reg [4:0] e;
	reg [1:0] s;
	
//Parte principal

	initial begin
		$display("Exemplo0015 - Eduardo Botelho - 427395");
		$display("Exercicio 01");
		
		a = 2;
		b = 14;
		c = a+b;

		$display("\na)");
		$display("a = %d = %3b",a,a);
		$display("b = %d = %4b",b,b);
		$display("c = a+b = %5b",c);
		
		a = 3;
		b = 7;
		c = a*b;
		
		$display("\nb)");
		$display("a = %d = %2b",a,a);
		$display("b = %d = %3b",b,b);
		$display("c = a*b = %5b",c);
		
		a = 34;
		b = 3;
		c = a / b;
		
		$display("\nc)");
		$display("a = %d = %6b",a,a);
		$display("b = %d = %2b",b,b);
		$display("c = a/b = %4b",c);
		
		a = 19;
		b = 11;
		c = a + (~b) + 1;
		
		$display("\nd)");
		$display("a = %d = %5b",a,a);
		$display("b = %d = %3b",b,b);
		$display("a-b = a + C2(b)");
		$display("a-b = a + ~b+1");
		$display("a-b = %5b + %b + 1",a,~b);
		$display("a-b = %4b",c);
		
		a = 2*4;
		b = a+6;
		s = ~1+1; //complemento de 2
		c = b + s;
		
		$display("\ne)");
		$display("a = 2*4 = %d = %4b",a,a);
		$display("b = a + 6 = %d = %5b",b,b);
		$display("c = C2(1) = %d = %4b",s,s);
		$display("a*b+c-1 = %d = %4b",c,c);
	end
endmodule                   