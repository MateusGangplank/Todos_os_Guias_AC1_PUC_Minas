//------------------------------------
//--- Andre Campolina
//--- 381217
//------------------------------------

//------Modulo Flip Flop JK

module jk(output q, output qn, input j, input k, input clock, input set, input clear);
reg q, qn;
always @ (posedge clock)
begin
	if(~clear)
	begin
		if(~set)
		begin		
			if(~j && ~k)
			begin
			q <= q;
			qn <= qn;
			end
			if(~j && k)
			begin
			q <= 0;
			qn <= ~q;
			end
			if(j && ~k)
			begin
			q <= 1;
			qn <= ~q;
			end
			if(j && k)
			begin
			q <= ~q;
			qn <= q;
			end
		end
	end
end

endmodule // jk

module Ex01;
reg[5:0] cont;
reg pulse;
reg clear;
reg i;

wire w1, w2, w3, w4, w5, w6;
wire p1, p2, p3, p4, p5, p6;

and a1(p1,~w1,w2);
and a2(p2,~w3,w4);
and a3(p3,~w5,~w6);
and a4(p4,p1,p2);
and a5(p5,p4,p3);
or o1(p6,clear,p5);

jk ff1(w1,cont[0],i,i,pulse,0,p6);
jk ff2(w2,cont[1],i,i,w1,0,p6);
jk ff3(w3,cont[2],i,i,w2,0,p6);
jk ff4(w4,cont[3],i,i,w3,0,p6);
jk ff5(w5,cont[4],i,i,w4,0,p6);
jk ff6(w6,cont[5],i,i,w5,0,p6);


always
#5 pulse = ~pulse;begin

initial begin
$display("Andre Campolina - 381217");
pulse = 0;
clear = 1;
i = 1;
#15 clear = 0;

end




endmodule