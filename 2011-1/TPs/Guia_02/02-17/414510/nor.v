//-----------------------
// Guia 02-01 - NOR	
// Nome : Marley Ribeiro 
// Matricula : 414510
//-----------------------


// ----------------------------
// -- NOR gate feita de NAND
// ----------------------------

module notgate ( j , k ,g );

output j;
input  k,g;
wire temp1 , temp2 , temp3;

nand NAND1 (temp1 , k);
nand NAND2 (temp2 , g);
nand NAND3  (temp3 , temp1 , temp2);

assign j = ~(  temp3 & temp3 );


endmodule // norgate

//----------------
// --test nor gate
//----------------

 module testNOTgate;

 reg  y , u ;
 
 wire o ;

//instancia

 notgate NOT1 (o , y ,u );

//main part

initial begin
   
	$display("\n Marley Ribeiro-414510\n");
   $display("Teste NOR gate baseado em NAND \n");
   $display("\n ~(y & u )= s \n");
   $monitor("  ~ (%b & %b)  = %b",y ,u ,o );
 
   y=1 ;u=0 ; 
#1 y=1 ;u=1 ;
#1 y=0 ;u=0 ;
#1 y=0 ;u=1 ;


end

endmodule// testNotgate