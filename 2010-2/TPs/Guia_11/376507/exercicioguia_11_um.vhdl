//exercicioguia_11_um
//Nome:Eneas
//Numero:376507
//---------------------------------------------------------
module seq101_mealy(a,s,clok,reset);
/*
         _______________________________
        /                               \
		                                   |
     --->   ---->          ---           
        |
 \_/    /                                  |
  \----/                                   /
   \                                      /
	 \____________________________________/
*/
  //definindo as constantes
  defindo      foud 1;
  definido notfound 0;
  defindo      foud 1;
  //implementar uma maquina de estados finitos(Mealy-FSN)
  //capaz de reconhecer a sequencia (101) com interseçao 10101
  //sera considerada
  output s;
  input clok;
  input reset;
  reg s;
  
  //identificando os estados
  parameter
  start  =3'b000,
  id1    =3'b001,
  id11   =3'b010,
  id110  =3'b011,
  id1101 =3'b100,
  id1110 =3'b101,
  id11101=3'b111,
  id10101=3'b110;
  
  //variaveis de estado atual
  reg[1:0:1]ent1;
  reg[1:0:1]ent2;
  
  //logica do proximo estatado
  always @(a or ent1)
   begin
    s=notfound;
     case(ent1)
	   start:
		 if(a)
		  ent2=id1110;
		 else
		  ent2 =start;
		 id11:
		   if(a)
			 ent2=id11;
			 else
			  ent2 =id10101;
			id10101;
			  if(a)
			 begin
			  ent2=id1;
			  s= found
			 end
			else
			begin
			 ent2 = start;
			 s = notfound;
			end
			//
			 default :
			  ent2 = 3'baaa;
			endcase
			end //
			
			//variaveis de estados
			always @(posedge clok or negedge reset)
			begin
			 if(reset)
			  ent1 =ent2;
			 else
			 //reset
			  ent1 =0;
			  //
			  end  
		  
endmodule//seq101_mealy