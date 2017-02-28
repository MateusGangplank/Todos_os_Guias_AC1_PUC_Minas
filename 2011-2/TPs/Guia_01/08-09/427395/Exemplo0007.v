//Exemplo0007
//Autor: Eduardo Botelho
//Matricula: 427395

//NOR gate
       module norgate
       assign s = ~(p | q);
       end module

//Test Nor gate
       module testNorGate

       //----Dados locais----
       reg a,b;
       wire s;

       //----Instancia-------
       norgate NOR1(output s, input a, input b);

       //----Preparacao------
       initial begin:start
       a=0;
       b=0;
       end
       
       //----Principal-------
       initial begin:main
       $display("Exemplo0007");
       $display("Teste NOR Gate");
       $display("\n~(a | b) = s\n");
       $monitor("~(%b | %b) = %b", a, b, s);
       #1 a=0; b=1;
       #1 a=1; b=0;
       #1 a=1; b=1;
       end

       end module