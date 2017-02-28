// ---------------------
//Marley Diniz
//371706
//guia02_03
// ---------------------



// -- nand gate 


module nandgate (s, p);
 output s;
 input  p;

 assign s = ~(p & p);

endmodule // nandgate



// -- not gate with nand


module notgate (s0, p);
 output s0;
 input  p;
 
 nandgate NAND1(s0,p);

 
endmodule // notgate



// -- test not gate with nand


module testnotgate;
 reg   a;             
 wire  s;

 notgate NOT1 (s, a);

 initial begin:start
      a=0; 
 end

 //--principal
 initial begin:main
      $display("Marley Diniz 371706");
      $display("\nTest NOT gate");
      $display("\n~a = s\n");
      $monitor("~%b = %b", a, s);
  #1  a=1; 
  
 end

endmodule // testnotgate
