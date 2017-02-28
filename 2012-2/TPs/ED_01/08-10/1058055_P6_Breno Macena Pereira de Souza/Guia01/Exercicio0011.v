// -------------------------
// Exercicio0011 - (Extra)
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- extra gate
// -------------------------
module extragates (output s, input a, b, c, d, e, f, g, h);
  assign s = ~a & ~b & (~d | ~c) & ~e & ~f & (~h | ~g);
endmodule // orgate1

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
// ------------------------- dados locais
   reg a, b, c, d, e, f, g, h;
   wire s;
// ------------------------- inst�ncias
   extragates EXTRA1 (s, a, b, c, d, e, f, g, h);

// ------------------------- prepara��o
initial begin:start
  a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
end

// ------------------------- parte principal
initial begin:main
     $display("Exerc�cio 0011 - Breno Macena - 462017");
     $display("Test combination of ports:");

	  $monitor("%b%b%b%b%b%b%b%b = %b", a, b, c, d, e, f, g, h, s);
#1   a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
#1   a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1;
#1   a=1; b=0; c=1; d=0; e=1; f=0; g=1; h=0;
#1   a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1;
end
endmodule // testorgate












