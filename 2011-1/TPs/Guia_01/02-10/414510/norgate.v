// ---------------------
// Guia 01_01 NOR
// Nome: Marley Ribeiro	
// Matricula: 414510
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

 module norgate ( x, y , z , w );
  output x;
  input y , z, w;
  
  assign x =  ~(y | z | w) ;
	
 endmodule // NORgate	
	
// ---------------------
// -- test nor gate
// ---------------------
 

  module testenorgate;
   
   reg  f ,g ,k;
   wire h;
	
//instancia

  norgate nor1 ( h, f, g,k);
	
//parte principal

initial begin

$display(" Marley Ribeiro - 414510 ");
$display(" Test nor gate ");
$display(" \na | b | c =s\n");
f=0; g=0; k=0;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=1; g=1 ; k=1;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=1; g=1 ; k=0;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=1; g=0 ; k=1;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=1; g=0 ; k=0;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=0; g=1 ; k=1;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=0; g=1 ; k=0;

#1  $display("%b | %b | %b = %b", f, g, k , h);
      f=0; g=0 ; k=1;

#1  $display("%b | %b | %b = %b", f, g, k , h);
end    


endmodule // testnorgate