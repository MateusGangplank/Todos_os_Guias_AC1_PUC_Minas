// -------------------------
// Exemplo0035 / Somados/Subtrator
// Nome: Pedro Ballona
// Matricula: 427455 
// ------------------------- 
 

// ------------------------- 
//  meia Soma 
// ------------------------- 
module meiaSoma (output s0,	 output s1,  
                               input a,  
                               input b); 
 
// descrever por portas
//and(s1,a,b);
//xor(s0,a,b);

// EXPERIMENTAR
and AND1(s1,a,b);
xor XOR1(s0,a,b);


 
endmodule // fullAdder


// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output s0,	 output s1,  
                               input a,  
                               input b,  
                               input carryIn); 
 
// descrever por portas
wire meiaSoma1[0:1];
wire meiaSoma2[0:1];

meiaSoma porta1(meiaSoma1[1],meiaSoma1[0],a,b);
meiaSoma porta2(meiaSoma2[1],meiaSoma2[0],meiaSoma1[1],carryIn);

assign s0 = meiaSoma2[1];
//or(s1,meiaSoma1[0],meiaSoma2[0]);
// EXPERIMENTAR
or OR1(s1,meiaSoma1[0],meiaSoma2[0]);

endmodule // fullAdder

// ------------------------- 
//  FAFS 
// ------------------------- 
module FAFS (output s0,	 output s1,  
                               input a,  
                               input b,  
                               input carryIn,
										 input sel); 
 
// descrever por portas
wire xor1;
xor(xor1,b,sel);
fullAdder FA(s0,s1,a,xor1,carryIn);


 
endmodule // FAFS


// ------------------------- 
//  FAFS6b
// -------------------------
module somador6b (output[5:0] c,
										 input[5:0] a,
										 input[5:0] b,
										 input sel);

 
		wire [5:0] x; 
      wire [5:0] y;      
      //wire [5:0] soma;
		wire carry;
		wire carry2;
		wire carry3;
		wire carry4;
		wire carry5;
		wire carry6;			
		FAFS soma0(c[0],carry,a[0],b[0],sel,sel);
		FAFS soma1(c[1],carry2,a[1],b[1],carry,sel);
		FAFS soma2(c[2],carry3,a[2],b[2],carry2,sel);
		FAFS soma3(c[3],carry4,a[3],b[3],carry3,sel);
		FAFS soma4(c[4],carry5,a[4],b[4],carry4,sel);
		FAFS soma5(c[5],carry6,a[5],b[5],carry5,sel);	
		

										 
endmodule//somador6b
// ------------------------- 
//  and6
// ------------------------- 
module and6 (output s,	input[5:0] a);


assign s = a[0] & a[1] & a[2] & a[3] & a[4] & a[5];

endmodule

// ------------------------- 
//  or6
// ------------------------- 
module or6 (output s,	input[5:0] a);


assign s = a[0] | a[1] | a[2] | a[3] | a[4] | a[5];

endmodule


// ------------------------- 
//  igual
// ------------------------- 
module igual (output s,	       input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas

wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

xnor(w0,a[0],b[0]);
xnor(w1,a[1],b[1]);
xnor(w2,a[2],b[2]);
xnor(w3,a[3],b[3]);
xnor(w4,a[4],b[4]);
xnor(w5,a[5],b[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

and6 a6 (s,w);




endmodule

// ------------------------- 
//  maior
// ------------------------- 
module maior (output s,	       input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas

wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

and(w0,a[0],~b[0]);
and(w1,a[1],~b[1]);
and(w2,a[2],~b[2]);
and(w3,a[3],~b[3]);
and(w4,a[4],~b[4]);
and(w5,a[5],~b[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or6 a6 (s,w);




endmodule


// ------------------------- 
//  maiorV2
// ------------------------- 
module maiorv2 (output s,	       input[5:0] a,  
                               	input[5:0] b); 
 
// descrever por portas

wire[5:0] sub;
wire and1;
wire H;
wire xor1;

igual igual(H,a,b);
somador6b subtrator(sub,a,b,1);
and(and1,sub[5],1);
xor(s,~and1,H);



endmodule

// ------------------------- 
//  menorV2
// ------------------------- 
module menorv2 (output s,	       input[5:0] a,  
                               	input[5:0] b); 
 
// descrever por portas

wire[5:0] sub;
wire and1;

somador6b subtrator(sub,a,b,1);
and(and1,sub[5],1);
assign s = and1;



endmodule



// ------------------------- 
//  menor
// ------------------------- 
module menor (output s,	       input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas

wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire[5:0] w;

and(w0,~a[0],b[0]);
and(w1,~a[1],b[1]);
and(w2,~a[2],b[2]);
and(w3,~a[3],b[3]);
and(w4,~a[4],b[4]);
and(w5,~a[5],b[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or6 a6 (s,w);




endmodule


// ------------------------- 
//  multiplexador
// ------------------------- 
module multi (output s,	 input[1:0] sel,  
                               input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas



wire i0;
wire m0;
wire me0;

wire and1;
wire and2;
wire and3;

wire or1;


igual I(i0,a,b);
maiorv2 M(m0,a,b);
menorv2 ME(me0,a,b);

and(and1,i0,~sel[0],~sel[1]);
and(and2,m0,sel[0],~sel[1]);
and(and3,me0,~sel[0],sel[1]);

or(or1,and1,and2);
or(s,or1,and3);


 
endmodule // fullAdder







module test_FAFS; 
// ------------------------- definir dados 
      reg[5:0] x;
		reg[5:0] w;
		reg[1:0] sel;
		
		wire c;
		
		
		multi IG(c,sel,x,w);
		
						
		
		
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0034 - Pedro Ballona - 427455"); 
      $display("Test ALU’s igualdade(00),maioridade(01),menoridade(10)");
		x=6'b100011; w=6'b100011; sel = 2'b00;	
		#1 $display("(%b == %b) %b",x,w,c);
		
		x=6'b111111; w=6'b111110;	sel = 2'b01;
		#2 $display("(%b > %b) %b",x,w,c);
		
		x=6'b111111; w=6'b111110;	sel = 2'b10;
		#3 $display("(%b < %b) %b",x,w,c);
		
		x=6'b111111; w=6'b000001;	sel = 2'b10;
		#4 $display("(%b < %b) %b",x,w,c);

		
		
		
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_c2 

// OBS.: EXPERIMENTAR DEFINICOES POR PORTAS.