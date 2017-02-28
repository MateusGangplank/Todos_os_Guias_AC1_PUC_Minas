// ---------------------
// Guia 01 - XNOR
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------

// ---------------------
// -- XNOR gate
// ---------------------

module xnorgate (s, p, q, t, y);
 output s;
 input  p, q, t, y;

 assign s = ~(p ^ q ^ t ^ y);

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b,c;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);
 
          // parte principal
 initial begin
		$display("Guia 01 - Marden Santos Batista - 388613");
		$display("Test XNOR gate");
		$display("\n ~(a xnor b xnor c xnor d) = s\n");
		a=0; b=0;c=0; d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=0; b=0;c=0;d=1;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=0; b=0;c=1;d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=0; b=1;c=0;d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=0;c=0;d=0;
		#1 $display("%b ^ %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=0;c=0;d=1;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=1;c=1;d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=1;c=0;d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=1;c=0;d=1;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=1;c=1;d=0;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
		a=1; b=1;c=1;d=1;
		#1 $display("%b xnor %b xnor %b xnor %b = %b", a, b, c, d, s);
end

endmodule // testxnorgate