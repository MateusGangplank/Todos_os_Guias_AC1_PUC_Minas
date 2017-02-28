// ------------------------- 
// Exemplo0054
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// -------------------------

module moore1100(y,x,clk,reset);
	output y;
	input x,clk,reset;
	reg y;
	
	parameter
		start = 3'b000,
		id1 = 3'b001,
		id11 = 3'b011,
		id111 = 3'b010,
		idfinish = 3'b100;
	
	reg[2:0]E1;
	reg[2:0]E2;
	
	always @ (x or E1)
		begin
			case(E1)
				start:
					if(x)
						E2 = id1;
					else
						E2 = start;
				id1:
					if(x)
						E2 = id11;
					else
						E2 = start;
				id11:
					if(x)
						E2 = id11;
					else
						E2 = id111;
				id111:
					if(x)
						E2 = id111;
					else
						E2 = idfinish;
				idfinish:
					#10 $finish;
				default:
					E2 = 3'bxxx;
			endcase
		end //always at state or signal changing
		
		always @(posedge clk or negedge reset)
			begin
				if(reset)
					E1 = E2;
				else
					E1 = 0;
			end
		
		always @(E1)
			begin
				y = E1[2];
			end
		
endmodule //moore1100

module Exemplo0054;
	reg clk, x, reset;
	wire m;
	
	//instância
	moore1100 moore1(m,x,clk,reset);
	
	initial begin
		
		$display("Time    X  Moore");
		
		//initial values
		clk   = 1;
		reset = 0;
		x     = 1;
		
		// input signal changing
		#5 reset = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#10 $finish;
	end
	
	always
  		#5 clk = ~clk;
	always @ (posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo0054

// ------------------------------------ TESTES -----------------------------

/*
    Time    X  Moore
      10    0     0
      20    1     0
      30    0     0
      40    1     0
      50    0     0
      60    0     0
      70    1     0
      80    0     0
      90    0     0
     100    1     0
     110    0     0
     120    0     0
     130    1     0
     140    1     0
     150    0     0
     160    0     0
     170    1     1
*/

/*
    Time    X  Moore
      10    1     0
      20    1     0
      30    0     0
      40    0     0
      50    0     1
*/