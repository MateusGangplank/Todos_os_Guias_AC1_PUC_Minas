// -------------------------
// Exemplo0032 - F4
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------


// -------------------------
// f4_gate
// -------------------------

module f4 (output s,
            input  x,
            input  y,
            input  chave);
  assign s = (y & ~chave) | (x & y) | (x & ~chave);
endmodule


module test_f4;

// ------------------------- definir dados
reg  a;
reg  b;
reg  c;
wire s;

f4 modulo (s, a,b,c);


initial begin:start
  a=0;b=0;c=0;
end


// ------------------------- parte principal
initial begin:main
  $display("Exemplo0032 - Davidson Francis - 466499");
  $display("Test LU's module");
  
  $display("a  b  chave  saida");
  $monitor("%b  %b  %b      %b", a,b,c, s);
 
  #1 a = 0; b = 0; c = 0;
  #1 a = 0; b = 0; c = 1;
  #1 a = 0; b = 1; c = 0;
  #1 a = 0; b = 1; c = 1;
  #1 a = 1; b = 0; c = 0;
  #1 a = 1; b = 0; c = 1;
  #1 a = 1; b = 1; c = 0;
  #1 a = 1; b = 1; c = 1;
end
endmodule
