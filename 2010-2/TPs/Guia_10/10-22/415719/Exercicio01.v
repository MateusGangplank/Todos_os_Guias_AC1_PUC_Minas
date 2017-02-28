// ---------------------------
// -- Exercicio01
// -- Marcos Felipe Martins Silva
// -- 415719
// ---------------------------

//-----------------
//--Module latch
//-----------------
module latch ( qn, q, r, s );
	input  r, s;
	output qn, q;	

	nor NOR1(q,s,qn);
	nor NOR2(qn,r,q);
endmodule

//----------------------
//--Test module Latch
//----------------------

module test;
latch latch (p1,q1,r1,s1);

reg  r1, s1;
wire p1, q1;

  initial begin
 
   $display("Exercicio 01");
   $display("Marcos Felipe Martins Silva-415719");
   $display("\nSet  b _ Clear  b _ Q = b  Q = b\n");
   $monitor("Set: %b _ Clear: %b _ Q = %b  Q = %b", s1,r1, q1, p1);

           s1 = 1; r1= 1;
        #1 s1 = 1; r1=0;
        #1 s1 = 0; r1=1;
        #1 s1 = 0; r1=0;


end
endmodule