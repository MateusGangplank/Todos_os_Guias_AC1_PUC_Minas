// ------------------------- 
// Exemplo0033 - 
// Nome:Milton costa teles da silva
// Matricula: 002751
// -------------------------
// -------------------------
// ------------------------- 
// andor
// ------------------------- 
module andor (output s,input a, input b); 
	
// descrever por portas 
	and and1(s,a,b);
	and and2(s,a,b);

	or or1(s1,a,b);
	or or2(s1,a,b);	
endmodule // andor 

// ------------------------- 
// nandnor
// ------------------------- 
module nandnor (output  s,input  a, input  b); 
	
// descrever por portas 
	nand and1(s,a,b);
	nand and2(s,a,b);

	nor or1(s1,a,b);
	nor or2(s1,a,b);	
endmodule // nandnor 

// ------------------------- 
// selecionavel
// ------------------------- 

module selecionavel1 (output  s0,input  flag,input c, input  a, input  b); 
	//-- wires para saidas de AND/OR e NAND/NOR
	wire  s1;
	wire  s2;
	wire  s3;
	wire  s4;
	//-- wires para saidas de ANDs 
	wire  s5; // --- ANDA
	wire  s6; // --- ANDO
	wire  s7; // --- ANDNA
	wire  s8; // --- ANDNO
	//------------------------------------------------
	wire[1:0] temp; //-- variavel temporaria para saida indesejada
	
// descrever por portas 
	andor and1(s1,a,b);
	andor or1(s2,a,b);
	nandnor nand1(s3,a,b);
	nandnor nor1(s4,a,b);
//-- Seleçao	
   //-- temp salva valor do OR que é retornado pela porta andor pois nao vai ser utilizado  
	andor anda (s5,temp,c,s1,flag);
	andor ando (s6,temp,~c,s2,flag,);
	andor andna (s7,temp,c,s3,~flag);
	andor andno (s8,temp,~c,s4,~flag);
	//-- temp salva valor de AND que é retornado pela porta andor pois nao vai ser utilizado 
	andor OR1 (temp,s0,s5,s6,s7,s8);

endmodule // selecionavel




module testmodule; 
// ------------------------- definir dados 
	reg  x; 
	reg  y; 
	wire  s0;
	reg  f;  //--- flag	
	reg c;
	// -- chamada do modulo
	selecionavel1 selec1 (s0, c, f, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo003 - Milton costa teles da silva - 002751"); 
   $display("Test LU's module");
		x = 1; y = 1; c =0; f=0;
// projetar testes do modulo
  $display("a b ch  s");
	$monitor("%b %b  %b  %b %b",x,y,c,f,s0);
	#1 x=0; y=0; c=0; f=0;
	#1 x=0; y=1; c=0; f=0;
	#1 x=1; y=0; c=0; f=0;
	#1 x=1; y=1; c=0; f=0;
$display("a b ch  f  s");
   #1 x=0; y=0; c=1; f=0;
	#1 x=0; y=1; c=1; f=0;
	#1 x=1; y=0; c=1; f=0;
	#1 x=1; y=1; c=1;	f=0;
$display("a b ch  f  s");  
   #1 x=0; y=0; c=0; f=1;
	#1 x=0; y=1; c=0; f=1;
	#1 x=1; y=0; c=0; f=1;
	#1 x=1; y=1; c=0; f=1;
$display("a b ch  f  s");
   #1 x=0; y=0; c=1; f=1;
	#1 x=0; y=1; c=1; f=1;
	#1 x=1; y=0; c=1; f=1;
	#1 x=1; y=1; c=1;	f=1; 
end 
endmodule // testmodule