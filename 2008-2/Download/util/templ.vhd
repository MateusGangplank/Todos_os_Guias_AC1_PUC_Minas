!VHDL

#entity
<_
entity ENTITY_NAME is
end;
_>

#architecture
<_
architecture ARCHITECTURE_NAME of ENTITY_NAME is
begin
end;
_>

#configuration
<_
configuration CONFIGURATION_NAME of ENTITY_NAME is
   for NAME

   end for;
end;
_>

#process
<_
process
begin
   null;
end process;
_>


#package spec
<_
package PACKAGE_NAME is

end PACKAGE_NAME;
_>

#package body
<_
package body PACKAGE_NAME is

end PACKAGE_NAME;
_>

#procedure spec
<_
procedure PROCEDURE_NAME (PARAM1 : TYPE1;
                          PARAM2 : TYPE2);
_>

#procedure body
<_
procedure PROCEDURE_NAME (PARAM1 : TYPE1;
                          PARAM2 : TYPE2) is

begin
   null;
end PROCEDURE_NAME;
_>

#function spec
<_
function FUNCTION_NAME (PARAM1 : TYPE1;
                        PARAM2 : TYPE2) return VARIABLE_TYPE;
_>

#function body
<_
function FUNCTION_NAME (PARAM1 : TYPE1;
                        PARAM2 : TYPE2) return VARIABLE_TYPE is

begin
   null;
end FUNCTION_NAME;
_>

#case
<_
case CASE_EXPRESSION is
   when CHOICE =>
      null;
end case;
_>

#if / then
<_
if CONDITION then
   null;
end if;
_>

#if / else
<_
if CONDITION then
   null;
else
   null;
end if;
_>

#for loop
<_
for INDEX_VARIABLE in VALUE_RANGE loop
   null;
end loop;
_>

#loop with exit
<_
loop
   null;
   exit when CONDITION;
end loop;
_>

#while loop
<_
while CONDITION loop
   null;
end loop;
_>

