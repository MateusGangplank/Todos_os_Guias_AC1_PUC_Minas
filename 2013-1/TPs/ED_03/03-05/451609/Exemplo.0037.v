// ------------------------- 
// Exemplo0037 - exercicio
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609 
// ------------------------- 
// ------------------------- 
// LU_gate 
// ------------------------- 


module LU (output s0,s1,s2,input a,input b);

wire s0,s1,s2; 
wire nota,notb;
xnor XNOR1 (s0,a,b);
not NOT1(nota,a);
not NOT2 (notb,b);
and AND1 (s1,a,notb);
and AND2 (s2,nota,b);

endmodule

module teste;
       reg a;
		 reg b;
       wire s0,s1,s2;

       LU test(s0,s1,s2,a,b);


initial begin:main 

$display("Exemplo0037 - Rafael Tadeu - 451609"); 
$display("Test exercicio02's module"); 

a=0;	b=0;	
$display("\ns0 = 1 A==B, s1 = 1 A > B s2 A < B" );
 #1 $monitor("a = %b  b = %b  s0= %b  s1= %b s2 = %b",a,b,s0,s1,s2);

#1;a=0;	b=0;
#1	a=0;	b=1;
#1	a=1;	b=0;
#1	a=1;	b=1;

end
endmodule // test_f4 