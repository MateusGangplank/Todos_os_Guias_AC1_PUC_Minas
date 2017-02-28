//-----
//Exemplo0034 - F4
//Andre Campolina
//381217
//-----

//----
//and 3 entradas
//----

module and3(input a, input b, input c, output s);
wire w1;
and and1(w1,a,b);
and and2(s,w1,c);
endmodule

//----
//mux 4 entradas
//-----

module mux4(input a, inputb, input c, input d, input [1:0] sel, output s);
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;

and3 a31(a,!sel[1],!sel[0],w1);
and3 a32(b,!sel[1],sel[0],w2);
and3 a33(c,sel[1],!sel[0],w3);
and3 a34(d,sel[1],sel[0],w4);

or or1(w5,w1,w2);
or or2(w6,w3,w4);
or or3(s,w5,w6);

endmodule

//-------
//f4_gate
//-------
module f4(output s, input a, input  b, input [1:0] sel);
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;
wire w7;
wire w8;

or or1(w1,a,b);
nor nor1(w2,a,b);
xor xor1(w3,a,b);
xnor(w4,a,b);

mux4 mux(w1,w2,w3,w4,sel,s);

endmodule


//-------
//Modulo de teste
//-------

module test_f4;

reg x;
reg y;
reg [1:0] sel;
wire z;

f4 modulo(z,x,y,sel);

initial begin

	$display("Exemplo0034 - Andre Campolina - 381217");
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