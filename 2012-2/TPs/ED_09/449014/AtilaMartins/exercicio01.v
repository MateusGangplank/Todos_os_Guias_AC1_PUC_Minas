// Exercicio 001 – Contador Assincrono Decrescente
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

module contAssincDecresc(output[4:0] s, input pulse, input um);
	jkff JK04(,s[0],um, um, pulse);
	jkff JK03(,s[1],um, um, s[0]);
	jkff JK02(,s[2],um, um, s[1]);
	jkff JK01(,s[3],um, um, s[2]);
	jkff JK00(,s[4],um, um, s[3]);
endmodule

module testContAssincDecresc;
	reg pulse;
	reg um; 
	wire[4:0] s;
	
	contAssincDecresc CAD(s, pulse, um);
	
	initial begin
		$display("Exercicio01 - Átila Martins Silva Júnior - 449014");
		
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