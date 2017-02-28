// --------------
// Exercicio0007 (Extra) - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

// --------------
// -- Cálculo do complemento de 2
// --------------
module complement2 (output [7:0] s, input [7:0] q);
assign s = ~q + 1;
endmodule

module testcomplement1;
// -------------- definir dados
    reg [7:0] a;
    wire [7:0] s;
// -------------- instância
complement2 C1 (s, a);

// -------------- parte inicial
initial begin

   $display("Exercicio0007 - Breno Macena - 462017");
	$display("Test number system\n");
   a=25;
#1	$display("a = %d(10) = %b(2) | C2(a) = %b", a, a, s);
   a=8'b10110100;
#1	$display("a = %b(2) | C2(a) = %b", a, s);
   a=5'o34;
#1	$display("a = %o(8) = %b(2) | C2(a) = %b", a, a, s);
   a=7'h7D;
#1	$display("a = %h(16) = %b(2) | C2(a) = %b", a, a, s);	

end
endmodule // test_base