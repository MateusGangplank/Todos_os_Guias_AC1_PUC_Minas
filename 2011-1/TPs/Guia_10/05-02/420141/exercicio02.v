//Nome: Raphaela Fernanda Silva
//Matricula: 420141 

`define found    1
`define notfound 0

module  ex02_seq0110_moore (y,x,clk, reset);

output y;
input  x;
input  clk;
input  reset;

reg    y;

parameter   
	start  = 3'b000,
	id0    = 3'b110,
	id01   = 3'b001,
	id011  = 3'b010,
	id0110 = 3'b101; 

reg [2:0] E1;
reg [2:0] E2;
	
	always @( x or E1 )
	begin
	y = `notfound;
		
		case( E1 )
		start:
			if ( x )
				E2 = start;
			else
				E2 = id0;
			
			id0:
				if ( x )
					E2 = id01;
				else
					E2 = id0;
			
			id01:
				if ( x )
					E2 = start;
				else
					E2 = id011;
			
			id011:
				if ( x )
					E2 = id0110;
				else
					E2 = id0;
			
			id0110:
			if ( x )
				begin
			 		E2 = start;
					y = `found;
				end
			else
				begin
					E2 = id0;
					y = `found;
				end
			
			default:  
				E2 = 3'bxxx;
				
endcase
end 
		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;   
			else
				E1 = 0;     
end 

endmodule 

module Ex02;
	
	reg   clk, reset, x;
	wire  m1;

 	ex02_seq0110_moore M1 (m1,x,clk,reset);

initial
begin
		
		$display("Exercicio02 - Guia10");
		$display("\ntime\tx   seq 0110" );

       clk   = 1;
       reset = 0;
       x     = 0;

		#10   reset = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		
		#5 $finish;
	
end 

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
			$display ( "%4d \t%b\t%b", $time, x, m1);
	end 
	
endmodule 