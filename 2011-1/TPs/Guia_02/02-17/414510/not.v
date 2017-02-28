//-----------------------
// Guia 02-01 - NOT	
// Nome : Marley Ribeiro 
// Matricula : 414510
//-----------------------


// ----------------------------
// -- NOT gate feita de NAND
// ----------------------------

module notgate ( j , k );

output j;
input  k;

assign j = ~( k & k  );


endmodule // notgate

//----------------
// --test or gate
//----------------

 module testNOTgate;

 reg  y ;
 
 wire o ;

//instancia

 notgate NOT1 (o , y );

//main part

initial begin
   
	$display("\n Marley Ribeiro-414510\n");
   $display("Teste NOT gate baseado em NAND \n");
   $display("\n ~(y)= s \n");
   $monitor("  ~ (%b)  = %b",y,o );
 
   y=0 ; 
#1 y=1 ; 


end

endmodule// testNotgate