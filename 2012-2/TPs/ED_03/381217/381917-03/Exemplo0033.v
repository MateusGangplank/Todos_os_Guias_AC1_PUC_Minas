//-----
//Exemplo0033 - F4
//Andre Campolina
//381217
//-----

//-------
//f4_gate
//-------
module f4(output s, input a, input  b, input z);
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;
wire w7;
wire w8;

//--Nand e nor simultaneo
nand nand1(w1,a,b);
nor nor1(w2,a,b);
or or1(w3,w1,w2);

//--and e or simultaneo
and and1(w4,a,b);
or or2(w5,a,b);
or or3(w6,w4,w5);

//--mux
and and2(w7,z,w3);
and and3(w8,!z,w6);
or or4(s,w8,w7);



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

	$display("Exemplo0033 - Andre Campolina - 381217");
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