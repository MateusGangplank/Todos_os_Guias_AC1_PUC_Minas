//-----------------------------------------
// Aluna: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// memória RAM 1X16 (extra)
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

//---------------
//Memoria RAM 1X4
//---------------

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

//----------------
//RAM 1x16
//-----------------
module ram1x16(output [15:0] saida, input[15:0] entrada, input a, input rw, input clk);

ram1x4 r1(saida[3:0], entrada[3:0], a, rw, clk);
ram1x4 r2(saida[7:4], entrada[7:4], a, rw, clk);
ram1x4 r3(saida[11:8], entrada[11:8], a, rw, clk);
ram1x4 r4(saida[15:12], entrada[15:12], a, rw, clk);

endmodule

module teste;

reg [15:0] entrada; 
reg clk, rw;
reg  a;	
wire [15:0] saida;

ram1x16 r6(saida, entrada,a, rw, clk);

initial begin
  clk  = 0;
  a = 1;
  rw   = 1;
		
	entrada = 16'b1010110101011011;
		
		$display ( "Memória RAM 1X16 - EXTRA" );
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
  			$display ( "%16b\t%1b\t%1b\t%1b\t%16b", entrada, clk, a,rw,saida); 
		end

endmodule
