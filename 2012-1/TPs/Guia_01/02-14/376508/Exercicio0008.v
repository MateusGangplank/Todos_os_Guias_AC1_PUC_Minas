//------------------
//Exercicio008 -  AND  com 3 entradas
//Nome: Felipe Barros
//Matricula: 376508
//-------------------

module andgate (output s, input p, input q, input r);
assign s = p&q&r;
endmodule

//-------- teste

module testeand;
reg a, b, c;
wire s;

andgate AND1 (s, a, b, c );

initial begin: start
a=0; b=0, c=0;
end


initial begin

$display ("teste andgate ");
$display ("\na b c s\n");
$monitor("%b %b %b %b", a, b, c, s );
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end
endmodule



