// Exercicio 005 – Contador Decadino Crescente
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

module tff(q,q1,t,c,clear);
output q,q1;
input t,c,clear;
reg q,q1;
initial 
   begin 
	q=1'b1;
	q1=1'b0;
   end
 always @ (c)
	begin
		if(c)
			begin
			 	if(clear == 1'b1) begin q = 1'b0; q1 = 1'b1; end
				else
					begin
				 		if (t==1'b0) begin q=q; q1=q1; end
		 		 		else begin q=~q; q1=~q1; end
				 	end
			end
	 end
endmodule

module contDecadCresc(output[3:0] s, input pulse, input clr);
	wire qn1, qn2, ns0, ns1, clear, and1, and2, and3;
	tff t00(s[0], qn0, pulse, pulse, clear);
	tff t01(s[1], qn1, qn0, qn0, clear);
	tff t02(s[2], qn2, qn1, qn1, clear);
	tff t05(s[3],    , qn2, qn2, clear);
	and(and1, s[3], qn2);
	and(and2, s[1], qn0);
	and(and3, and1, and2);
	or(clear, and3, clr);
	
endmodule

module testContDecadCresc;
	reg pulse, clear;
	wire[3:0] s;
	
	contDecadCresc CDC(s, pulse, clear);
	
	initial begin
		$display("Exercicio05 - Átila Martins Silva Júnior - 449014");
		
		pulse = 0;
		clear = 0;
		 
		$monitor("s: %b %b %b %b %d",s[3], s[2], s[1], s[0], s);
		
		#4pulse = 1;
		#4pulse = 0;	
		#4pulse = 1;
		#4pulse = 0;	
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 1;
		#4pulse = 0;
	end
endmodule