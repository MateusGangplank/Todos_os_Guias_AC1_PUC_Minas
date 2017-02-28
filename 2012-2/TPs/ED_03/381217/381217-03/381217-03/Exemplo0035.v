//-----
//Exemplo0035 - F4
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

module mux4(input a, inputb, input c, input d, input sel0, input cel1, output s);
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;

and3 a31(a,!sel1,!sel0,w1);
and3 a32(b,!sel1,sel0,w2);
and3 a33(c,sel1,!sel0,w3);
and3 a34(d,sel1,sel0,w4);

or or1(w5,w1,w2);
or or2(w6,w3,w4);
or or3(s,w5,w6);

endmodule

//------
//Mux 8 entradas
//------

module mux8(input[7:0] i,input[2:0] sel,output s);
wire w1;
wire w2;
mux4 M1(i[0], i[1], i[2], i[3], sel[0], sel[1],w1);
mux4 M2(i[4], i[5], i[6], i[7], sel[0], sel[1],w2);
mux4 M3(w1,0,0,w2,sel[2], sel[2],s);

endmodule

//-------
//f4_gate
//-------
module f4(output s, input a, input  b, input [2:0] sel);
wire[7:0] i;
not not1(i[0], a);
not not2(i[1], b);
or or1(i[2],a,b);
nor nor1(i[3],a,b);
and and1(i[4],a,b);
nand nand1(i[5],a,b);
xor xor1(i[6],a,b);
xnor(i[7],a,b);

mux8 mux(i,sel,s);

endmodule


//-------
//Modulo de teste
//-------

module test_f4;

reg x;
reg y;
reg [2:0] sel;
wire z;

f4 modulo(z,x,y,sel);

initial begin

	$display("Exemplo0035 - Andre Campolina - 381217");
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