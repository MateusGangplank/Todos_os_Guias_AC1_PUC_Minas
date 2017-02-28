//------
//Exemplo0021
//Andre Campolina
//381217
//-------

//------
//Full Adder
//------

module halfAdder(output s, output cout, input a, input b, input cin);

	wire w1;
	xor XOR1(w1,a,b);
	xor XOR2(s,w1,cin);
	wire w3;
	and AND1(w3,a,b);
	wire w4;
	and AND2(w4,w1,cin);
	or OR1(cout,w3,w4);
	
endmodule


module fullAdder(output[2:0] s,output carryOut, input[2:0]a, input[2:0]b, input carryIn);
	wire w1;
	halfAdder h0(s[0],w1,a[0],b[0],carryIn);
	wire w2;
	halfAdder h1(s[1],w2,a[1],b[1],w1);
	halfAdder h2(s[2],carryOut,a[2],b[2],w2);
endmodule

module test_fullAdder;
reg[2:0] x;
reg[2:0] y;
reg carry;
wire[2:0] soma;
wire cout;

fullAdder f1(soma, cout, x, y, carry);

initial begin
#1 $display("exemplo0021 - Andre Campolina - 381217" );
#1 $display("Full Adder");

x=3'b010;
y=3'b011;
carry = 0;



#4 $display("%3b %3b %b = %3b %b", x, y, carry, soma, cout);

end

endmodule