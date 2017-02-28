//-----
//Exemplo0032 - F4
//Andre Campolina
//381217
//-----

//-------
//f4_gate
//-------
module f4(output s, input a, input  b, input z);
wire  p;
wire  q;
wire  m;
wire  n;
wire  o;

or O1(p,a,b);

and A0(q,a,b);

and A1(m,z,q);

and A2(n,!z,p);

or O3(s,m,n);


endmodule

//-------
//Modulo de teste
//-------

module test_f4;

reg x;
reg y;
reg sel;
wire z;

f4 modulo(z,x,y,sel);

initial begin

	$display("Exemplo0032 - Andre Campolina - 381217");
	$display("Test LU's module");
	
	x = 1;
	y = 0;
	sel = 0;
	
	#1 $display("%3b %3b %b %3b",x,y,sel,z);
	
	x = 1;
	y = 1;
	sel = 1;
	
	#1 $display("%3b %3b %3b",x,y,sel,z);
	
end

endmodule