// Exercicio 006 – Contador Em Anel
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

module contAnel(output[5:0] s, input clk, input entrada);
	wire or1, nor1,qn1, qn2, qn3, qn4, qn5;
	or(or1, s[0], entrada);
	not(nor1, or1);
	jkff JK00(s[5], qn5, or1, nor1, clk);
	jkff JK01(s[4], qn4,s[5], qn5, clk);
	jkff JK02(s[3], qn3,s[4], qn4, clk);
	jkff JK03(s[2], qn2,s[3], qn3, clk);
	jkff JK04(s[1], qn1,s[2], qn2, clk);
	jkff JK05(s[0],    ,s[1], qn1, clk);
endmodule

module testContAnel;
	reg clk;
	reg entrada; 
	wire[5:0] s;
	
	contAnel CA(s, clk, entrada);
	
	initial begin
		$display("Exercicio07 - Átila Martins Silva Júnior - 449014");
		
		entrada = 0;
		clk = 0;
		 
		$monitor("s: %b %b %b %b %b %b",s[5], s[4], s[3], s[2], s[1], s[0]);
		
		#4 entrada = 1;
		#4clk = 1;
		#4clk = 0;
		#4 entrada = 0;	
		#4clk = 1;
		#4clk = 0;	
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		#4clk = 1;
		#4clk = 0;
		
	end
endmodule