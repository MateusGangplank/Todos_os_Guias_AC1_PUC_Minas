//------------------
//Exercicio009 -  AND  com 3 entradas e outro AND
//Nome: Felipe Barros
//Matricula: 376508
//-------------------

module andgate (output s, input p, input q);
assign s = p&q;
endmodule

module andgate1 (output s1, input p1, input q1, r1);
assign s= p1 & q1 & r1;
endmodule

//-------- teste

module testeand;
reg a, b, c;
wire s, s1;

andgate AND1 (s1, a , b );
andgate1 AND2 (s, s1, c);

initial begin: start
a=0; b=0, c=0;
end


initial begin

$display ("teste andgate ");
$display ("\na b c s\n");
$monitor("%b %b %b %b %b", a, b, c,s1, s );
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end
endmodule



