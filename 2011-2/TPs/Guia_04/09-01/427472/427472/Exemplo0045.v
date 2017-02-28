// -------------------------
// Exemplo0045
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

//----------------------
//--nand gate
//----------------------

module fulladd (output cout,
					 output s,
					 input cin,
					 input x,
					 input y);
	wire sxor1;
	wire sand1;
	wire sand2;
	
  xor XOR1 (sxor1,x,y);
  and AND1 (sand1,x,y);
  and AND2 (sand2,sxor1,cin);
  xor XOR2 (s,cin,sxor1);
  or OR1 (cout,sand2,sand1);

endmodule // fulladd

//----------------------
//--Circuito
//----------------------
module circ;
//----------------------dados locais
  reg [5:0]a;
  reg c1;
  reg c2;   //definir registrador

  wire s0,s1,s2,s3,s4,s5,sout;    // definir conexao(fio)
  wire out1;
  wire out2;
  wire out3;
  wire out4;
  wire out5;
  wire [5:0]na;

//---------------------- instancia
  not NOT1[5:0] (na,a);
  fulladd F1(out1,s0,c2,na[0],c1);
  fulladd F2(out2,s1,out1,na[1],c1);
  fulladd F3(out3,s2,out2,na[2],c1);
  fulladd F4(out4,s3,out3,na[3],c1);
  fulladd F5(out5,s4,out4,na[4],c1);
  fulladd F6(sout,s5,out5,na[5],c1);

//---------------------- preparacao
 initial begin:start
 
 c1 = 0; 			c2 = 1; 			a =6'b100111;
  
   end
//---------------------- parte principal
 initial begin
   $display("Exemplo0045 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\n *** Resultado ***  ");
	$monitor(" X=%b	\n	 C2=%b%b%b%b%b%b%b",a,sout,s5,s4,s3,s2,s1,s0);
#1 a=6'b100100;
#1 a=6'b101010;
#1 a=6'b000000;
	
		
		end

endmodule //circ
