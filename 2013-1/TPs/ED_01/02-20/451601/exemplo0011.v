// Nome: Matheus Filipe Sieiro Vargas
// Matricula: 451601
module xorgate (output s , input p , input q);
assign s = ~p&q + p&~q;
endmodule

module testexorgate;
reg a,b;
wire s;

xorgate nor1 (s,a,b);
initial begin 
a=0;
b=0;
end
initial begin
$display("blabla");
$monitor("%b | %b = %b",a,b,s);
#1 a=0;b=1;

#1 a=1;b=0;

#1 a=1;b=1;

end 

endmodule