// --------------------- 
// Exemplo0010 - or 
// Nome: Ursula Rosa Monteiro de Castro 
// Matricula: 427468 
// --------------------- 
// --------------------- 
// -- or gate 
// --------------------- 
module orgate (output s, input p, input q, input o); 
not NOT1 (s1, p);
not NOT2 (s2, q);
not NOT3 (s3, o );
assign s = ~(s1&s2&s3); 
endmodule      // or 
// --------------------- 
// -- test orgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg  a,b,c;       // definir registrador 
wire  s;        // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0;     
b=0;  
c=0;
  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0010 - Ursula Rosa - 427468"); 
$display("Test or gate"); 
$display("\n a | b | c = s\n"); 
$monitor("%b | %b | %b = %b" , a, b, c, s);
#1  a=0; b=0; c=0;
#1  a=0; b=0; c=1;
#1  a=0; b=1; c=0;
#1  a=0; b=1; c=1;
#1  a=1; b=0; c=0;
#1  a=1; b=0; c=1;
#1  a=1; b=1; c=0;
#1  a=1; b=1; c=1;
end 
endmodule  // testorgate 