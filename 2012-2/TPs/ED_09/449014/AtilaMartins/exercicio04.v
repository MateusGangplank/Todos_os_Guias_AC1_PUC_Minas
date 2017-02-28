// Exercicio 004 – Contador Decadino Crescente
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

module jkff(q,q1,j,k,c,clear);
output q,q1;
input j,k,c,clear;
reg q,q1;
initial begin q=1'b0; q1=1'b1; end
always @ (posedge c)
  begin
  if(clear == 1'b1) begin q = 1'b0; q1 = ~q; end
		else
		begin
			case({j,k})
		 		{1'b0,1'b0}:begin q=q; q1=q1; end
		 		{1'b0,1'b1}: begin q=1'b0; q1=1'b1; end
		 		{1'b1,1'b0}:begin q=1'b1; q1=1'b0; end
		 		{1'b1,1'b1}: begin q=~q; q1=~q1; end
			endcase
		end
   end
endmodule

module contDecadCresc(output[5:0] s, input pulse);
	wire qn1, qn2, qn3, qn4, qn5,clear, and1, and2, and3, and4;
	
	jkff JK00(s[0], qn0, pulse, pulse, pulse, clear);
	jkff JK01(s[1], qn1,	qn0, qn0, qn0, clear);
	jkff JK02(s[2], qn2,	qn1, qn1, qn1, clear);
	jkff JK03(s[3], qn3,	qn2, qn2, qn2, clear);
	jkff JK04(s[4], qn4,	qn3, qn3, qn3, clear);
	jkff JK05(s[5], qn5, qn4, qn4, qn4, clear);
	and(and1, qn0, s[1]);
	and(and2, qn2, s[3]);
	and(and3, qn4, qn5);
	and(and4, and1, and2);
	and(clear, and3, and4);
endmodule

module testContDecadCresc;
	reg pulse;
	wire[5:0] s;
	
	contDecadCresc CDC(s, pulse);
	initial begin
		$display("Exercicio04 - Átila Martins Silva Júnior - 449014");
		
		pulse = 0;
		 
		$monitor("s: %b %b %b %b %b %b",s[5], s[4], s[3], s[2], s[1], s[0]);
		
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
	end
endmodule