// ---------------------------------
// ------- Exercicio 12 - EXTRA -----
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- Extra -------------
// ---------------------------------

module um(output s,input [7:0] q);
 assign s = (q[0]|q[1]|q[2]|q[3]|q[4]|q[5]|q[6]|q[7]); 
endmodule

//----------------------------------
//---------- Test Um --------
//----------------------------------

module testum;
//------------------ dados locais
reg [7:0] a;

wire s;

//------------ instancia
um UM(s,a);

initial begin:start
	a =8'b0000_0000;
end

//------- parte principal
initial begin: main
	$display("Exercicio 12 - Ana Carolina - 449517");
	$display("Test Zero");
	$display("\np  =  s\n");
	
	$monitor("%b  =  %b", a, s); 
#1		a=8'b0000_0001;
#1		a=8'b0000_0010;
#1		a=8'b0000_0011;
#1		a=8'b0000_0100;
#1		a=8'b0000_0101;
#1		a=8'b0000_0110;
#1		a=8'b0000_0111;
#1		a=8'b0000_1000;
#1		a=8'b0000_1001;
#1		a=8'b0000_1010;
#1		a=8'b0000_1011;
#1		a=8'b0000_1100;
#1		a=8'b0000_1101;
#1		a=8'b0000_1110;
#1		a=8'b1111_1111;
 
end 

endmodule