// ------------------------- 
//	Extra 02 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 - 08/2011
// ------------------------- 
// -- Extra02 - com 1 byte 
// ------------------------- 
module extra02 ( output s, input a, input b, input c, input d, input e, input f, input g, input h); 
 
endmodule //  
// --------------------- 
// -- test extra02 
// --------------------- 
module testextra02; 
// ------------------------- dados locais 

reg a,b,c,d,e,f,g,h; // definir registradores 
wire s; // definir conexao (fio)
 
// ------------------------- instancia 
or OR01(s,a,b,c,d,e,f,g,h);

initial begin:start
a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
end

initial begin:main

$display("Extra02 - Jorge Luis dos Santos Leal - 417466"); 
$display("Porta se sa�da com 1 byte - retorno 1 "); 
$display("\na b c d e f g h = s\n"); 
$monitor("%b %b %b %b %b %b %b %b = %b", a, b, c, d, e, f, g, h, s);

end 
endmodule // testextra02


