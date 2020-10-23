program homework_2;
var
  a :real; //a - any number
begin
  write('Enter the number: ');
  read(a);
  If a < 0 then
    begin
    a := abs(a);
    a := sqrt(a);
    end
    else
      a := sqr(a);
    write('Result: ',a);
  read(a);
end.
