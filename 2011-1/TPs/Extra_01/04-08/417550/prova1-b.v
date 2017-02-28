//Matheus Felipe Silva Evangelista
//Matrícula : 417550

module m1(s,a,b,c,d);
output s;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t6,t7,t8;

and AND1(t1,~a,~b,~c,d);
and AND2(t2,~a,~b,c,~d);
and AND3(t3,~a,b,~c,~d);
and AND4(t4,~a,b,c,d);
and AND5(t5,a,~b,~c,~d);
and AND6(t6,a,~b,c,d);
and AND7(t7,a,b,~c,d);
and AND8(t8,a,b,c,~d);

or OR1(s,t1,t2,t3,t4,t5,t6,t7,t8);

endmodule 

//teste

module teste;
reg a,b,c,d;
integer x,y,w,z;
wire s;

//instancia

m1 m(s,a,b,c,d);

//main

initial begin
	$display("Prova 1b - Matheus Felipe Silva Evangelista");
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
