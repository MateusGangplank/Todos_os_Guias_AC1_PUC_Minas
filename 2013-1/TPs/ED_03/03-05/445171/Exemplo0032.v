// -------------------------
// Exemplo0032
// Nome: Raphael Quintao
// Matricula: 445171
// -------------------------
// -------------------------
// 
// -------------------------
module f4 (output s, input a,input b, input k);

wire s1, s2, s3, s4, xxx;

and and1(s1, a, b);
and and2(s2, a, k);
and and3(s3, b, k);

or or1 (s4, s2, s3);
or or2 (s, s1, s4);

endmodule
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg k;
wire s;
f4 modulo (s, x, y, k);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Raphael Quintao - 445171");
$display("Test LU's module");

x = 0; y = 0; k = 0;

$monitor("x = %1b -- y = %1b k = %1b Resultado = %1b",x,y,k,s );

#1x = 0; y = 1; k = 0;
#1x = 1; y = 0; k = 0;
#1x = 1; y = 1; k = 0;

#1x = 0; y = 0; k = 1;
$display("\n");


#1x = 0; y = 1; k = 1;
#1x = 1; y = 0; k = 1;
#1x = 1; y = 1; k = 1;

end
endmodule // test_f4