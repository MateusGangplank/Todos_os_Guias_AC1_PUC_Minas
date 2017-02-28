//Matheus Felipe Silva Evangelista
//Matrícula : 417550

module m4(s,a,b,c,d);
output s;
input a,b,c,d;
wire t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11;

and AND1 (t0, ~a, ~b);
and AND2 (t1, b, d);
and AND3 (t2, ~c, ~d);
and AND4 (t3, a, c);

xor XOR1 (t8, c, d);
xor XOR2 (t9, a, c);
xor XOR3 (t10, a, b);
xor XOR4 (t11, b, d);
and AND5 (t4, t0, t8);
and AND6 (t5, t1, t9);
and AND7 (t6, t2, t10);
and AND8 (t7, t8, t11);
or OR1 (s, t4, t5, t6, t7);


endmodule

//teste

module teste;
reg a,b,c,d;
integer x,y,w,z;
wire s;

//instancia

m4 m(s,a,b,c,d);

//main

initial begin
	$display("Prova 1f - Matheus Felipe Silva Evangelista");
	$display("a b c d s");
	$monitor("%b %b %b %b %b",a,b,c,d,s);
	
	for(x=0;x<2;x=x+1)
	begin
	a=x;
		for(y=0;y<2;y=y+1)
		begin
		b=y;
			for(w=0;w<2;w=w+1)
				begin
				c=w;
					for(z=0;z<2;z=z+1)
						begin
						#1 d=z;
						end
				end
			end
		end
	end


endmodule
