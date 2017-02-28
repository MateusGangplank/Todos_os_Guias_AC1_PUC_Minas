// ------------------------- 
// Exemplo0025 - FULL ADDER 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module meiaSoma (output s,output s1, 
input a, 
input b); 
// descrever por portas

xor(s,a,b);
and(s1,a,b);

endmodule // fullAdder 
 
// ------------------------- definir dados 
module fullAdder(output s, output s1,
						  input a, input b,
						  input carryIn);
//descrever por portas

wire ha1[0:1]; 
wire ha2[0:1];

meiaSoma ms1(ha1[1],ha1[0],a,b);						  
meiaSoma	ms2(ha2[1],ha2[0],ha1[1],carryIn);

assign s = ha2[1];
or (s1,ha1[0],ha2[0]);	

endmodule // fullAdder			

module test_fullAdder;
//-------------------------------- definir dados

reg [5:0] x;
reg [5:0] y;
//reg carry;
wire [5:0] soma;
wire carry;
wire carry2;
wire carry3;
wire carry4;
wire carry5;
wire carry6;		  


		meiaSoma soma0(soma[0],carry,x[0],y[0]);
		fullAdder soma1(soma[1],carry2,x[1],y[1],carry);
		fullAdder soma2(soma[2],carry3,x[2],y[2],carry2);
		fullAdder soma3(soma[3],carry4,x[3],y[3],carry3);
		fullAdder soma4(soma[4],carry5,x[4],y[4],carry4);
		fullAdder soma5(soma[5],carry6,x[5],y[5],carry5);


endmodule // fulladder

//------
// somador
//------
module somador(output[5:0] s, input[5:0] a, 
										input[5:0]b);
										
wire [5:0] x;
wire [5:0] y;
wire carry;
wire carry2;
wire carry3;
wire carry4;
wire carry5;
wire carry6;

meiaSoma s0(s[0],carry,a[0],b[0]);
fullAdder s1(s[1],carry2,a[1],b[1],carry);										
fullAdder s2(s[2],carry3,a[2],b[2],carry2);
fullAdder s3(s[3],carry4,a[3],b[3],carry3);
fullAdder s4(s[4],carry5,a[4],b[4],carry4);
fullAdder s5(s[5],carry6,a[5],b[5],carry5);

endmodule // somador

//---------		
//complemento de 1
//---------
module c1(output[5:0] s , input[5:0] a);




not(s[0],a[0]);		
not(s[1],a[1]);
not(s[2],a[2]);
not(s[3],a[3]);
not(s[4],a[4]);
not(s[5],a[5]);

endmodule // complemento de 1 


//--------------
// complemento de 2
//-----------------
module c2(output[5:0] s1, input[5:0] a); 

wire[5:0] s;

c1 complento1(s,a);
somador somar(s1,s,000001);

endmodule // complemento de 2

module test_compelento2;
//-----------
reg [5:0] x;
wire [5:0] s;

c2 complemento2(s,x);


// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Rafael Lopes Barbosa - 435052"); 
$display("Test ALU's complemento de 2"); 
x = 6'b01101;
#1 $display("%b complemento de 2 = %b",x,s);

// projetar testes do somador complete 
end 
endmodule // test_fullAdder 