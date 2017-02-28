//-------------------------
// Exercicio 05
// Luiz Marques de oliveira
//-------------------------


//--------------------------
//-- OR GATE COM 3 ENTRADAS
//--------------------------


module or3(output s, input a, input b, input c);

endmodule

//-------------------------
//-- test
//-------------------------

module testor3;
wire s;
reg a,b,c;


not NOT1(s1,a);
not NOT2(s2,b);
not NOT3(s3,c);
and AND1(s,s1,s2,s3);

initial begin:start
a=0 ; b=0; c=0;
end



initial begin: main

$display("Exericicio 05 - Luiz Marques de olveira - 417138");
$display("Porta OR com 3 entradas");
$display("a & b & c = s");
$monitor("%b & %b & %b = %b",a,b,c,s);


#1 a=0 ; b=0 ; c=1;
#1 a=0 ; b=1 ; c=0;
#1 a=0 ; b=1 ; c=1;
#1 a=1 ; b=0 ; c=0;
#1 a=1 ; b=0 ; c=1;
#1 a=1 ; b=1 ; c=0;
#1 a=1 ; b=1 ; c=1;

end
	
	endmodule // testor3
