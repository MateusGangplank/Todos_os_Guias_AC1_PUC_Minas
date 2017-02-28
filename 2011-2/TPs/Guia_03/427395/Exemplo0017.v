//Exemplo0015
//Nome: Eduardo Botelho
//Matricula: 427395

//Test number system

module test_base_01;
	reg [5:0] a;
	reg [5:0] b;
	reg [5:0] c;
	reg [10:0] d;
	reg [10:0] e;
	reg [10:0] f;
	
//Parte principal

	initial begin
		$display("Exemplo0015 - Eduardo Botelho - 427395");
		$display("\nExercicio 02");
		
		a = 6'b100010;
		b = 5'b11010;
		c = a+b;
		
		$display("\na)");
		$display("a = %d = %b",a,a);
		$display("b = %d = %b",b,b);
		$display("c = a+b =  %d = %b",c,c);
		
		a = 5'b11010;
		b = 5'o23;
		c = a+b;
		
		$display("\nb)");
		$display("a = %d = %b",a,a);
		$display("b = %3d = %b",b,b);
		$display("c = a+b = %d = %b",c,c);
		
		d = 10'o1234;
		e = 6'h2D;
		f = d/e;
		
		$display("\nc)");
		$display("a = %d = %b",d,d);
		$display("b = %d = %b",e,e);
		$display("c = a/b = %d = %b",f,f);
		
		d = 9'h1A9;
		e = ~(101101001);
		e = e+1;
		f = d + e;
		
		$display("\nd)");
		$display("a = %d = %b",d,d);
		$display("b = C2(101101001)");
		$display("b = %d = %b",e,e);
		$display("c = a+b = %d = %b",f,f);
		
		a = 25;
		b = 6'o41;
		c = 8'h6B;
		d = a*b;
		e = d + c;
		
		$display("\ne)");
		$display("a = %d = %b",a,a);
		$display("b = %d = %b",b,b);
		$display("c = %d = %b",c,c);
		$display("d = a*b = %d = %b",d,d);
		$display("e = d+c = %d = %b",e,e);
	end
endmodule                   