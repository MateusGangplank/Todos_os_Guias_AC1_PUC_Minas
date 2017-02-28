// ------------------------- 
// Guia 10 - Exercicio04
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule // clock ( )

//--------------------------
//--- BUFFFER CONTROLADO
//--------------------------
module bc (output s, input dado, input en);
	reg s;
	always @ ( en )
	begin
		if (en)
			 s = dado;
		else
			 s = 1'bx;
	end
endmodule//bf


//--------------------------
//--- FLIP FLOP JK
//--------------------------

module jkff ( output q, output qnot, input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
			if ( j & ~k ) 
				begin 
					q = 1; qnot = 0; 
				end 
			else if ( ~j & k ) 
				begin 
				q = 0; qnot = 1; 
				end 
			else 	if ( j & k ) 
				begin 
				q = ~q; qnot = ~qnot; 
				end 
	end 
endmodule //jkff ()


//--------------------------
//--- RAM 1X8
//--------------------------
module ram (output [7:0] s, input [7:0] dado, input clock, input rw, input addres );
	wire clk, rw_not, clock_not, outok, saidanot;
	wire [7:0] saidaf;
	wire [7:0] s;
	
	// -- PORTA QUE CRIA O CLOCK (CLK) DOS FLIP-FLOPS DE ARCORDO COM A EXISTENCIA DOS 3 SINAIS
	and AND1 (clk, clock, rw, addres);

	// -- PORTAS QUE POSSIBILITAM A SAIDA DO DADOS NA MEMORIA DE ACORDO COM A EXISTENCIA OU NAO DE 3 SINAIS
	not NOT1 (rw_not, rw);
	not NOT2 (clock_not, clock);
	
	and AND2 (outok, rw_not, clock_not, addres);
	
	// -- JOGAR DADOS NOS FLIP-FLOPS 
	jkff JKFF0 (saidaf[0], saidanot, dado[0], ~dado[0], clk); 
	jkff JKFF1 (saidaf[1], saidanot, dado[1], ~dado[1], clk); 
	jkff JKFF2 (saidaf[2], saidanot, dado[2], ~dado[2], clk); 
	jkff JKFF3 (saidaf[3], saidanot, dado[3], ~dado[3], clk); 
	jkff JKFF4 (saidaf[4], saidanot, dado[4], ~dado[4], clk); 
	jkff JKFF5 (saidaf[5], saidanot, dado[5], ~dado[5], clk); 
	jkff JKFF6 (saidaf[6], saidanot, dado[6], ~dado[6], clk); 
	jkff JKFF7 (saidaf[7], saidanot, dado[7], ~dado[7], clk); 
	
	bc BC0 (s[0], saidaf[0], outok);
	bc BC1 (s[1], saidaf[1], outok);
	bc BC2 (s[2], saidaf[2], outok);
	bc BC3 (s[3], saidaf[3], outok);
	bc BC4 (s[4], saidaf[4], outok);
	bc BC5 (s[5], saidaf[5], outok);
	bc BC6 (s[6], saidaf[6], outok);
	bc BC7 (s[7], saidaf[7], outok);
	
endmodule // ram

//--------------------------
//--- Exercicio04 (principal)
//--------------------------
module exercicio04;
	reg rw, addres;
	reg [7:0] dado;
	wire [7:0] saida;
	wire clk;
	
	clock CLOCK1 (clk);
	ram RAM1X4a (saida, dado, clk, rw, addres);
	initial begin
		$display("Guia 10 - Exercicio 05");
		$display("CLK RW ADDRES DADO SAIDA");
		$monitor(" %1b   %1b   %1b    %8b  %8b", clk, rw, addres, dado, saida);
		#13 rw = 1; addres = 1; dado = 8'b01010101;
		#12 rw = 1; addres = 1; dado = 8'b01010101;
		#12 rw = 0; addres = 1; dado = 8'b01010101;
		#12 rw = 1; addres = 0; dado = 8'b11111111;
		#12 rw = 0; addres = 0; dado = 8'b11111111;
		#12 rw = 0; addres = 1; dado = 8'b11111111;
		#12 rw = 1; addres = 1; dado = 8'b11111111;
		#12 rw = 0; addres = 1; dado = 8'b11111111;
		#1 $finish;
	end
endmodule //exercicio04