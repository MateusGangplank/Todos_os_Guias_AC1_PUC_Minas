//------------------------- 
// Exemplo0032 - F4 
// Nome: Douglas Henrique Silva Corr�a
// Matricula: 466503
// ------------------------- 
module f1(output s, input x, input y, input chave);
wire temp0, temp1, temp2, temp3, nchave;
and AND1(temp0, x, y);
or OR1(temp1, x, y);
//-------Multiplexador---------
not NOT1(nchave, chave);
and AND2(temp2, temp0,nchave);
and AND3(temp3, temp1, chave);
or OR2(s, temp2, temp3);
endmodule 
// ----- parte principal-------
module test;
reg x, y, chave;
wire s;
f1 Teste(s, x, y, chave);
initial begin 
$display("Exemplo0032 - Douglas Henrique Silva Corr�a - 466503"); 
$display("Test LU's module");
x = 1; y = 0; chave = 0;
#1 $display("X AND Y =%3b",s);
chave = 1;
#1 $display("X OR Y =%3b",s);  
end 
endmodule // test_f4 