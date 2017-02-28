// ---------------------
// Guia 01_01 XOR
// Nome: Marley Ribeiro	
// Matricula: 414510
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

 module xorgate ( x, y , z );
  output x;
  input y , z ;
  
  assign x = y ^ z ;
	
 endmodule // xorgate	
	
// ---------------------
// -- test xor gate
// ---------------------
 

  module testexorgate;
   reg  f ,g ;
   wire h;
	
//instancia

	xorgate xnor1 ( h, f, g );
	
//parte principal

initial begin

$display(" Marley Ribeiro - 414510 ");
$display(" Test XOR gate ");
$display(" \n a ^ b  = s\n");
f=0; g=0; 

#1  $display("%b ^ %b  = %b", f, g, h);
      f=0; g=1 ; 

#1  $display("%b ^ %b  = %b", f, g, h);
      f=1; g=0 ; 

#1  $display("%b ^ %b  = %b", f, g, h);
      f=1; g=1 ; 

#1  $display("%b ^ %b  = %b", f, g, h);
      

end    


endmodule // testxorgate