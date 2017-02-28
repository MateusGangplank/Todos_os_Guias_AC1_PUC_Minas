// ------------------------- 
// Exemplo0034 - exercicio4
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609 
// ------------------------- 
// ------------------------- 
// LU_gate 
// ------------------------- 


module LU (output s, input a,input b, input [1:0]chave);

wire tmp1,tmp2,tmp3,tmp4,tmp5,tmp8,tmp9,tmp10,tmp11,tmp12,tmp13,tmp14,tmp15,tmp16;
or OR1(tmp1,a,b);
nor NOR1 (tmp2,a,b);
xor XOR1 (tmp3,a,b);
xnor XNOR1 (tmp4,a,b);
not NOT1(tmp11,chave[1]);
not NOT2(tmp10,chave[0]);
not NOT3(tmp9,chave[1]);
not NOT4(tmp8,chave[0]);

// parte do mux
and AND1(tmp12,tmp1,tmp10,tmp11);
and AND1(tmp13,tmp2,chave[0],tmp9);
and AND1(tmp14,tmp3,chave[1],tmp8);
and AND4(tmp15,tmp4,chave[0],chave[1]);
// parte da saida
or OR2 (s,tmp12,tmp13,tmp14,tmp15);

endmodule

module teste;
       reg a;
		 reg b;
       reg [1:0]chave;
       wire s;

       LU test(s,a,b,chave);


initial begin:main 

$display("Exemplo0034 - Rafael Tadeu - 451609"); 
$display("Test exercicio02's module"); 

a=0;	b=0; chave[0]=0;	chave[1]=0;
$display("\nchave 00 - XNOR , chave 01 - XOR , chave 10 - NOR , chave 11 - OR");

 #1 $monitor("a = %b  b = %b chave = %b saida = %b",a,b,chave, s);
#1a=0;	b=1; chave[0]=0;	chave[1]=1;
#1a=1;	b=0; chave[0]=1;	chave[1]=0;
#1a=1;	b=1; chave[0]=1;	chave[1]=1;
#1a=0;	b=0; chave[0]=0;	chave[1]=0;
#1a=0;	b=1; chave[0]=0;	chave[1]=1;
#1a=1;	b=0; chave[0]=1;	chave[1]=0;
#1a=1;	b=1; chave[0]=1;	chave[1]=1;




end 
endmodule // test_f4 