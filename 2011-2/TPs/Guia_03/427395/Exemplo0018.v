//Exemplo0015
//Nome: Eduardo Botelho
//Matricula: 427395

//Test number system

module test_base_01;
	reg [5:0] a;
	reg [5:0] b;
	reg [5:0] c;
	reg [4:0] d;
	
//Parte principal

	initial begin
		$display("Exemplo0015 - Eduardo Botelho - 427395");
		$display("\nExercicio 03");
		
		a = 6'b100111;
		b = ~a;
		c = ~a + 1;
		
		$display("\na)");
		$display("a = %d = %b",a,a);
		$display("C1(a) = %d = %b",b,b);
		$display("C2(a) =  %d = %b",c,c);
		
		a = 6'o54;
		b = ~a;
		c = ~a + 1'b1;
		
		$display("\nb)");
		$display("a = %d = %b",a,a);
		$display("C1(a) = %d = %b",b,b);
		$display("C2(a) =  %d = %b",c,c);
		
		a = 13;
		b = ~a;
		c = ~a + 1;
		
		$display("\nc)");
		$display("a = %d = %b",a,a);
		$display("C1(a) = %d = %b",b,b);
		$display("C2(a) =  %d = %b",c,c);
		
		a = 5'h1B;
		b = ~a;
		c = ~a + 1;
		
		$display("\nd)");
		$display("a = %d = %b",a,a);
		$display("C1(a) = %d = %b",b,b);
		$display("C2(a) =  %d = %b",c,c);
		
		a = 36;
		b = ~a;
		c = ~a + 1;
		d = 25 + c;
		
		$display("\ne)");
		$display("a = %d = %b",a,a);
		$display("C1(a) = %d = %b",b,b);
		$display("C2(a) =  %d = %b",c,c);
		$display("25 - 36 = 25 + C2(a) = %d = %b",d,d);
	end
endmodule                   