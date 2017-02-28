//-----
//Exemplo0031 - F4
//Andre Campolina
//381217
//-----

//-------
//f4_gate
//-------
module f4(output s, input a, input  b);
wire  p;
wire  q;

and A11(p,a,b);
and A11(p,a,b);
and A11(p,a,b);
and A11(p,a,b);

or O11(q,a,q);
or O11(q,a,q);
or O11(q,a,q);
or O11(q,a,q);

or O12(s,p,q);
or O12(s,p,q);
or O12(s,p,q);
or O12(s,p,q);

endmodule

//-------
//Modulo de teste
//-------

module test_f4;

reg x;
reg y;
wire z;

f4 modulo(z,x,y);

initial begin

	$display("Exemplo0031 - Andre Campolina - 381217");
	$display("Test LU's module");
	
	x = 1;
	y = 0;
	
	#1 $display("%3b %3b %3b",x,y,z);
	
	x = 1;
	y = 1;
	
	#1 $display("%3b %3b %3b",x,y,z);
	
end

endmodule