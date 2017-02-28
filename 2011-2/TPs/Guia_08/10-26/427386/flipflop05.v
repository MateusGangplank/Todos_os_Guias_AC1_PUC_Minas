// ------------------------- 
// fliflop05.v  
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 

//-------------
//--Circuitos sequenciais - Flip-Flops 
//-------------


module fliflop ( s,not01,a,clk,preset,clear);

output s, not01;
input a, clk, preset, clear;

reg s, not01;




always @( posedge clk )
begin
 if ( clear == 1 )
  begin
   s <= 0; 	not01 <= 1;
  end
 else
  begin
 if ( preset == 1 )
  begin
   s <= 1; 	not01 <= 0;
  end
 else
  begin
   s <= a; 	not01 <= ~s;
  end
  end
end

endmodule 


module and01 (output s, input x, input y);
assign s = x & y;
endmodule 

//module teste_fliflop;

initial begin
	$display("fliflip05 - Andre Henriques - 427386");

	//clk = 1; preste= 0; clear = 1;
//#1	$display("\n%b %b %b %b %b",a,b,c);
	//clk = 1; preste= 0; clear = 1;
//#1	$display("\n%b %b %b %b %b",a,b,c);
	//clk = 1; preste= 0; clear = 1;
//#1	$display("\n%b %b %b %b %b",a,b,c);

end

endmodule 
