// FAVOR COLOCAR NOME E MATRICULA

module letra_l(output sf , input a , input b , input c,input d);

wire s1,s2,s3,sf,anot,bnot,a,b,c,d; 

not NOT1(anot, a); 
not NOT2(bnot , b);

and AND1(s1 , anot , c);
and AND2(s2 , bnot , d, c);
and AND3(s3 , anot , bnot , d);

or OR1(sf , s1,s2,s3);
endmodule // quest�ol


module test_letraL;

	reg x,y,w,z;
	wire s;

	letra_l L(s,x,y,w,z);

	initial begin
	#1 x=0; y=0; w=0; z=0; 

	end


initial begin

$display("Luiz Marques de Oliveira  - 417138");
$display("LETRA L");
$display("a b c d  = s0");
$display("%b %b %b %b %b",x,y,w,z,s);

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
endmodule // letra l