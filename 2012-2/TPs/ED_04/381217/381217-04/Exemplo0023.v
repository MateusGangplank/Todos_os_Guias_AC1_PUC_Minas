//------
//Exemplo0023
//Andre Campolina
//381237
//-------

//------
//comparador
//------

module halfComparador(output s, input a, input b);

	xnor XNOR1(s,a,b);
		
endmodule


module fullComparador(output s, input[2:0]a, input[2:0]b);
	wire w1;
	halfComparador h0(w1,a[0],b[0]);
	wire w2;
	halfComparador h1(w2,a[1],b[1]);
	wire w3;
	halfComparador h2(w3,a[2],b[2]);
	wire w4;
	and AND1(w4,w1,w2);
	and AND2(s,w4,w3);
	
endmodule

module test_fullComparador;
reg[2:0] x;
reg[2:0] y;
wire comp;

fullComparador f1(comp, x, y);

initial begin
#1 $display("exemplo0023 - Andre Campolina - 381217" );
#1 $display("Full Comparador");

x=3'b010;
y=3'b011;


#4 $display("%3b %3b %b", x, y, comp);
x=3'b011;
y=3'b011;


#4 $display("%3b %3b %b", x, y, comp);


end

endmodule