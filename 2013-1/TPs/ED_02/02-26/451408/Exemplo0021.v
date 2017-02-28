// Exemplo0021 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module notg1 (output [7:0] s ,input [7:0] p);

assign s = ~(p);

endmodule

module testnotg1; 
	reg [7:0] a;
	wire[7:0] s;

	notg1 NOT1 (s, a);
	
initial begin:start 
	
	a= 8'b1001_1010;
	
end

initial begin
	$display("Exercicio06 - Lucas Porto Lopes - 451408");
	$display("Test number system");
	
	#1
	$display("%b = %7b", a, s);
	
end
endmodule