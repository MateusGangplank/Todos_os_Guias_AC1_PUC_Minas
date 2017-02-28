



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

module and0 ( output s,
input m,
input n,
input o,
input p,
input q,
input r);
assign s = (m & n & o & p & q & r);
endmodule // and0

module and1 ( output s,
input t,
input u);
assign s = (t & u);
endmodule // and0

module CA;
reg j;
reg inicio;
reg clear0;
reg clear1;
wire q1A; wire q2A;
wire q1B; wire q2B;
wire q1C; wire q2C;
wire q1D; wire q2D;
wire q1E; wire q2E;
wire q1F; wire q2F;
wire aux; 

jkff F (q1F, q2F, j, j, inicio, clear0);
jkff E (q1E, q2E, j, j, q1F, clear0);
jkff D (q1D, q2D, j, j, q1E, clear0);
jkff C (q1C, q2C, j, j, q1D, clear0);
jkff B (q1B, q2B, j, j, q1C, clear0);
jkff A (q1A, q2A, j, j, q1B, clear0);

and0 X (aux, q1A, q1B, q1C, q1D, q1E, q1F);
and1 Y (clear, X, clear1);

initial begin
	j = 1;
	clear1 = 1;
	inicio =0;

end


initial begin
	$display("Ailton Gomes - 440092");
	$display("Contador assincrono decrescente");
	$monitor("%b %b %b %b %b %b", q1F,q1E,q1D,q1C,q1B,q2A);

#1
   clear1 = 0;
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
#1	
	inicio=1;

end

endmodule // AC