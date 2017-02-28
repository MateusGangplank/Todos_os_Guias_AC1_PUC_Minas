// ---------------------------
// -- Exercicio03
// -- Marcos Felipe Martins Silva
// -- 415719
// ---------------------------

//-----------------
//--Module latchD
//-----------------
module latchD ( qn, q, enable, d1 );

input  d1, enable;
output qn, q;

not NOT0(nd,d1);
	
nand NAND0(s0, d1, enable);
nand NAND1(s1, enable, nd);
nand NAND2(qn, s0, q);
nand NAND3(q, s1, qn);
	
endmodule

//----------------------
//--Test module SrLatch
//----------------------

module test;
latchD latch( qn, q, enable, d1 );

reg  enable, d1;
wire qn, q;

initial begin

$display("Marcos Felipe Martins Silva - 415719");
$display("exercicio 03");
$display("\nSet b | Clear b | Q = b |Q = b\n");
$monitor("d = %b enable = %b: = Q' = %b Q = %b",enable, d1, qn, q);
  
   d1=1;enable=1;
#1 d1=0;enable=0;
#1 d1=1;enable=0;
#1 d1=0;enable=1;

end
endmodule