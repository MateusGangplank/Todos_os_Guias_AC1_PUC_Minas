// ---------- Exemplo0033 --------------------
// --- Ana Carolina Conceição de Jesus -------
// --- Matricula 449517 ----------------------


module LU (output s, input a, input chave);
       
       wire s,s0,s1,s2,s3,s4,s5,s6;
       wire notchave;
        not NOT1 (notchave, chave);
        and AND1(s0,a,chave);
        or OR1(s1,a,chave);
        nor NOR1(s3,a,chave);
        nand NAND1(s4,a,chave);
        and AND2(s5,s0,s1);
        and AND3(s6,s3,s4,notchave);
        or OR2(s,s6,s5);
        
endmodule

module teste;
       wire s;
       reg a;
       reg chave;
       
       LU teste(s,a,chave);
       
       
   initial begin: main
   
           $display("Exemplo0033 - Ana Carolina - 449517");
		$display("ULA teste");

		chave = 0;
		a = 0;
		$display("\nchave = 0 (operacao nand e nor ) chave = 1 (operacao and e or)");

 #1 $monitor(" entrada = %b saida = %b chave = %b",a,s,chave);
 #1 chave = 1;
 #1 chave = 0; a = 1;
 #1 chave = 1;

 end
 
 endmodule