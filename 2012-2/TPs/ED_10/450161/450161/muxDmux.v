module dmux(output s,output s1,input c,input chave);
reg s,s1;
always @( chave)
begin

	if(chave)
	begin
	
		s <= 1;
		s1 <=0;
	end
	else
	if(~chave)
	begin
		s <= 0;
		s1 <=1;
	end
end



endmodule

module mux(output [3:0]s,input[3:0]i,input [3:0]i1,input chave);
reg [3:0]s;
always@(chave)
begin
if(chave)
begin
	s = i;
end
else
if(~chave)
begin

s = i1;
end

end
endmodule
module mux1(output [8:0]s,input[8:0]i,input [8:0]i1,input [8:0]i2,input [8:0]i3,input[1:0] chave);
reg [8:0]s;
always@(chave)
begin
if(chave == 0)
begin
	s = i;
end
else
if(chave == 1)
begin

s = i1;
end
else
if(chave == 2)
begin

s = i2;
end
else
if(chave == 3)
begin

s = i3;
end

end
endmodule

module dmux1(output s,output s1,output s2,output s3,input[1:0]chave);
reg s,s1,s2,s3;
always @(chave)
begin

if(chave == 0)
begin
	s <= 1;
	s1 <= 0;
	s2 <= 0 ;
	s3 <= 0;
end
else
if(chave ==1)
begin
	s <=0;
	s1 <= 1;
	s2 <= 0 ;
	s3 <= 0;
end
else
if(chave ==2)
begin
s <=0;
	s1 <= 0;
	s2 <= 1 ;
	s3 <= 0;
end
else
if(chave == 3)
begin
	s <= 0;
	s1 <= 0;
	s2 <= 0 ;
	s3 <= 1;
end
end
endmodule
module principal;
wire s,s1,s2,s3;



reg [1:0]ch;
//dmux1 mem(s,s1,s2,s3,ch);

initial begin
ch = 0;


$display("Exercicio0100 - RAM 1x4 memory - Mateus Guilherme do Carmo Cruz - 427446");
$display("s \ti \ti1 \tch   - OUT");


$monitor("%b %b %b %b %b",s,s1,s2,s3,ch);
#1 ch = 0;
#1 ch = 1;
#1 ch = 2;

#1 ch = 3;



#5 $finish;
end
endmodule
