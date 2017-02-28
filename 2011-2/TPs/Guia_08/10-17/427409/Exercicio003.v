//Guilherme Rodrigues Melo de Oliveira
//Matricula: 427409

module dff ( output q, output qnot, 
input   d, input clk);
reg q, qnot;
always @( posedge clk )
begin
    q <= d; qnot <= ~q;
end
endmodule // dff

  

module deslocador(output s1,
						output s2,
						output s3,
						output s4,
						output s5,
						input s0,
						input clk,
                  input clr,
						input ld,
						input q0,
						input preset);

dff D1(s1,s1,s0,clk);
dff D2(s1,s1,1,clk);
dff D3(s2,s2,s1,clk);
dff D4(s3,s3,s2,clk);
dff D5(s4,s4,s3,clk);
and AND1(ld,q0,s5);

endmodule

module test;
reg   clk, clr, ld,q0,preset,s0,s11,s22,s33,s44,s55;
wire s1,s2,s3,s4,s5;
deslocador d (s1,s2,s3,s4,s5,s0,clk,clr,ld,q0,preset);
initial
  begin
// initial values 
		 clk   = 1;
       clr = 0;
       preset = 1;
		 ld = 1;
		 q0 = 1;
		 s0 = 0;
		 s11 = 0;
		 s22 = 0;
		 s33 = 0;
		 s44 = 0;
		 s55 = 0;
// input signal changing

  #10;
  #10 s11 = 1;s22 = 0; s33 = 0; s44 = 0;s55 = 0;
  #10 s11 = 1;s22 = 1; s33 = 0; s44 = 0;s55 = 0;
  #10 s11 = 1;s22 = 1; s33 = 1; s44 = 0;s55 = 0;
  #10 s11 = 1;s22 = 1; s33 = 1 ; s44 = 1;s55 = 0;
  #10 s11 = 1;s22 = 1; s33 = 1; s44 = 1;s55 = 1;
  $finish;
end // initial
always
  #5 clk = ~clk;
always @( posedge clk )
  begin
   $display ( "%4d %4b %4b %4b %4b %4b", $time,s11,s22,s33,s44,s55 );
  end 
endmodule //