// ------------------------- 
// Guia10_01 - Memoria RAM 1x4
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 

`include "clock.v"
`include "flipflopjk.v"

module mem1x4(output [3:0]s, input[3:0]x, input clk, input readWrite, input address, input clear);
	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not NOT0(not0,x[0]);
	not NOT1(not1,x[1]);
	not NOT2(not2,x[2]);
	not NOT3(not3,x[3]);
	
	and AND1(w,clk,readWrite,address);
	
	ffjk FF1(q[0],qnot[0],x[3],not3,w,0,clear);
	ffjk FF2(q[1],qnot[1],x[2],not2,w,0,clear);
	ffjk FF3(q[2],qnot[2],x[1],not1,w,0,clear);
	ffjk FF4(q[3],qnot[3],x[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and AND1(s[0],aux[0],address);
	and AND2(s[1],aux[1],address);
	and AND3(s[2],aux[2],address);
	and AND4(s[3],aux[3],address);

endmodule//mem1x4

//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [3:0]IN;
	wire [3:0]OUT;
	reg clear, ADD, RW;
	wire clk;
	
	clock clk1(clk);
	mem1x4 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		clear = 0;
		ADD = 0;
		RW = 0;
		IN = 4'b1001;
		$display("Guia10_01 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada	  Saida");
		$monitor("  %b	    %b		   %b		 %4b	   %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1; ADD = 1;
		#3 ADD = 0; RW = 0;
		#1 RW = 1;
		#3 RW = 0; IN = 4'b1010;
		#3 RW = 1; ADD = 1; 
		#1 clear = 1; IN = 4'b1111; RW = 0; ADD = 0;
		#1 clear = 0;
		#15 RW = 1;
		#9 ADD = 1;
		#15 $finish;
	end


endmodule // Teste