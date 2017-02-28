//--------------
//João Henrique Mendes de Oliveira
//392734
//--------------
//------------
//Flip Flop JK
//------------
module jkff ( output q,input j, input k, input clk ); 

reg q, qnot; 

always @( posedge clk ) 
	begin 
		if ( j & ~k ) 
			begin 
		q <= 1; qnot <= 0; 
	end 
		else 
			if ( ~j & k ) 
				begin 
					q <= 0; qnot <= 1; 
			end 
		else 
			if ( j & k ) 
				begin 
					q <= ~q; qnot <= ~qnot; 
			end 
		end 
endmodule // jkff 
//-------------
// Mux
//-------------
module mux(output [7:0] saida, input [7:0] entrada0, input [7:0] entrada1, input [7:0] entrada2 ,input [7:0] entrada3, input [7:0] entrada4, input [7:0] entrada5, input [7:0] entrada6, input [7:0] entrada7, input [2:0] a);
reg [7:0] aux;

parameter

start  = 3'b000, 
id001  = 3'b001, 
id010  = 3'b010, 
id011  = 3'b011,
id100  = 3'b100, 
id101  = 3'b101, 
id110  = 3'b110, 
id111  = 3'b111;

always @(a or entrada0 or entrada1 or entrada2 or entrada3 or entrada4 or entrada5 or entrada6 or entrada7)
begin
case(a)
start:
	aux = entrada0;
id001:
	aux = entrada1;
id010:
	aux = entrada2;
id011:
	aux = entrada3;
id100:
	aux = entrada4;
id101:
	aux = entrada5;
id110:
	aux = entrada6;
id111:
	aux = entrada7;
default:
	aux = 8'b00000000;
endcase	 		
end

assign saida = aux;

endmodule // mux

//----------------
// DEMUX
//----------------				
module demux(output [7:0] saida, input entrada, input[2:0] a);
reg [7:0] aux;

parameter

start = 3'b000,
id001 = 3'b001,
id010 = 3'b010,
id011 = 3'b011,
id100 = 3'b100,
id101 = 3'b101,
id110 = 3'b110,
id111 = 3'b111;
	
always @(a)
begin 
case(a)
start:
	aux = 8'b10000000;
id001:
	aux = 8'b01000000;
id010:
	aux = 8'b00100000;
id011:
	aux = 8'b00010000;
id100:
	aux = 8'b00001000;
id101:
	aux = 8'b00000100;
id110:
	aux = 8'b00000010;
id111:
	aux = 8'b00000001;	
default:
	aux = 8'b00000000;
endcase	 			
end
assign saida = aux;

endmodule// dmx

		
//---------------
//Memoria RAM 1X8
//---------------

module ram1x8(output [7:0] saida,input [7:0] entrada, input a, input rw, input clk);

wire aux;
wire aux2[7:0];

and a1(aux, a, rw, clk);

jkff ff1(aux2[0], entrada[0], ~entrada[0], aux);
jkff ff2(aux2[1], entrada[1], ~entrada[1], aux);
jkff ff3(aux2[2], entrada[2], ~entrada[2], aux);
jkff ff4(aux2[3], entrada[3], ~entrada[3], aux);
jkff ff5(aux2[4], entrada[4], ~entrada[4], aux);
jkff ff6(aux2[5], entrada[5], ~entrada[5], aux);
jkff ff7(aux2[6], entrada[6], ~entrada[6], aux);
jkff ff8(aux2[7], entrada[7], ~entrada[7], aux);


and a2(saida[0], aux2[0], a);
and a3(saida[1], aux2[1], a);
and a4(saida[2], aux2[2], a);
and a5(saida[3], aux2[3], a);
and a6(saida[4], aux2[4], a);
and a7(saida[5], aux2[5], a);
and a8(saida[6], aux2[6], a);
and a9(saida[7], aux2[7], a);

endmodule // RAM1x8


module ram8x8(output[7:0] saida, input[7:0] entrada, input [2:0]a, input rw, input clk);
wire[7:0] aux;
wire[7:0] saida0;
wire[7:0] saida1;
wire[7:0] saida2;
wire[7:0] saida3;
wire[7:0] saida4;
wire[7:0] saida5;
wire[7:0] saida6;
wire[7:0] saida7;

demux d(aux, 1, a);
ram1x8 r1(saida0, entrada, aux[7], rw, clk);
ram1x8 r2(saida1, entrada, aux[6], rw, clk);
ram1x8 r3(saida2, entrada, aux[5], rw, clk);
ram1x8 r4(saida3, entrada, aux[4], rw, clk);
ram1x8 r5(saida4, entrada, aux[3], rw, clk);
ram1x8 r6(saida5, entrada, aux[2], rw, clk);
ram1x8 r7(saida6, entrada, aux[1], rw, clk);
ram1x8 r8(saida7, entrada, aux[0], rw, clk);

mux m(saida, saida0, saida1, saida2, saida3, saida4, saida5, saida6, saida7, a);

endmodule


module teste;

reg [7:0] entrada; 
reg clk, rw;
reg [2:0] a;	
wire [7:0] saida;

ram8x8 r5(saida, entrada,a, rw, clk);

initial begin
  clk  = 0;
  a = 3'b000;
  rw   = 1;
		
	entrada = 8'b10101101;
		
		$display ( "Memória 1x4 com Flip Flop JK" );
		$display ( "entrada\t\tclock\tADDR\tRW\tsaída" );
		
		a = 3'b111;
		rw   = 1;
		clk  = 1;
		
		#25 $finish;
		
	end
	
always 
  begin
  #5 clk = ~clk;
  end
		 
  	always @( clk )
  		begin
  			$display ( "%8b\t%1b\t%2b\t%1b\t%8b", entrada, clk, a,rw,saida); 
		end

endmodule
