// ---------------------
// Guia 01_01 NAND
// Nome: Marley Ribeiro	
// Matricula: 414510
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

 module nandgate ( x, y , z , w );
  output x;
  input y , z, w;
  
  assign x =  ~(y & z & w) ;
	
 endmodule // nandgate	
	
// ---------------------
// -- test nand gate
// ---------------------
 

  module testeandgate;
   reg  f ,g ,k;
	wire h;
	
//instancia

	nandgate nand1 ( h, f, g,k);
	
//parte principal

initial begin

$display(" Marley Ribeiro - 414510 ");
$display(" Test NAND gate ");
$display(" \na & b & c =s\n");
f=0; g=0; k=0;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=1; g=1 ; k=1;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=1; g=1 ; k=0;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=1; g=0 ; k=1;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=1; g=0 ; k=0;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=0; g=1 ; k=1;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=0; g=1 ; k=0;

#1  $display("%b & %b & %b = %b", f, g, k , h);
      f=0; g=0 ; k=1;

#1  $display("%b & %b & %b = %b", f, g, k , h);
end    


endmodule // testnandgate