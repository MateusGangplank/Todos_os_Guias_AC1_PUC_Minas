//ARQ1 - Eduardo Botelho de Andrade - Guia02

module operations;

 reg [5:0] r1; reg [4:0] a1;
 reg [4:0] r2; reg [3:0] a2;
 reg [4:0] r3; reg [3:0] a3;
 reg [5:0] r4; reg [4:0] a4;
 reg [5:0] r5; reg [5:0] a5; reg [4:0] b5;

  initial 
   begin
    r1 = 6'b100111;
    r2 = 5'b10011;
    r3 = 5'b10111;
    r4 = 6'b101011;
    r5 = 6'b100100;
   end
   
  initial
   begin
    a1 = ~r1 + 1;
    a2 = ~r2 + 1;
    a3 = ~r3 + 1;
    a4 = ~r4 + 1;
    b5 = 5'b11001 + ~r5;
    a5 = ~b5 + 1;
   end

  initial
   begin
    $display("Complementos de dois");
    $display("r1 = %b",r1);
    $display("C(r1) = %b",a1);
    $display("");

    $display("r2 = 23(8) = %b",r2);
    $display("C(r2) = %b",a2);
    $display("");

    $display("r3 = 23(10) = %b",r3);
    $display("C(r3) = %b",a3);
    $display("");

    $display("r4 = 2B(16) = %b",r4);
    $display("C(r4) = %b",a4);
    $display("");

    $display("r5 = (25-36)(10) = %b",r5);
    $display("C(r5) = %b",a5);
    $display("");
   end

endmodule