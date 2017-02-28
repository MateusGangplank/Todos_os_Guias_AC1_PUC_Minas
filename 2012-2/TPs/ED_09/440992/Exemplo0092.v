



module jkff ( output q, output qnot, input j, input k, input clk , input clear);
reg q, qnot;
always @( posedge clk )
	begin
	if (  clear == 1 )
		begin
		q <= 0; qnot <= 0;
				end
		else
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

module CA;
reg j;
reg inicio;
reg clear;
wire q1A; wire q2A;
wire q1B; wire q2B;
wire q1C; wire q2C;
wire q1D; wire q2D;
wire q1E; wire q2E;

jkff E (q1E, q2E, j, j, inicio, clear);
jkff D (q1D, q2D, j, j, q2E, clear);
jkff C (q1C, q2C, j, j, q2D, clear);
jkff B (q1B, q2B, j, j, q2C, clear);
jkff A (q1A, q2A, j, j, q2B, clear);


initial begin
	j = 1;
	clear = 1;
	inicio =0;

end


initial begin
	$display("Ailton Gomes - 440092");
	$display("Contador assincrono crescente");
	$monitor("%b %b %b %b %b", q2A,q2B,q2C,q2D,q2E);
//	$monitor("%b %b %b %b %b", q1A,q1B,q1C,q1D,q1E);
#1
   clear = 0;
#1
   inicio=1; 
#1
	inicio=0;
#1
   inicio=1;
#1	
   inicio=0;	
#1	
   inicio=1;
#1	
	inicio=0;

end

endmodule // AC