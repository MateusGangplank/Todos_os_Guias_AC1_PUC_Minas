// --------------
// Exercicio0006 (Extra) - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

// --------------
// -- C�lculo do complemento de 1
// --------------
module complement1 (output [7:0] s, input [7:0] q);
assign s = ~q;
endmodule

module testcomplement1;
// -------------- definir dados
    reg [7:0] a;
    wire [7:0] s;
// -------------- inst�ncia
complement1 C1 (s, a);

// -------------- parte inicial
initial begin

   $display("Exercicio0006 - Breno Macena - 462017");
	$display("Test number system\n");
   a=25;
#1	$display("a = %d(10) = %b(2) | C1(a) = %b", a, a, s);
   a=8'b10110100;
#1	$display("a = %b(2) | C1(a) = %b", a, s);
   a=5'o34;
#1	$display("a = %o(8) = %b(2) | C1(a) = %b", a, a, s);
   a=7'h7D;
#1	$display("a = %h(16) = %b(2) | C1(a) = %b", a, a, s);	

end
endmodule // test_base