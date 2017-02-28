// -------------------------
// Ex0006
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module gate (output s0, output s1, output s2, output s3, output s4, output s5, output s6, output s7,
                         input  [7:0] p);
assign s0 =  ~p[7];
assign s1 =  ~p[6];
assign s2 =  ~p[5];
assign s3 =  ~p[4];
assign s4 =  ~p[3];
assign s5 =  ~p[2];
assign s6 =  ~p[1];
assign s7 =  ~p[0];
endmodule // gate

module test_base_01;
      reg [7:0] a;
		wire s0;
		wire s1;
		wire s2;
		wire s3;
		wire s4;
		wire s5;
		wire s6;
		wire s7;
		gate XOR1 (s0,s1,s2,s3,s4,s5,s6,s7, a);
		
		initial begin:start
		a=8'b11111111;   // 4 valores binarios
		
		
   	end
		
		initial begin:main
		
		         $monitor("%b = %b%b%b%b%b%b%b%b", a, s0,s1,s2,s3,s4,s5,s6,s7);
		  #1     a=8'b00000100; // valores binarios
		end
endmodule 	