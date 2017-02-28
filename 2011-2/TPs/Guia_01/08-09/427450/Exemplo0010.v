// --------------------- 
// Exemplo0010 - or 
// Nome: Patrick Flávio Teixeira Coura 
// Matricula: 427450 
// --------------------- 
 
// --------------------- 
// -- or gate 
// --------------------- 
 
module orgate (output s, input p, input q, input r); 
not NOT1 (s1, p);
not NOT2 (s2, q);
not NOT3 (s3, r);
assign s = ~(s1&s2&s3); 
endmodule // or 
 
// --------------------- 
// -- test orgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg  a,b,c; // definir registrador 
   wire s;    // definir conexao (fio) 
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
      $display("Exemplo0010 - Patrick Flávio Teixeira Coura - 427450"); 
      $display("Test or gate"); 
		$display("a | b | c = s\n");
      $monitor("%b | %b | %b = %b", a ,b, c, s); 
  #1  a=0; b=0; c=0;    
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;    
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;
 end 
 
endmodule // testorgate