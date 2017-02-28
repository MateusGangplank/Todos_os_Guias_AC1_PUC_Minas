//------------------------------------
//-- Luiz Marques de Oliveira - 417138
//------------------------------------

//--MODULE LETRA_K

module letrak( output s , input a , input b , input c , input d);

xnor XNOR1(s,a,b,c,d);

endmodule

//--TEST_MODULE

module test_letrak;

reg x,y,w,z;
wire s;

letrak K1(s,x,y,w,z);

wire saida;

and AND1(saida ,s);


initial begin:start

#1 x=0; y=0; w=0; z=0; 





$display("Luiz Marques de Oliveira - 417138");
$display("Letra K");
$display("a  b  c  d == s1");
$display("%b %b %b %b ==  %b",x,y,w,z,s);


#1 x=0; y=0; w=0; z=1; 
#1 x=0; y=0; w=1; z=0; 
#1 x=0; y=0; w=1; z=1; 
#1 x=0; y=1; w=0; z=0; 
#1 x=0; y=1; w=0; z=1; 
#1 x=0; y=1; w=1; z=0; 
#1 x=0; y=1; w=1; z=1; 
#1 x=1; y=0; w=0; z=0; 
#1 x=1; y=0; w=0; z=1; 
#1 x=1; y=0; w=1; z=0; 
#1 x=1; y=0; w=1; z=1; 
#1 x=1; y=1; w=0; z=0; 
#1 x=1; y=1; w=0; z=1; 
#1 x=1; y=1; w=1; z=0; 
#1 x=1; y=1; w=1; z=1; 

end

endmodule // letrak
