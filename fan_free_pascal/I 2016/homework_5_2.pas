{Work student group 916, Mambetov Vladyslav}

program homework_5;
uses crt;

var
  x, y, z:real;

begin
  clrscr;
  Write('Enter the x = ');
  Read(x);
  Write('Enter the z = ');
  Read(z);
  y := ln(abs(1 - 2*x*x + 3*exp((x)*3)/ln(10) - 4*exp((x)*4))) + sqrt(abs(x))/z;
  writeln('y = ',y:5:2);

  ReadKey;
end.
