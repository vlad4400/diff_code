{Work student group 916, Mambetov Vladyslav}

program homework_5;
uses crt;

const
  x = 5.55;

var
  y1, y2:real;

begin
  clrscr;

  y1 := ((x - 1) * (Exp(ln(x)*1.5) - 1)) / ((x + sqrt(x) + 1) * (sqrt(x) + 1)) + 2 * sqrt(x);
  y2 := x + 1;
  writeln('y1 = ',y1:5:2);
  writeln('y2 = ',y2:5:2);

  ReadKey;
end.
