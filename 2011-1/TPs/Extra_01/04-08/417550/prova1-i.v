//Matheus Felipe Silva Evangelista
//Matrícula : 417550

module m4(s,a,b,c,d);
output s;
input a,b,c,d;
wire t0,t1,t2,t3,t4,t5,t6,t7,t8;

xor XOR1 (t0, a, c);
xor XOR2 (t1, b, c);
xor XOR3 (t2, a, b);
xor XOR4 (t3, b, d);
and AND1 (t5, d, t0);
and AND2 (t6, d, t1);
and AND3 (t7, c, t2);
and AND4 (t8, a, t3);
or OR1 (s, t5, t6, t7, t8);



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
	$display("Prova 1i - Matheus Felipe Silva Evangelista");
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
