//ARQ1 - Eduardo Botelho de Andrade - Guia03

module circ (output s,
             input chave,
             input grupo,
             input a,
             input b);
             
 xor xor1   (w1,a,b);
 xnor xnor1 (w2,a,b);
 or or1     (w3,a,b);
 nor nor1   (w4,a,b);
 not not1   (m1,chave);
 
 //mux1
 and and1 (m2,w1,m1);
 and and2 (m3,w2,chave);
 and and3 (m4,w3,m1);
 and and5 (m5,w4,chave);
 or or2   (m6,m2,m3);
 or or3   (m7,m4,m5);
 
 //mux2
 not not2 (w5,grupo);
 and and6 (m6,w5);
 and and7 (m7,grupo);
 or or4 (s,m6,m7);

endmodule

module testcirc;

 reg a,b,chave,grupo;
 wire s;
 
 circ circ1 (s,chave,grupo,a,b);

 initial begin
   a=0;
   b=0;
   chave=0;
   grupo=0;
 end
 
 initial begin
    $display("Eduardo Botelho de Andrade - 427395");
    $display("Test LU's module");
    $display("Chave: 0 = OR / 1 = AND");
    $monitor("x = %b , y = %b , s = %b     - chave = %b , grupo = %b",a,b,s,chave,grupo);
    
    #1 chave=1; grupo=1; //seletor de operação
    #1 b=1;
    #1 a=1; b=0;
    #1 b=1;

 end

endmodule