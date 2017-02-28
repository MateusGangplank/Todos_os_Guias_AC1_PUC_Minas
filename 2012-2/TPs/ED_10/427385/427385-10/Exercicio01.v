// -- PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// -- Exercicio01
// -- Nome: Ana Cristina Pereira Teixeira
// -- Matricula: 427385

`include "util.v"

//memoria ram 1x4
module ram1x4(output [3:0]s, input[3:0]x, input clk,input readWrite, input address, input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and1(w,clk,readWrite,address);
	
	ffJK flip1(q[0],qnot[0],x[3],not3,w,0,clear);
	ffJK flip2(q[1],qnot[1],x[2],not2,w,0,clear);
	ffJK flip3(q[2],qnot[2],x[1],not1,w,0,clear);
	ffJK flip4(q[3],qnot[3],x[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and and1(s[0],aux[0],address);
	and and2(s[1],aux[1],address);
	and and3(s[2],aux[2],address);
	and and4(s[3],aux[3],address);

endmodule 

//teste
module exercicio01;
	
	reg [3:0]IN;
	wire [3:0]OUT;
	reg clear, adress, readWrite;
	wire clk;
	
	clock clk1(clk);
	ram1x4 ram1(OUT,IN,clk,readWrite,adress,clear);
	
	initial begin
		
		clear = 0;
		adress = 0;
		readWrite = 0;
		IN = 4'b1001;

		$display("Ex01");
		$display("Clock \tRW \t Adress \t Input \tOutput");
		$monitor("%b \t\t%b \t   %b \t\t %4b  \t%4b",clk,readWrite,adress,IN,OUT);

		#1 readWrite = 1; adress = 1;
		#3 adress = 0; readWrite = 0;
		#1 readWrite = 1;
		#3 readWrite = 0; IN = 4'b0011;
		#3 readWrite = 1; adress = 1; 
		#1 clear = 1; IN = 4'b1011; readWrite = 0; adress = 0;
		#1 clear = 0;
		#20 readWrite = 1;
		#10 adress = 1;
		#20 $finish;
	end
endmodule