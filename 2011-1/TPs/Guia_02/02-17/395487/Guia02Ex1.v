// ---------------------
// Guia 02 Ex1 - OR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- Nand gate
// ---------------------

module nandgate (s, p, q ,r);
 output s;
 input  p, q , r;

 assign s = ~(p & q & r); //--- orgate utilizando negacoes de nand

endmodule // andgate

// ---------------------
// -- or gate with nand
// ---------------------

module orgate (s0, p, q ,r);
 output s0;
 wire s1, s2 , s3;
 input  p, q , r;

 nandgate NAND1 (s1, p, p , p);
 nandgate NAND2 (s2, q, q ,q );
 nandgate NAND3 (s3, r, r, r);
 nandgate NAND4 (s0, s1, s2 ,s3);

endmodule // orgate

// ---------------------
// -- test or gate
// ---------------------

module testorgate;
 reg   a, b , c ;
 wire  s;
          // instancia
 orgate OR1 (s, a, b ,c);
 
 initial begin:start
      a=0; b=0;c=0;
 end
 
          // parte principal
 initial begin
 		$display("Exemplo01 - Alvaro - 395487");
      $display("Test or gate");
      $monitor(" %b | %b  | %b = %b" , a ,b ,c ,s);
  #1  a=0; b=0; c=0;
  #1  a=0; b=0;c=1;
  #1  a=0; b=1;c=0;
  #1  a=0; b=1;c=1;
  #1  a=1; b=0;c=0;
  #1  a=1; b=0;c=1;
  #1  a=1; b=1;c=0;
  #1  a=1; b=1;c=1;  
 end

endmodule // testorgate