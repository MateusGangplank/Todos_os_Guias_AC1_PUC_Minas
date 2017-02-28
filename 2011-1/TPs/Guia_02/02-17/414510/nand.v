//-----------------------
// Guia 02-01 - NAND	
// Nome : Marley Ribeiro 
// Matricula : 414510
//-----------------------


// ----------------------------
// -- NAND gate feita de Nor
// ----------------------------

module 	Nandgate ( j , k ,g );

output j;
input  k,g;
wire temp1 , temp2 , temp3;

nor NOR1 (temp1 , k);
nor NOR2 (temp2 , g);
nor NOR3  (temp3 , temp1 , temp2);

assign j = ~(  temp3 | temp3 );


endmodule // nandgate

//----------------
// --test NAND gate
//----------------

 module testNandgate;

 reg  y , u ;
 
 wire o ;

//instancia

 Nandgate NAND1 (o , y ,u );

//main part

initial begin
   
	$display("\n Marley Ribeiro-414510\n");
   $display("Teste NAND gate baseado em NOR \n");
   $display("\n ~(y & u )= s \n");
   $monitor("  ~ (%b & %b)  = %b",y,u ,o );
 
   y=0 ; u=0 ; 
#1 y=0 ; u=1 ;
#1 y=1 ; u=0 ;
#1 y=1 ; u=1 ;


end

endmodule// testNANDgate