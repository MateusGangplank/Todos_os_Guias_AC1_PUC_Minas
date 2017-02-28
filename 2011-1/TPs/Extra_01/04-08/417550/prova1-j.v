//Matheus Felipe Silva Evangelista
//Matrícula : 417550

module m4(s,a,b,c,d);
output s;
input a,b,c,d;
and AND1 (s, a, b, c, d);


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
	$display("Prova 1j - Matheus Felipe Silva Evangelista");
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
