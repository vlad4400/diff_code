program homework_4;

  var
    x: real;
    
  begin
    write('Enter the x: ');
    read(x);
    while (x <= 0) or (x >= 10) do
    begin
      writeln;
      writeln('Error. You have entered the wrong number. The condition is not satisfied (0 < x < 10).');
      write('Enter again x:');
      read(x);
    end;
    if x < 1 then  x := sin(x - 1) / cos(x - 1);
    if (x >= 1) and (x <= 2.7183) then x := exp(ln(x * x + 2) / 3);
    if x > 2.7183 then x := ln(power(e,x) + 2) / ln(2);// x := ln(exp(x) +2) / ln(2);
    write('y = ',x);
    read(x);
  end.