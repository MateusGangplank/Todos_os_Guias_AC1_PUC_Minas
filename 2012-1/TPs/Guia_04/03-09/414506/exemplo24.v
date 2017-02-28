// Exemplo0024 - difference
// Nome: Fernando Silva 
// Matricula: 414506
//-----------------------

//difference

module circuit_difference(output [4:0]s,input [3:0]a ,input [3:0]b);


xnor X1(s[0],a[0],b[0]);
xnor X2(s[1],a[1],b[1]);
xnor X3(s[2],a[2],b[2]);
xnor x4(s[3],a[3],b[3]);
and A1(s[4],s[0],s[1],s[2],s[3]);


endmodule // end circuit_difference
//------------------------------
//test circuit_difference
//------------------------------

module  test_circuit_difference;

reg [3:0]x;
reg [3:0]y;
wire [4:0]z;

 circuit_difference difference(z,x,y);
 
 initial begin:main
 
 $display("Exemplo0024 - Fernando Silva - 414506"); 
 $display("Test ALU's difference"); 
 $display("0 = difference ");
 x = 4'b0101; y = 4'b1001;
 $monitor("%3b  %3b  %1b",x,y,z[4]);
  #1 x = 4'b1111; y = 4'b1111;
 #1 x = 4'b1010; y = 4'b1000;
 #1 x = 4'b0110; y = 4'b0110;
 
 
 end //endbegin

endmodule //end test_circuit_equality