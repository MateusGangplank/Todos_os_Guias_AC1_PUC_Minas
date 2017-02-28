// Extra02 - COMPLEMENTO DE 2
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module extra_02;
	reg[7:0]a;
	
initial begin
	$display("Extra02 - Roger Rubens Machado - 430533");
	a = 8'b10101010;
	a = ~a;
	a = a + 1;
	$display("a) a = %b", a);
end
endmodule // extra_02	