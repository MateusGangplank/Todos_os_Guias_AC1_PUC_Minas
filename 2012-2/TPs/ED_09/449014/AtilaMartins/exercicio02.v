// Exercicio 002 – Contador Assincrono Crescente
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

module contAssincCresc(output[4:0] s, input pulse, input um);
	wire qn1, qn2, qn3, qn4;
	jkff JK04(qn4,s[0],um, um, pulse);
	jkff JK03(qn3,s[1],um, um, qn4);
	jkff JK02(qn2,s[2],um, um, qn3);
	jkff JK01(qn1,s[3],um, um, qn2);
	jkff JK00(,s[4],um, um, qn1);
endmodule

module testContAssincCresc;
	reg pulse;
	reg um; 
	wire[4:0] s;
	
	contAssincCresc CAC(s, pulse, um);
	
	initial begin
		$display("Exercicio02 - Átila Martins Silva Júnior - 449014");
		
		um = 0;
		pulse = 0;
		 
		$monitor("saida => bin: %b\tDec:%d",s,s);
		
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