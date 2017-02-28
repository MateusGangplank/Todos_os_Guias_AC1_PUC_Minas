// Exercicio 003 – Contador Decadino Crescente
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

module jkff(q,q1,j,k,c);
output q,q1;
input j,k,c;
reg q,q1;
initial begin q=1'b0; q1=1'b1; end
always @ (posedge c)
  begin
	case({j,k})
		 {1'b0,1'b0}:begin q=q; q1=q1; end
		 {1'b0,1'b1}: begin q=1'b0; q1=1'b1; end
		 {1'b1,1'b0}:begin q=1'b1; q1=1'b0; end
		 {1'b1,1'b1}: begin q=~q; q1=~q1; end
	endcase
   end
endmodule

module contDecadCresc(output[5:0] s, input pulse, input um);
	wire qn1, qn2, qn3, qn4, qn5;
	jkff JK00(s[5], qn5,um, um, pulse);
	jkff JK01(s[4], qn4,um, um, qn5);
	jkff JK02(s[3], qn3,um, um, qn4);
	jkff JK03(s[2], qn2,um, um, qn3);
	jkff JK04(s[1], qn1,um, um, qn2);
	jkff JK05(s[0],, um, um, qn1);
endmodule

module testContDecadCresc;
	reg pulse;
	reg um; 
	wire[5:0] s;
	
	contDecadCresc CDC(s, pulse, um);
	
	initial begin
		$display("Exercicio03 - Átila Martins Silva Júnior - 449014");
		
		um = 0;
		pulse = 0;
		 
		$monitor("s: %b %b %b %b %b %b",s[0], s[1], s[2], s[3], s[4], s[5]);
		
		#4 um = 1;
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
		#4pulse = 1;
		#4pulse = 0;
		#4pulse = 0;
		
	end
endmodule