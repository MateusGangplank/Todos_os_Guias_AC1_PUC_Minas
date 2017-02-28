// ---------  Exemplo 0032 -------------------------
// ---- Ana Carolina Conceição de Jesus ------------
// ---- Matricula 449517 ---------------------------

module LU (output s, input a, input chave);

       wire s0;
       wire s1;
       wire s2;
       wire s3;
       wire notchave;

       and AND1(s0,a,chave);
       or OR1(s1,a,chave);
       and AND2 (s2,s0);
       not(notchave,chave);
       and AND3 (s3,s1,notchave);
       or OR2(s,s2,s3);


endmodule

module teste;
       reg a;
       reg chave;
       wire s;

       LU test(s,a,chave);

initial begin : main

		$display("Exemplo0032 - Ana Carolina - 449517");
		$display("ULA teste");

		chave = 0;
		a = 0;
		$display("\nchave = 0 (operacao and) chave = 1 (operacao or)");

 #1 $monitor("%b = saida %b chave = %b",a,s,chave);
 #1 chave = 1;
 #1 chave = 0; a = 1;
 #1 chave = 1;

 end
 
 endmodule