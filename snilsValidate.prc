declare
snils nvarchar2(14) := '&value';
partsArray apex_application_global.vc_arr2;
ControlArray apex_application_global.vc_arr2;
CountArray apex_application_global.vc_arr2;
controlString nvarchar2(9);
bufer number;
control number;
secondControl number;
place number;
error boolean;
begin
dbms_output.put_line('����� �����:');
dbms_output.put_line(snils);
dbms_output.put_line('���������� ����� �����');
secondControl := 0;
partsArray := apex_util.string_to_table(snils, '-');
 for i in 1..partsArray.count-1
  loop
   dbms_output.put_line(partsArray(i));
  end loop;
  ControlArray := apex_util.string_to_table(partsArray(3), ' ');
  dbms_output.put_line(ControlArray(1));
  control := ControlArray(2);   
  dbms_output.put_line('�������� ������������ ������: ');
  if 1 >= TO_NUMBER(partsArray(1)) then
        error := true; 
        if 1 >= TO_NUMBER(partsArray(2)) then
            error := true;
            if 998 >= TO_NUMBER(ControlArray(1)) then
            error := true;
            else error := false;
            end if;
        else error := false;
        end if;
  else error := false;
  end if; 
  IF error = true then
  dbms_output.put_line('������������ ����� �����');
  else
  dbms_output.put_line('����������� �����: ');
  dbms_output.put_line(ControlArray(2));
  dbms_output.put_line('�������� � 1 �����');
  for p in 1..partsArray.count-1
  loop
  controlString := CONCAT(controlString,partsArray(p));
  end loop;
  controlString := concat (controlString,ControlArray(1));
  dbms_output.put_line(controlString);
  dbms_output.put_line('����� �����');
  place := 9;
  for c in 1..9
  loop
    secondControl := secondControl + TO_NUMBER(SUBSTR(controlString,c,1)) * place;
    place := place-1;
    end loop;
    dbms_output.put_line('����������� �����');
    dbms_output.put_line(control);
    dbms_output.put_line(secondControl);    
    if mod(secondControl,101) != control then
        dbms_output.put_line('Non Validate');
        return false;
    else dbms_output.put_line('Validate');
    return true;
    end if;
    end if;
end;