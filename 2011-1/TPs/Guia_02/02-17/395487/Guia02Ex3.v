// ---------------------
// Guia 02 Ex3 - NOT
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- Nand gate
// ---------------------

module nandgate (s, p);
 output s;
 input  p;
 
 assign s = ~( p & p);

endmodule // nandgate

// -----------------------------
// -- not gate utilizando nand
// -----------------------------

module notgate (s, p);
 output s;
 input  p;
 
 nandgate NAND1 (s,p);

endmodule // notgate 


module testnotgate;
 reg   a;
 wire  s;
          // instancia
 notgate NOT1 (s, a);
 
  initial begin:start
      a=0;
 end
 
          // parte principal
 initial begin
   	$display("Exemplo01 - Alvaro - 395487");
      $display("Test not gate");
      $display("\n~a = s\n");
      $monitor("~%b = %b", a, s);
  #1  a=1;
  
 end

endmodule // testnotgate