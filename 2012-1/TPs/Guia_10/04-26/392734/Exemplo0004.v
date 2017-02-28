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

//---------------
//Module Teste
//---------------
module teste_03;

reg [7:0] entrada; 
reg clk, a, rw;	
wire [7:0] saida;

ram1x8 r4(saida, entrada,a, rw, clk);

initial begin
  clk  = 0;
  a = 0;
  rw   = 0;
		
	entrada = 8'b10101101;
		
		$display ( "Memória 1x4 com Flip Flop JK" );
		$display ( "entrada\tclock\tADDR\tRW\tsaída" );
		
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
