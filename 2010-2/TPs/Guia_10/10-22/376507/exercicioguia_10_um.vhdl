//exercicioguia_10_um
//Nome:Eneas
//Numero:376507
//----------------------------------------------------
  module norgate(s1,q,p);
  output s1;
  input q,p ;
  assign s1=(q|p);
  endmodule//norgate
  module primparte;
  reg q,p;
  wire s1;
  norgate nor1(s1,q,p);
  initial begin 
      $display("primparte");
      $display("norgate");
      $display ("\na |b=s1\n");
	   q=0;p=0;
	   $display("%b|%b=%b",q,p,s1);
	   q=0;p=1;
  #1  $display("%b|%b=%b",q,p,s1);
    q=1;p=0;
  #1  $display("%b|%b=%b",q,p,s1);
	 q=1;p=1;
  #1  $display("%b|%b=%b",q,p,s1);
	
  end
  endmodule//norgate
//------------------------------
   module norgate_2(s2,q,p);
  output s2;
  input q,p ;
  assign s2=~(q|p);
  endmodule//norgate_2
  
  module segparte;
  reg q,p;
  wire s2;
  norgate_2 nor2(s2,q,p);
  
  initial begin 
      $display("segparte");
      $display("norgate_2");
      $display ("\na |b=s2\n");
	   q=0;p=0;
	   $display("%b|%b=%b",q,p,s2);
	   q=0;p=1;
  #1  $display("%b|%b=%b",q,p,s2);
    q=1;p=0;
  #1  $display("%b|%b=%b",q,p,s2);
	 q=1;p=1;
  #1  $display("%b|%b=%b",q,p,s2);
	
  end
  endmodule//norgate_2