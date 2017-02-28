//------
//Exemplo0022
//Andre Campolina
//381217
//-------

//------
//Full Subtractor
//------

module halfSubtractor(output s, output cout, input a, input b, input cin);

	wire w1;
	xor XOR1(w1,a,b);
	xor XOR2(s,w1,cin);
	wire w2;
	not NOT1(w2,a);
	wire w3;
	and AND1(w3,w2,b);
	wire w4;
	not NOT2(w4,w1);
	wire w5;
	and AND2(w5,w4,cin);
	or OR1(cout,w5,w3);
		
endmodule


module fullSubtractor(output[2:0] s,output carryOut, input[2:0]a, input[2:0]b, input carryIn);
	wire w1;
	halfSubtractor h0(s[0],w1,a[0],b[0],carryIn);
	wire w2;
	halfSubtractor h1(s[1],w2,a[1],b[1],w1);
	halfSubtractor h2(s[2],carryOut,a[2],b[2],w2);
endmodule

module test_fullSubtractor;
reg[2:0] x;
reg[2:0] y;
reg carry;
wire[2:0] soma;
wire cout;

fullSubtractor f1(soma, cout, x, y, carry);

initial begin
#1 $display("exemplo0021 - Andre Campolina - 381217" );
#1 $display("Full Subtractor");

x=3'b010;
y=3'b011;
carry = 0;



#4 $display("%3b %3b %b = %3b %b", x, y, carry, soma, cout);

end

endmodule