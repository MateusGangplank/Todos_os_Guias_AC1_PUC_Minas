// -------------------------
// Exemplo0031 - F4
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------


// -------------------------
// f4_gate
// -------------------------

module f4 (output [3:0] s, output [3:0] p,
            input  [3:0] a,
            input  [3:0] b);
  assign s = a & b;
  assign p = a | b;
endmodule


module test_f4;

// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;

f4 modulo (z,w,  x,y);

// ------------------------- parte principal
initial begin
  $display("Exemplo0031 - Davidson Francis - 466499");
  $display("Test LU's module");
  
  x = 4'b0011;
  y = 4'b0101;

  #1 $display("%3b & %3b = %3b",x,y,z);
  #1 $display("%3b | %3b = %3b",x,y,w);
end
endmodule