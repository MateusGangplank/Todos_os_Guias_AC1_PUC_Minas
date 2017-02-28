// RAM 1X4
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

module ram1x4(output[3:0] saida, input[3:0] ent, input clk, input rw, input addr);
	wire a1, a2, a3,s0, s1, s2, n0, n1, n2, n3, rw1;
	not(n0, ent[0]);
	not(n1, ent[1]);
	not(n2, ent[2]);
	not(n3, ent[3]);
	
	and(a1, clk, rw);
	and(a2, a1, addr);
	
	jkff JK0(s0,, ent[0], n0, a2);
	jkff JK1(s1,, ent[1], n1, a2);
	jkff JK2(s2,, ent[2], n2, a2);
	jkff JK3(s3,, ent[3], n3, a2);
	
	and(saida[0], addr, s0);
	and(saida[1], addr, s1);
	and(saida[2], addr, s2);
	and(saida[3], addr, s3);
endmodule