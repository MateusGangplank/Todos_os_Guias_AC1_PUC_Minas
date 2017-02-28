//-------------------
// Exercicio0013 -- complemento de dois
// Nome: Felipe Barros
// Matricula: 376508
// -------------------

module testecomplemento2;
reg[5:0] a;
reg[5:0] b;
reg[5:0] c;
reg[6:0] d;
reg[7:0] e;

initial begin

$display ("Exercicio0013 - complemento de dois ");
a= 6'b100111;
b= 6'o23;
c= 6'd23;
d= 8'h2B;
e= 8'd26- 8'd36;

$display ("\nresultado de complemento de dois\n" );
$display ("a=%6b", -a );
$display ("b=%6b", -b );
$display ("c=%6b", -c );
$display ("d=%8b", -d );
$display ("e=%6b", -e );

end
endmodule
