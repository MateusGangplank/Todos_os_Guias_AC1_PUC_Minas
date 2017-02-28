// Exercicio1
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773


module srff ( output q, output qnot, input s, input r, input clok ); 
	reg q, qnot; 
	always @( posedge clok ) 
	begin 
		if ( s & ~r ) 
		begin 
			q <= 1; 
			qnot <= 0; 
		end 
	else if ( ~s & r ) 
		begin
			q <= 0; 
			qnot <= 1; 
		end 
	else if ( s & r ) 
		begin q <= 0; 
			qnot <= 0; // arbitrary 
		end 
end endmodule
 

module Exercicio02;
 
	wire[4:0]a;
	wire[4:0]s;
	reg clok;
	reg x,y;
  
	srff D01(a[0],s[0],y,x,clok);
	srff D02(a[1],s[1],y,x,clok);
	srff D03(a[2],s[2],y,x,clok);
	srff D04(a[3],s[3],y,x,clok);
	srff D05(a[4],s[4],y,x,clok);

	initial begin 
		clok= 1;
		y = 1;
		x = 1; 

		#10 x=0;y=0;
		#10 x=1;y=0;
		#10 x=1;y=1;

		#5$finish; 
	end  
	always 
	#5 clok = ~clok; 
	always @( posedge clok ) 
	begin 
		$display ("%b  %b",a,s ); 
	end
endmodule 