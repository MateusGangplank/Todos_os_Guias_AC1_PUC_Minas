//------------------
//Exercicio005 - NOR e morgan
//Nome: Felipe Barros
//Matricula: 376508
//-------------------

module norgate (output s, input p, input q);

assign s= ~(p|q);
endmodule

module normorgan (output s1, input p1, input q1);
assign s1= ~p & ~q;
endmodule

//--- teste

module testenorgate;
reg a, b;
wire s, s1;

norgate NOR1 (s, a, b);
normorgan Morgan (s1, a, b );

initial begin: start
a=0; b=0;
end

//-- parte principal
initial begin

$display ("teste nor e morgan de nor ");
$display ("s = ~(a+b e s1 = ~a.~b)");
$display ("\na  b  s  s1\n");
a=0; b=0;
#1 $display ("%b  %b  %b  %b", a, b, s, s1);
a=0; b=1;
#1 $display ("%b  %b  %b  %b", a, b, s, s1);
a=1; b=0;
#1 $display ("%b  %b  %b  %b", a, b, s, s1);
a=1; b=1;
#1 $display ("%b  %b  %b  %b", a, b, s, s1);
end 
endmodule
