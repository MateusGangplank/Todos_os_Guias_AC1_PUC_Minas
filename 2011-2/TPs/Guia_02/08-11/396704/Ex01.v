// ------------------------- 
// Ex01 - BASE 
// Nome: Igor Thadeu 
// Matricula: 396704 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module operacao; 
// ------------------------- definir dados 
      reg [4:0] a; 
      reg [4:0] b; 
      reg [3:0] c; 
      reg [3:0] d; 
		reg [3:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Ex01 - Igor Thadeu - 396704"); 
      $display("Operacoes:"); 
 
      a =   6'b100010 + 5'b11010; 
      b =  3 * 7 ; 
      c =  34 / 3; 
      d =  19 - 11;
		e =  2 * 4 + 6 - 1;
       
      $display("\nResultado"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %3b", c, c); 
      $display("d = %d = %3b", d, d); 
		$display("e = %d = %3b", e, e); 
 end 
 
endmodule // operacao