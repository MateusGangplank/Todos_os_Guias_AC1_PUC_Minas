//------------------------------------
//-- Luiz Marques de Oliveira - 417138
//------------------------------------

//--MODULE LETRAJ

module letraj(output sf , input a , input b , input c , input d);

wire sf , a, b, c, d, cnot, dnot,s1,s2,s3;

//--PORTAS

not NOT1(cnot , c);
not NOT2(dnot , d);

and AND1(s1 , a ,cnot);
and AND2(s2 , cnot , b , dnot);
and AND3(s3 , a , b , dnot );

or OR1(sf , s1, s2, s3);

endmodule // letraj
//--TEST MODULE

module test_letraj;

reg a,b,c,d;
wire cnot,dnot,s1,s2,s3,sf;

letraj J1(sf,a,b,c,d);


initial begin




$display("Luiz Marques de Oliveira - 417138");
$display("Letra J");
$display("a  b  c  d == sf");
$display("%b %b %b %b ==  %b",a,b,c,d,sf);


#1 a=0; b=0; c=0; d=0; 
#1 a=0; b=0; c=0; d=1; 
#1 a=0; b=0; c=1; d=0; 
#1 a=0; b=0; c=1; d=1; 
#1 a=0; b=1; c=0; d=0; 
#1 a=0; b=1; c=0; d=1; 
#1 a=0; b=1; c=1; d=0; 
#1 a=0; b=1; c=1; d=1; 
#1 a=1; b=0; c=0; d=0; 
#1 a=1; b=0; c=0; d=1; 
#1 a=1; b=0; c=1; d=0; 
#1 a=1; b=0; c=1; d=1; 
#1 a=1; b=1; c=0; d=0; 
#1 a=1; b=1; c=0; d=1; 
#1 a=1; b=1; c=1; d=0; 
#1 a=1; b=1; c=1; d=1; 

end

endmodule // letraj
