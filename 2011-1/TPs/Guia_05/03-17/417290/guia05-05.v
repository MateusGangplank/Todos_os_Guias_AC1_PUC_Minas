// -------------------------------------
// Guia 05_05 - Diferenca Completa 3 bits nor
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// -------------------------------------

// -------------------------------
// -- Diferenca Completa 3 bits
// -------------------------------

//--------- xor de nor

module xorgate (x0, p, q);

output x0;
input p, q;
wire t[0:3];

nor NOR1 (t[0], p);
nor NOR2 (t[1], q);
nor NOR3 (t[2], p, q);
nor NOR4 (t[3], t[0], t[1]);
nor NOR5 (x0, t[3], t[2]); // esta saida corresponde ao d

endmodule // xorgate

//------------ not de nor

module notgate (x1, a);

output x1;
input a;

nor NOR1 (x1, a);

endmodule // notgate

//--------- and nor

module andgate (x2, b, c);

output x2;
input b, c;
wire e[0:2];

nor NOR1 (e[0], c);
notgate NOT1 (e[1], b);
nor NOR2 (e[2], e[1]);
nor NOR3 (x2, e[2], e[0]); // esta saida corresponde ao Vout

endmodule // andgate

//------- or de nor

module orgate (x3, b1, c1);

output x3;
input b1, c1;
wire f;

nor NOR1 (f, b1, c1);
nor NOR2 (x3, f);

endmodule // orgate


//---------- meia diferenca nor

module MD (d1, Vout1, f1, g1);

output d1, Vout1;
input f1, g1;

xorgate XOR1 (d1, f1, g1);
andgate AND1 (Vout1, f1, g1);


endmodule // MD

//------ diferenca completa nor

module DC (d1, Vem1out, Vem1in, x1, y1);

output d1, Vem1out; 
input x1, y1, Vem1in;
wire t1, t2, t3;

MD MD1 (t1, t2, x1, y1);
MD MD2 (d1, t3, t1, Vem1in);
orgate OR1 (Vem1out, t3, t2);

endmodule // DC

//----- diferenca completa 3 bits nor

module DC3B (diferenca, Vem1, a, b);

output [2:0]diferenca;
output Vem1;
input [2:0]a;
input [2:0]b;
wire v0, v1;

MD MD1(diferenca[0], v0, a[0], b[0]);
DC DC1 (diferenca[1], v1, v0, a[1], b[1]);
DC DC2(diferenca[2], Vem1, v1, a[2], b[2]);

endmodule // DC3B

// ---------------------------
// -- test Diferenca completa
// ---------------------------

module testDC3B;

reg [2:0]x;
reg [2:0] y;
wire [2:0]d;
wire Vem1;
integer j, k, linha;

// instancia
DC3B DC3B1 (d, Vem1, x, y);

// parte principal
 initial begin

x = 0;
y = 0;
j = 0;

end

 initial begin
      $display("\nguia05_05 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Diferenca Completa 3 bits com nor\n");
      $display("\n   a      b      Cout   Soma\n");
		
      $monitor("     %3b    %3b     %b     %3b" , x, y, d, Vem1);
		
		for (j = 0; j < 8; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 8; k = k + 1) begin
		
					#1 y = k; 
					
			   end
		
	   end
				
  end
 
endmodule // testDC3B 

/* Resultados obtidos
    
     ----jGRASP exec: vvp guia05-05.vvp
    
    
    guia05_05 - Ludmily Caldeira da Silva - 417290
    
    Test Diferenca Completa 3 bits com nor
    
    
       a      b      Cout   Soma
    
         000    000     000       0
         000    001     111       1
         000    010     110       1
         000    011     101       1
         000    100     100       1
         000    101     011       1
         000    110     010       1
         000    111     001       1
         001    111     010       1
         001    000     001       0
         001    001     000       0
         001    010     111       1
         001    011     110       1
         001    100     101       1
         001    101     100       1
         001    110     011       1
         001    111     010       1
         010    111     011       1
         010    000     010       0
         010    001     001       0
         010    010     000       0
         010    011     111       1
         010    100     110       1
         010    101     101       1
         010    110     100       1
         010    111     011       1
         011    111     100       1
         011    000     011       0
         011    001     010       0
         011    010     001       0
         011    011     000       0
         011    100     111       1
         011    101     110       1
         011    110     101       1
         011    111     100       1
         100    111     101       1
         100    000     100       0
         100    001     011       0
         100    010     010       0
         100    011     001       0
         100    100     000       0
         100    101     111       1
         100    110     110       1
         100    111     101       1
         101    111     110       1
         101    000     101       0
         101    001     100       0
         101    010     011       0
         101    011     010       0
         101    100     001       0
         101    101     000       0
         101    110     111       1
         101    111     110       1
         110    111     111       1
         110    000     110       0
         110    001     101       0
         110    010     100       0
         110    011     011       0
         110    100     010       0
         110    101     001       0
         110    110     000       0
         110    111     111       1
         111    111     000       0
         111    000     111       0
         111    001     110       0
         111    010     101       0
         111    011     100       0
         111    100     011       0
         111    101     010       0
         111    110     001       0
         111    111     000       0
    
     ----jGRASP: operation complete.
       
*/