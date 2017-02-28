// ------------------------- 
// Exemplo0055 – Soma e Subtracao (Maior,Menor,Igual)
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
//  soma e subtracao (maior menor igual)
// ------------------------- 
module half_adder (output s0,	 
                 output s1,  
                 input x,  
                 input y); 


and AND1(s1,x,y);
xor XOR1(s0,x,y);

endmodule 

// ------------------------- 
module full_adder (output s0,	 
                   output s1,  
                   input x,  
                   input y,  
                   input c_in); 
 

wire half_adder1[0:1];
wire half_adder2[0:1];

half_adder porta1(half_adder1[1],half_adder1[0],x,y);
half_adder porta2(half_adder2[1],half_adder2[0],half_adder1[1],c_in);

assign s0 = half_adder2[1];
or(s1,half_adder1[0],half_adder2[0]);
 
endmodule 
//---------------------------------
module somachave (output s0,
                  output s1,
						input x,
						input y,
						input c_in,
						input selecionador);
						
wire XOR1;
xor XOR_g(XOR1,y,selecionador);
full_adder Sum(s0,s1,x,XOR1,c_in);	

endmodule
//---------------------------------
module somacompleta6(output[5:0] s0,
						   input[5:0] x,
						   input[5:0] y,
						   input chave);
						 
						 
      wire [5:0] w; 
      wire [5:0] z;      
      wire c1;
		wire c2;
		wire c3;
		wire c4;
		wire c5;
		wire c6;
					
		somachave soma1(s0[0],c1,x[0],y[0],chave,chave);
		somachave soma2(s0[1],c2,x[1],y[1],c1,chave);
		somachave soma3(s0[2],c3,x[2],y[2],c2,chave);
		somachave soma4(s0[3],c4,x[3],y[3],c3,chave);
		somachave soma5(s0[4],c5,x[4],y[4],c4,chave);
		somachave soma6(s0[5],c6,x[5],y[5],c5,chave);	
		
		endmodule	
// -------------------------------------------------------------	

module and_6bits (output s0,	
                  input[5:0] x);

assign s0 = x[0] & x[1] & x[2] & x[3] & x[4] & x[5];

endmodule

// ----------------------------------------------------------

module or_6bits (output s0,	
                 input[5:0] x);

assign s0 = x[0] | x[1] | x[2] | x[3] | x[4] | x[5];

endmodule


// -----------------------------------------------------------

module igual (output s0,	       
              input[5:0] x,  
              input[5:0] y); 
 
wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

xnor(w0,x[0],y[0]);
xnor(w1,x[1],y[1]);
xnor(w2,x[2],y[2]);
xnor(w3,x[3],y[3]);
xnor(w4,x[4],y[4]);
xnor(w5,x[5],y[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

and_6bits a6 (s0,w);

endmodule

//----------------------------------------------------------

module maior (output s0,	       
                input[5:0] x,  
                input[5:0] y); 
 
wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

and(w0,x[0],~y[0]);
and(w1,x[1],~y[1]);
and(w2,x[2],~y[2]);
and(w3,x[3],~y[3]);
and(w4,x[4],~y[4]);
and(w5,x[5],~y[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or_6bits o6 (s0,w);

endmodule

// ---------------------------------------------------------------

module menor (output s0,	       
             input[5:0] x,  
             input[5:0] y); 
				 
wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

and(w0,~x[0],y[0]);
and(w1,~x[1],y[1]);
and(w2,~x[2],y[2]);
and(w3,~x[3],y[3]);
and(w4,~x[4],y[4]);
and(w5,~x[5],y[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or_6bits o6 (s0,w);

endmodule

// ---------------------------------------------------------
module mux (output s0,	 
            input[1:0] chave,  
            input[5:0] x,  
            input[5:0] y); 
				
wire e0;
wire g0;
wire l0;

wire and1;
wire and2;
wire and3;

wire or1;

igual igual1(e0,x,y);
maior maior1(g0,x,y);
menor menor1(l0,x,y);

and(and1,e0,~chave[0],~chave[1]);
and(and2,g0,chave[0],~chave[1]);
and(and3,l0,~chave[0],chave[1]);

or(or1,and1,and2);
or(s0,or1,and3);


 
endmodule 

module test_selecionar; 
// ------------------------------------
      reg[5:0] x;
		reg[5:0] w;
		reg[1:0] chave;
		
		wire c;

		mux m1(c,chave,x,w);		

// ------------------------- ---------------------------------------
 initial begin 
      
		$display("Exemplo0054"); 
      $display("Mateus Augusto Moraes Ferreira");
		$display("Maior Menor Igual");
		
		x=6'b100011; w=6'b101011; chave = 2'b00;	
		#1 $display("Igual:(%b = %b) %b",x,w,c);
		
		x=6'b101011; w=6'b111110;	chave = 2'b01;
		#2 $display("Maior:(%b > %b) %b",x,w,c);
		
		x=6'b101111; w=6'b110110;	chave = 2'b10;
		#3 $display("Menor:(%b < %b) %b",x,w,c);

 end 
 
endmodule 										  			 						 