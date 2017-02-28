// -------------------------
// Exemplo0035 - F4
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------


// -------------------------
// f4_gate
// -------------------------

module f4 (output s,
            input  x,
            input  y,
            input  c1, input c2, input c3);
  assign s = (~x & ~y & ~c3) + (~x & y & ~c2) + (x & ~y & ~c2 & c3) + 
              (x & ~y & c1 & ~c2) + (x & y & ~c1 & c3) + (x & y & c1 & c2 & ~c3);
endmodule

// USAR PORTAS !!!

module test_f4;

// ------------------------- definir dados
reg  a;
reg  b;
reg  c1;
reg  c2;
reg  c3;
wire s;

f4 modulo (s, a,b,c1,c2,c3);


initial begin:start
  a=0;b=0;  c1=0;c2=0;c3=0;
end


// ------------------------- parte principal
initial begin:main
  $display("Exemplo0035 - Davidson Francis - 466499");
  $display("Test LU's module");
  
  $display("a  b  chave  saida");
  $monitor("%b  %b  %b %b %b     %b", a,b,c1,c2,c3, s);
 
  #1 a = 0; b = 0;   c1 = 0; c2=0; c3=0;
  #1 a = 0; b = 0;   c1 = 0; c2=0; c3=1;
  #1 a = 0; b = 1;   c1 = 0; c2=1; c3=0;
  #1 a = 0; b = 1;   c1 = 0; c2=1; c3=1;
  #1 a = 1; b = 0;   c1 = 1; c2=0; c3=0;
  #1 a = 1; b = 0;   c1 = 1; c2=0; c3=1;
  #1 a = 1; b = 1;   c1 = 1; c2=1; c3=0;
  #1 a = 1; b = 1;   c1 = 1; c2=1; c3=1;
end
endmodule
