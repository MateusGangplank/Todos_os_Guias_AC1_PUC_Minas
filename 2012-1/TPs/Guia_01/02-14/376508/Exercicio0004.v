//--------------------- 
// Exercicio0004 -- NAND com propriedade de morgan
// Nome: Felipe Barros
// Matricula: 376508
//--------------------

module nandgate (output s, input p, input q);

assign s= ~(p&q);

endmodule

module nandmorgan (output s1, input p1, input q1);
assign s1= ~p1 | ~q1;

endmodule



//--------- teste nand

module testnandgate;
reg a, b;
wire s, s1;

nandgate NAND1 (s, a, b);
nandmorgan MORGAN (s1, a, b);
initial begin: start
a=0; b=0;
end

//-- parte principal
initial begin

$display ("teste nand e morgan de nand");
$display (" s=~(a.b)  e s1=~a+~b ");
$display  ("\na b  s  s1\n");
a=0; b=0;
#1 $display ("%b %b  %b %b", a, b, s, s1);
a=0; b=1;
#1 $display ("%b %b  %b %b ", a, b, s, s1);
a=1; b=0;
#1 $display ("%b %b  %b %b ", a, b, s, s1);
a=1;b=1;
#1 $display ("%b %b  %b %b ", a, b, s, s1);

end
endmodule

