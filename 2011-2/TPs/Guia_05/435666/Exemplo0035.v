// ------------------------- 
// Exemplo0035 – FULL ADDER 
// Nome: Julio Miranda Machado
// Matricula: 435666 
// ------------------------- 
 
 // ------------------------- 
//  Maior que 
// ------------------------- 
module maiorQue ( output g, 
						output e,
                  input x,  
                  input y, 
						input gin, 
						input ein); 

wire xb,yb;

not not1 (xb,x);
not not2 (yb,y);
and and1 (sand1, yb, x, ein);
and and2 (sand2, yb, xb, ein);
and and3 (sand3, x, y, ein);
and and4 (sand4, ein, gin);
or or1 (g,sand1,gin);
or or2 (e,sand2,sand3,sand4);
 
endmodule //  maiorque 


module test_comparador; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
		wire [1:0] nots;
		wire s_and; 
		output [1:0] sinais;  
      wire [5:0] g; 
      wire [5:0] e;
		
		not not1(sinais[0], x[5]);
		not not2(sinais[1], y[5]);
			
		maiorQue mq1(g[0],e[0],x[0],y[0],0, 1);
		maiorQue mq2(g[1],e[1],x[1],y[1],g[0], e[0]);
		maiorQue mq3(g[2],e[2],x[2],y[2],g[1], e[1]);
		maiorQue mq4(g[3],e[3],x[3],y[3],g[2], e[2]);
		maiorQue mq5(g[4],e[4],x[4],y[4],g[3], e[3]);
		maiorQue mq6(g[5],e[5],sinais[0],sinais[1],g[4], e[4]);
		
		not not3(nots[0],g[5]);
		not not4(nots[1],e[5]);
		and and1(s_and,nots[0],nots[1]);
		


 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0035 - Julio Miranda Machado - 435666"); 
      $display("Test ALU’s full adder  and full subtractor Com Incremento de 1"); 
		#1 x = 6'b000001;  y = 6'b000001;
				
		#1 $display("%6b > %6b ? = %b",x,y,g[5]); 
		#1 $display("%6b < %6b ? = %b",x,y,e[5]); 
		#1 $display("%6b == %6b ? = %b",x,y,s_and); 
		
		#1 x = 6'b010011;  y = 6'b010101;
		
		#1 $display("%6b > %6b ? = %b",x,y,g[5]); 
		#1 $display("%6b < %6b ? = %b",x,y,e[5]); 
		#1 $display("%6b == %6b ? = %b",x,y,s_and);  
		
		#1 x = 6'b111111;  y = 6'b000000;
		
		#1 $display("%6b > %6b ? = %b",x,y,g[5]); 
		#1 $display("%6b < %6b ? = %b",x,y,e[5]); 
		#1 $display("%6b == %6b ? = %b",x,y,s_and); 


 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_fullAdder 

//Exemplo0035 - Julio Miranda Machados - 435666
    //Test ALU’s full adder  and full subtractor Com Incremento de 1
    //000001 > 000001 ? = 0
    //000001 < 000001 ? = 1
    //000001 == 000001 ? = 0
    //010011 > 010101 ? = 1
    //010011 < 010101 ? = 0
    //010011 == 010101 ? = 0
    //111111 > 000000 ? = 1
    //111111 < 000000 ? = 0
    //111111 == 000000 ? = 0