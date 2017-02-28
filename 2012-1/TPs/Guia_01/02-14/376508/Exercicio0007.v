//------------------
//Exercicio007 - NXOR e expressão
//Nome: Felipe Barros
//Matricula: 376508
//-------------------

module xorgate (output s, input p, input q);
assign s= p^q;
endmodule

module AND1 (output s2, input p2, input q2 );
assign s2= p2 & q2;
endmodule

module AND2 (output s3, input p3, input q3 );

assign s3= ~q3 & ~p3;
endmodule


module testexorgate;
reg a, b;
wire s, s1, s2, s3;
xorgate XOR1 (s, a, b);
AND1 and1(s1, a, b);
AND2 and2 (s2, a, b);


initial begin: start
a=0; b=0;
end

initial begin

$display ("teste xor e expressão de xor" );
$display ("  \na  b ab ~a~b (~ab)+(a~b)\n");
a=0; b=0;
#1 $display ("%b %b %b   %b    %b", a, b, s1, s2, s);
a=0; b=1;
#1 $display ("%b %b %b   %b    %b", a, b, s1, s2, s);
a=1; b=0;
#1 $display ("%b %b %b   %b    %b", a, b, s1, s2, s);
a=1; b=1;
#1 $display ("%b %b %b   %b    %b", a, b, s1, s2, s);
end
endmodule
 



