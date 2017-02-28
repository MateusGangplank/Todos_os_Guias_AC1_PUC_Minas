//-----------------------
// Guia 02-01 - OR
// Nome : Marley Ribeiro 
// Matricula : 414510
//-----------------------


// ----------------------------
// -- Or gate feita de NANDS
// ----------------------------

module Orgate ( j , k , g);

output j;
input  k,g;
wire temp1, temp2;

nand nand1 ( temp1 ,k ) ;
nand nand2 (temp2 , g ) ;

assign j = ~( temp1 & temp2  );


endmodule // ORgate

//----------------
// --test or gate
//----------------

 module testORgate;

 reg  y , u;
 
 wire o ;

//instancia

 Orgate OR1 (o , y , u );

//main part

initial begin
   
	$display("\n Marley Ribeiro-414510\n");
   $display("Teste or gate baseado em NAND \n");
   $display("\n y	| u = s\n");
   $monitor("%b | %b = %b", y,u, o);

   y=1 ; u=0;
#1 y=1 ; u=1;
#1 y=0 ; u=0;
#1 y=0 ; u=1;

end

endmodule// testOrgate