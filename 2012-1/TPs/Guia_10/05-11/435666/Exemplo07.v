//-----------------------------------------
// Aluna: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// memória RAM 4X16 (extra)
//-----------------------------------------

//--------------
//Flip Flop JK
//--------------

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
module mux(output [15:0] saida, input [15:0] entrada0, input [15:0] entrada1, input [15:0] entrada2 ,input [15:0] entrada3, input [1:0] a);
reg [7:0] aux;

parameter

start    = 2'b00,
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11;

always @(a or entrada0 or entrada1 or entrada2 or entrada3)
begin
case(a)
start:
	aux = entrada0;
id01:
	aux = entrada1;
id10:
	aux = entrada2;
id11:
	aux = entrada3;
default:
	aux = 8'b00000000;
endcase	 		
end

assign saida = aux;

endmodule // mux

//----------------
// DEMUX
//----------------				
module demux(output [3:0] saida, input entrada, input[1:0] a);
reg [3:0] aux;

parameter
start    = 2'b00, 
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11; 	
always @(a)
begin 
case(a)
start:
	aux = 4'b1000;
id01:
	aux = 4'b0100;
id10:
	aux = 4'b0010;
id11:
	aux = 4'b0001;
default:
	aux = 4'b0000;
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


module ram4x16(output[15:0] saida, input[15:0] entrada, input [1:0]a, input rw, input clk);
wire[3:0] aux;
wire[15:0] saida0;
wire[15:0] saida1;
wire[15:0] saida2;
wire[15:0] saida3;

demux d(aux, 1, a);
ram1x8 r1(saida0[7:0], entrada[7:0], aux[3], rw, clk);
ram1x8 r2(saida0[15:8], entrada[15:8], aux[3], rw, clk);

ram1x8 r3(saida1[7:0], entrada[7:0], aux[2], rw, clk);
ram1x8 r4(saida1[15:8], entrada[15:8], aux[2], rw, clk);

ram1x8 r5(saida2[7:0], entrada[7:0], aux[1], rw, clk);
ram1x8 r6(saida2[15:8], entrada[15:8], aux[1], rw, clk);

ram1x8 r7(saida3[7:0], entrada[7:0], aux[0], rw, clk);
ram1x8 r8(saida3[15:8], entrada[15:8], aux[0], rw, clk);
mux m(saida, saida0, saida1, saida2, saida3,a);

endmodule


module teste;

reg [15:0] entrada; 
reg clk, rw;
reg [1:0] a;	
wire [15:0] saida;

ram4x16 r7(saida, entrada,a, rw, clk);

initial begin
  clk  = 0;
  a = 2'b00;
  rw   = 1;
		
	entrada = 16'b1010110101011011;
		
		$display ( "Memória RAM 4X16 - EXTRA" );
		$display ( "entrada\t\tclock\tADDR\tRW\tsaída" );
		
		a = 2'b11;
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
  			$display ( "%16b\t%1b\t%2b\t%1b\t%16b", entrada, clk, a,rw,saida); 
		end

endmodule
