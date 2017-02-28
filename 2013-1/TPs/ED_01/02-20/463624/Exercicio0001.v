// --------- exercicio 1 
//// Nome: xxx yyy zzz 
// Matricula: 999999 
// --------------------- 
// --------------------- 
// -- nandgate 
// ---------------------
module nandGate ( output s,
 input a, input b);
 assign s = (~(a&b));
 endmodule // nand
// --------------------- 
// -- test nandgate 
// --------------------- 
module exercicio0001;

reg a, b;
wire s;

nandGate nand1 ( s, a, b );
// ------ Preparaçao
initial begin:start
a=0;
b=0;
end 

// ------------------------- parte principal 
initial begin:main
$display("Exercicioo0001 - xxx yyy zzz - 463624"); 
$display("Tabela "); 
$display("\n a ~& b = s\n"); 
#1$display("\n %b ~& %b = %b \n", a, b, s);
a=0; b=1;
#1$display("\n %b ~& %b = %b \n", a, b, s);
a=1; b=0;
#1$display("\n %b ~& %b = %b \n", a, b, s);
a=1; b=1;
#1$display("\n %b ~& %b = %b \n", a, b, s);
end
endmodule//exercicio0001
