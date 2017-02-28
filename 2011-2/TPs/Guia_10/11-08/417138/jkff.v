//----------------------------------------------
//--Luiz marques de Oliveira - 41713
//----------------------------------------------






module jkff ( output q, output qnot, input j, input k, input clk ); 
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