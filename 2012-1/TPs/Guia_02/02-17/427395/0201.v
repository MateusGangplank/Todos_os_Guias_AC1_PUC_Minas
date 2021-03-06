//ARQ1 - Eduardo Botelho de Andrade - Guia02

module operations;

 reg [4:0] a;
 reg [4:0] b;
 reg [3:0] c;
 reg [3:0] d;
 reg [3:0] e;

 initial
  begin
   a = 2 + 15;
   b = 3*8;
   c = 32/3;
   d = 21 + (~11);
   e = 2*5 + 6 + (~1);
  end
  
  initial
   begin
    $display("Opera��es entre decimal e bin�rio");
    $display("a = 2 + 15");
    $display("a = %d = %5b",a,a);
    $display("");
    $display("b = 3*8");
    $display("b = %d = %5b",b,b);
    $display("");
    $display("c = 32/3");
    $display("c = %d = %5b",c,c);
    $display("");
    $display("d = 21 - 11");
    $display("d = %d = %5b",d,d);
    $display("");
    $display("e = 2*5 + 6 - 1");
    $display("e = %d = %5b",e,e);
    $display("");
   end

endmodule