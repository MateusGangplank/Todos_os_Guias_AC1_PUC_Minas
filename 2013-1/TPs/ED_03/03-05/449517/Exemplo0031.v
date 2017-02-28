// --- Exemplo0031 - F4 -----------------
// -- Ana Carolina Conceicao de Jesus ---
// -- Matricula 449517 ------------------

// --------------------------------------
// f4_gate
//---------------------------------------
module f4(output[3:0]s,input [3:0]a,input [3:0]b, input chave);

	wire[3:0]s0;
	wire[3:0]s1;
	wire chavenot;
	
	// mudar posicao da chave
	not(chavenot,chave);
	
	and AND1 (s0[0],a[0],b[0]);
	and AND2 (s0[1],a[1],b[1]);
	and AND3 (s0[2],a[2],b[2]);
	and AND4 (s0[3],a[3],b[3]);
	
	or OR1 (s1[0],a[0],b[0]);
	or OR2 (s1[1],a[1],b[1]);
	or OR3 (s1[2],a[2],b[2]);
	or OR4 (s1[3],a[3],b[3]);
	
	assign s = chave? s0:s1;
	
endmodule

module test_f4;
	
	reg[3:0]a;
	reg[3:0]b;
	wire[3:0]c;
	reg chave;
	
	f4 teste (c,a,b,chave);
	
// ---------------- principal

	initial begin : main
		$display("Exemplo0031 - Ana Carolina - 449517");
		$display("ULA teste");
		
		chave = 1;
		a = 4'b0000; b = 4'b1111;
		$display("\nchave = 1 (operacao and) chave = 0 (operacao or)");
		
 #1 $monitor("%3b %3b = %3b chave = %3b",a,b,c,chave);
 #1 chave = 0;
 #1 chave = 1; a = 4'b0001; b = 4'b1110;
 #1 chave = 0;
 #1 chave = 1; a = 4'b0010; b = 4'b1101;
 #1 chave = 0;
 #1 chave = 1; a = 4'b0011; b = 4'b1100;
 #1 chave = 0;
 #1 chave = 1; a = 4'b0100; b = 4'b1011;
 #1 chave = 0;
 #1 chave = 1; a = 4'b0101; b = 4'b1010;
 #1 chave = 0;
 #1 chave = 1; a = 4'b0110; b = 4'b1001;
 #1 chave = 0; 
 #1 chave = 1; a = 4'b0111; b = 4'b1000;
 #1 chave = 0;

  end

endmodule