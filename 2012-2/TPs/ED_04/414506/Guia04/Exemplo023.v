//----------------------
// Exemplo0023 - equality 
// Nome: Fernando dos Santos Silva 
// Matricula: 414506
//-----------------------

//equality

module circuit_equality(output [0:0]s,input [2:0]a ,input [2:0]b);
input [6:0]aux;

and AND1(aux[0],~a[2],b[2]);
and AND2(aux[1],~a[1],b[1]);
and AND3(aux[2],~a[0],b[0]);
and AND4(aux[3],a[2],~b[2]);
and AND5(aux[4],a[1],~b[1]);
and AND6(aux[5],a[0],~b[0]);
or  OR1(s[0],aux[0],aux[1],aux[2],aux[3],aux[4],aux[5]);

endmodule // end circuit_equality
//------------------------------
//test circuit_equality
//------------------------------

module  test_circuit_equality;

reg [2:0]x;
reg [2:0]y;
wire [0:0]z;

 circuit_equality equality(z,x,y);
 
 initial begin:main
 
 $display("Exemplo0023 - Fernando dos Santos Silva - 414506"); 
 $display("Test ALU's equality"); 
 $display("0-IGUAL 1-DIFENTE");
 x = 3'b111; y = 3'b011;
 $monitor("%3b  %3b  %1b",x,y,z);
  #1 x = 3'b111; y = 3'b111;
 #1 x = 3'b100; y = 3'b100;
 #1 x = 3'b011; y = 3'b110;
 
 
 end //endbegin

endmodule //end test_circuit_equality