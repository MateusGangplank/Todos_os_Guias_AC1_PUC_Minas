// Extra01 - COMPLEMENTO DE 1
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module extra_01;
	reg[7:0]a;
	
initial begin
	$display("Extra01 - Roger Rubens Machado - 430533");
	a = 8'b10101010;
	a = ~a;
	$display("a) a = %b", a);
end
endmodule // extra_01	