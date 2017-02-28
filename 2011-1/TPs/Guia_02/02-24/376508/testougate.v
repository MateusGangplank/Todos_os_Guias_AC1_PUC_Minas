// ---------------------
// Guia 02 exericio02
// Nome: Felipe Barros
// Matricula: 376508
// ---------------------



module ougate (s, p, q);
output s;
input p, q;
assign s= p | q;

endmodule

module testougate;
reg a, b;
wire s;

ougate OR1 (s, a, b);
 
initial begin: start
a=0; b=0;
end

initial begin: main
$display ("Guia02 exercicio 01");
$display ("tabela-verdade para porta OR");
$display ("a | b = s");
$monitor("%b | %b = %b ", a, b, s);
  
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
 end

endmodule


//---------------------
// Porta nand
//---------------------


module nandgate (s1, p1, q1, r1);
output s1;
input p1, q1, r1;
assign s= ~(p1 & q1 & r1);
endmodule

module testnandgate;
reg a, b, c;
wire s;
nand (s, a, b, c);

endmodule