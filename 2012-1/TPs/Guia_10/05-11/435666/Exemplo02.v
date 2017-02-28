//-----------------------------------------
// Aluna: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// memória RAM 1X8
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

//-----------------
//Memoria RAM 1X4
//-----------------

module ram1x4(output [3:0] saida,input [3:0] entrada, input a, input rw, input clk);

wire aux;
wire aux2[3:0];

and a1(aux, a, rw, clk);

jkff ff1(aux2[0], entrada[0], ~entrada[0], aux);
jkff ff2(aux2[1], entrada[1], ~entrada[1], aux);
jkff ff3(aux2[2], entrada[2], ~entrada[2], aux);
jkff ff4(aux2[3], entrada[3], ~entrada[3], aux);

and a2(saida[0], aux2[0], a);
and a3(saida[1], aux2[1], a);
and a4(saida[2], aux2[2], a);
and a5(saida[3], aux2[3], a);

endmodule // RAM1x4


//---------------
//Memoria RAM 1X8
//---------------

module teste_02;

reg [7:0] entrada;
reg clk, a, rw;
wire [7:0] saida;

ram1x4 r1(saida[3:0], entrada[3:0], a, rw, clk);
ram1x4 r2(saida[7:4], entrada[7:4], a, rw, clk);

initial begin
  clk  = 0;
  a = 0;
  rw   = 0;
		
	entrada = 8'b10101011;
		
		$display ( "Memória RAM 1x8" );
		$display ( "entrada\t\tclock\tADDR\tRW\tsaída" );
		
		a = 1;
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
  			$display ( "%8b\t%1b\t%1b\t%1b\t%8b", entrada, clk, a,rw,saida); 
		end

endmodule