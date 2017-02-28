// ---------------------
// Guia 01_01 XNOR
// Nome: Marley Ribeiro	
// Matricula: 414510
// ---------------------

// ---------------------
// --  xnor gate
// ---------------------

 module xnorgate ( x, y , z , w ,b);
  output x;
  input y , z, w, b;
  
  assign x =  ~(y ^ z ^ w ^ b) ;
	
 endmodule // xnorgate	
	
// ---------------------
// -- test xnor gate
// ---------------------
 

  module testexnorgate;
   reg  f ,g ,k ,m ;
   wire h;
	
//instancia

	xnorgate xnor1 ( h, f, g , k , m);
	
//parte principal

initial begin

$display(" Marley Ribeiro - 414510 ");
$display(" Test xnor gate ");
$display(" \n a ^ b ^ c ^ m =s\n");
f=0; g=0; k=0; m=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=1 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=1 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=1 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=1 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=0 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=0 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=0 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=1; g=0 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=1 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=1 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=1 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=1 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=0 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=0 ; k=0;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      f=0; g=0 ; k=1;

#1  $display("%b ^ %b ^ %b ^ %b = %b", f, g, k ,m, h);
      
end    


endmodule // testxnorgate