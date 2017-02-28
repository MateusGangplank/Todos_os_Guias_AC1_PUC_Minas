// -------------------------
// Extra1- comnplemeno de 2
// Nome: guilherme alves de oliviera
// Matricula: 450161
// -------------------------

module complemento2(output [7:0]s,input [7:0]p);

assign s = ~p;

endmodule//complemento2

module testecomplemento2;
reg [7:0]a;
wire [7:0]b;

complemento2 COM2(b,a);


// ------------------------- parte principal
initial begin:main
  $display("extra 1 -guilherme alves de oliveira - 450161");
  $display("Test complemento de 1:");
  
  #1
   a = 9;
	$monitor("a = %7b b = %7b",a,b);
end

endmodule//endtestecomplemento2