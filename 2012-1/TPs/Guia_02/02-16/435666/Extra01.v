// Extra01 - COMPLEMENTO DE 1
// Nome: Julio Machado 
// Matricula: 435666 
// -------------------------

module extra_01;
	reg[7:0]a;
	
initial begin
	$display("Extra01 - Julio Machado - 435666");
	a = 8'b10101010;
	a = ~a;
	$display("a) a = %b", a);
end
endmodule // extra_01	