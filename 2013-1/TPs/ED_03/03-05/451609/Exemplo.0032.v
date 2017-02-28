// ------------------------- 
// Exemplo0032 - exercicio2
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609 
// ------------------------- 
// ------------------------- 
// LU_gate 
// ------------------------- 


module LU (output s, input a,input b, input chave);

wire tmp1,tmp2,notchave,tmp3,tmp4;
and AND1(tmp1,a,b);
or OR1(tmp2,a,b);
not NOT1(notchave,chave);
// parte do mux
and AND2(tmp3,tmp1,notchave);
and AND3(tmp4,tmp2,chave);
// parte da saida
or OR2 (s,tmp3,tmp4);

endmodule

module teste;
       reg a;
		 reg b;
       reg chave;
       wire s;

       LU test(s,a,b,chave);


initial begin:main 

$display("Exemplo0032 - Rafael Tadeu - 451609"); 
$display("Test exercicio02's module"); 

a=0;	b=0; chave=0;
$display("\nchave = 0 (operacao and) chave = 1 (operacao or)");

 #1 $monitor("a = %b  b = %b chave = %b saida = %b",a,b,chave, s);
#1a=0;	b=0; chave=0;
#1a=0;	b=0; chave=1;
#1a=0;	b=1; chave=0;
#1a=0;	b=1; chave=1;
#1a=1;	b=0; chave=0;
#1a=1;	b=0; chave=1;
#1a=1;	b=1; chave=0;
#1a=1;	b=1; chave=1;




end 
endmodule // test_f4 