// Exemplo0002- NOT
// Nome : Julio Mirnada Machado
// Matricula: 435666


// not gate

module notgate (output s, 
						input p); 
	assign s = ~p ; // saida igual a entrada negada 
endmodule // notegate

// Test not Gate 

module testnotgate;
reg a ;
wire s;

notgate NOT1(s,a);
	
	initial begin:start
		a=0;
end
	initial begin
		$display("Exemplo0002 Julio Machado - 435666");
		$display("Test NOT gate");
		$display("\n~a=s\n");
		a=0;
	#1 $display("~%b=%b",a,s);
		a=1;
	#1 $display("~%b=%b",a,s);
	end
endmodule // testnotgate