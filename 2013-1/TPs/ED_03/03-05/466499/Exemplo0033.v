// -------------------------
// Exemplo0033 - F4
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------


// -------------------------
// f4_gate
// -------------------------

module f4 (output s, output p,
            input  x,
            input  y,
            input  chave);
  assign s = (~x & ~y & chave) | (y & ~chave) | (x & ~chave);
  assign p = (~x & chave) | (~y & chave) | (x & y & ~chave);
endmodule


module test_f4;

// ------------------------- definir dados
reg  a;
reg  b;
reg  c;
wire s1,s2;

f4 modulo (s1,s2,   a,b,c);


initial begin:start
  a=0;b=0;c=0;
end


// ------------------------- parte principal
initial begin:main
  $display("Exemplo0033 - Davidson Francis - 466499");
  $display("Test LU's module");
  
  $display("a  b  chave  saida1  saida2");
  $monitor("%b  %b  %b      %b   %b", a,b,c, s1,s2);
 
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
