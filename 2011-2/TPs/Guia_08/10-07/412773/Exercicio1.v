// Exercicio1
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773

module clock ( clok );
	output clok;
	reg clok;
	initial begin
	   clok = 1'b0;
	end
	
	always begin
	   #12 clok = ~clok;
	end
endmodule


module dff ( output q, output qnot, input d, input clok );
	reg q, qnot;
	always @( posedge clok )
	begin
		q = d;
		qnot = ~q;
	end
endmodule


module leftRegister (output [4:0]s, input d, input clok);
wire nots;

	dff FF0 (s[0], nots, d, clok);
	dff FF1 (s[1], nots, s[0], clok);
	dff FF2 (s[2], nots, s[1], clok);
	dff FF3 (s[3], nots, s[2], clok);
	dff FF4 (s[4], nots, s[3], clok);

endmodule