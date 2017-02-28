// ------------------------- 
// Exercicio04 - AND  
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 - 08/2011
// ------------------------- 
// ------------------------- 
// -- and com 3 entradas
// ------------------------- 
module and01 ( output s, input a, input b, input c); 
 
endmodule // and 
// --------------------- 
// -- test and01 
// --------------------- 
module testand01; 
// ------------------------- dados locais 

reg a,b,c; // definir registradores 
wire s; // definir conexao (fio)
 
// ------------------------- instancia 
not NOT01(s1,a);
not NOT02(s2,b);
not NOT03(s3,c);
or OR01(s,s1,s2,s3);

initial begin:start
a=0; b=0; c=0; 
end

initial begin:main

$display("Exercicio04 - Jorge Luis dos Santos Leal - 417466"); 
$display("Test AND com 3 entradas"); 
$display("\na & b & c = s\n"); 
$monitor("%b ^ %b & %b = %b", a, b, c, s);

#1 a=0 ; b=0 ; c=1;
#1 a=0 ; b=1 ; c=0;
#1 a=0 ; b=1 ; c=1;
#1 a=1 ; b=0 ; c=0;
#1 a=1 ; b=0 ; c=1;
#1 a=1 ; b=1 ; c=0;
#1 a=1 ; b=1 ; c=1;
end 
endmodule // testand01 


