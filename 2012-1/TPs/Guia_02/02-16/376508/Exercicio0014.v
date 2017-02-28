//-------------------
// Exercicio0014 -- complemento de dois com limite do binario
// Nome: Felipe Barros
// Matricula: 376508
// -------------------

module testecompletolim2;

//-- definir dados
reg[7:0] a;
reg[6:0] b;
reg[5:0] c;
reg[4:0] d;
reg[7:0] e;	

//-- parte principal

initial begin

a= 8'b101010;
b= 7'o123; //-- nunca vi quartadecimal, vou colocar octadecimal
c= 6'd23;
d= 5'hE;
e= 8'o26;




$display ("\nresultado de complemento de dois com limite de binario\n" );
$display ("a=%8b", -a );
$display ("b=%7b", -b );
$display ("c=%6b", -c );
$display ("d=%5b", -d );
$display ("e=%8b", -e );

end
endmodule

