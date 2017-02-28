
//********************************************************
//EXERCICIO 01  ------- Mariana do Amaral Ferreira --405819
//********************************************************

//--Module latchSR
//-----------------
module latchSR ( u, q, r, s );
	input  r, s;
	output u, q;
 nor NOR1(q,s,u);   //primeira porta nor
 nor NOR2(u,r,q);  //segunda porta nor

endmodule//fim modulo latchSR

//*********************
//Teste module LatchSR
//*********************

   module test;
   latchSR latchsr (p0,q0,r0,s0);

     reg  r0, s0;
     wire p0, q0;

initial begin:start
   s0 = 1; r0=1;

  end

  initial begin:main
 
   $display("Exercicio01");
   $display("Mariana do Amaral--405819");
   $display("\n  Set [b] | Clear [b] | Q = [b] |Q = [b]\n");
   $monitor("Set [%b] | Clear [%b] | Q = [%b] |Q = [%b]",s0,r0,q0,p0);

        #1 s0 = 1; r0=0;
        #1 s0 = 0; r0=1;
        #1 s0 = 0; r0=0;


end
endmodule