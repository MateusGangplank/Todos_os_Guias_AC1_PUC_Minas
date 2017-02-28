// ------------------------- 
// Exemplo0036 - exercicio5
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609 
// ------------------------- 
// ------------------------- 
// LU_gate 
// ------------------------- 


module LU (output s0,s1,input a,input b);

wire s0,s1; 

xnor XNOR1 (s0,a,b);
not NOT1(s1,s0);

endmodule

module teste;
       reg a;
		 reg b;
       wire s0,s1;

       LU test(s0,s1,a,b);


initial begin:main 

$display("Exemplo0036 - Rafael Tadeu - 451609"); 
$display("Test exercicio02's module"); 

a=0;	b=0;	
$display("\ns0 = 1 A==B, s1 = 1 A!=B" );
 #1 $monitor("a = %b  b = %b  s0= %b  s1= %b ",a,b,s0,s1);

#1;a=0;	b=0;
#1	a=0;	b=1;
#1	a=1;	b=0;
#1	a=1;	b=1;

end
endmodule // test_f4 