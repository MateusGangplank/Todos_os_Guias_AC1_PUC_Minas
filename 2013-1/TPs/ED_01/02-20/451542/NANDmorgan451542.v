//------------------------
// NAND(Morgan)
// Bernardo MP Olimpio
//------------------------

module nandmorgangate(output s,
input p,
input q);
assign s = ~p|~q;

endmodule

module testnandmorgangate;

reg a, b;
wire s;

nandmorgangate NANDMORGAN1(s, a, b);

initial begin:start
a=0; b=0;
end

initial begin
$display("Bernardo MP Olimpio - 451542"); 
$display("Test NAND MORGAN gate"); 
 
a=0; b=0;
$monitor("~%b | %b = %b", a, b, s);
#1	a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule