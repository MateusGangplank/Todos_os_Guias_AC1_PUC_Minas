// ------------------------- 
// Exemplo0035 - exercicio5
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609 
// ------------------------- 
// ------------------------- 
// LU_gate 
// ------------------------- 


module LU (output s, input a,input b, input [2:0]chave);

wire s1,s2,s3,s4,s5,s6,s7,s8;
wire tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7,tmp8;
wire notchave0,notchave1,notchave2; 

not NOT1 (s1,a);
or OR1(s2,a,b);
nor NOR1 (s3,a,b);
and AND1 (s4,a,b);
nand NAND1 (s5,a,b);
xor XOR1 (s6,a,b);
xnor XNOR1 (s7,a,b);
not NOT1(notchave0,chave[0]);
not NOT2(notchave1,chave[1]);
not NOT3(notchave2,chave[2]);

// parte do mux
and AND2(tmp1,s1,notchave0,notchave1,notchave2); 
and AND3(tmp2,s2,chave[0],notchave1,notchave2);
and AND4(tmp3,s3,notchave0,chave[1],notchave2);
and AND5(tmp4,s4,chave[0],chave[1],notchave2);
and AND6(tmp5,s5,notchave0,notchave1,chave[2]);
and AND7(tmp6,s6,chave[0],notchave1,chave[2]);
and AND8(tmp7,s7,notchave0,chave[1],chave[2]);

// parte da saida
or OR2 (s,tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7);

endmodule

module teste;
       reg a;
		 reg b;
       reg [2:0]chave;
       wire s;

       LU test(s,a,b,chave);


initial begin:main 

$display("Exemplo0035 - Rafael Tadeu - 451609"); 
$display("Test exercicio02's module"); 

a=0;	b=0; chave[0]=0;	chave[1]=0;	chave[2]=0;	
$display("\nchave 000 - NOT , chave 001 - OR , chave 010 - NOR , chave 011 - AND");
$display("\nchave 100 - NAND , chave 101 - XOR , chave 110 - XNOR ");

 #1 $monitor("chave = %b  a = %b b = %b saida = %b",chave,a,b, s);

#1chave[0]=0;	chave[1]=0;	chave[2]=1;	a=0;	b=0;
#1chave[0]=0;	chave[1]=0;	chave[2]=1;	a=0;	b=1;
#1chave[0]=0;	chave[1]=0;	chave[2]=1;	a=1;	b=0;
#1chave[0]=0;	chave[1]=0;	chave[2]=1;	a=1;	b=1;

#1chave[0]=0;	chave[1]=1;	chave[2]=0;	a=0;	b=0;
#1chave[0]=0;	chave[1]=1;	chave[2]=0;	a=0;	b=1;
#1chave[0]=0;	chave[1]=1;	chave[2]=0;	a=1;	b=0;
#1chave[0]=0;	chave[1]=1;	chave[2]=0;	a=1;	b=1;

#1chave[0]=0;	chave[1]=1;	chave[2]=1;	a=0;	b=0;
#1chave[0]=0;	chave[1]=1;	chave[2]=1;	a=0;	b=1;
#1chave[0]=0;	chave[1]=1;	chave[2]=1;	a=1;	b=0;
#1chave[0]=0;	chave[1]=1;	chave[2]=1;	a=1;	b=1;

#1chave[0]=1;	chave[1]=0;	chave[2]=0;	a=0;	b=0;
#1chave[0]=1;	chave[1]=0;	chave[2]=0;	a=0;	b=1;
#1chave[0]=1;	chave[1]=0;	chave[2]=0;	a=1;	b=0;
#1chave[0]=1;	chave[1]=0;	chave[2]=0;	a=1;	b=1;

#1chave[0]=1;	chave[1]=0;	chave[2]=1;	a=0;	b=0;
#1chave[0]=1;	chave[1]=0;	chave[2]=1;	a=0;	b=1;
#1chave[0]=1;	chave[1]=0;	chave[2]=1;	a=1;	b=0;
#1chave[0]=1;	chave[1]=0;	chave[2]=1;	a=1;	b=1;
 
#1chave[0]=1;	chave[1]=1;	chave[2]=0;	a=0;	b=0;
#1chave[0]=1;	chave[1]=1;	chave[2]=0;	a=0;	b=1;
#1chave[0]=1;	chave[1]=1;	chave[2]=0;	a=1;	b=0;
#1chave[0]=1;	chave[1]=1;	chave[2]=0;	a=1;	b=1;

end
endmodule // test_f4 