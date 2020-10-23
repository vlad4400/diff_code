var 
  i, a, b, m :integer;

begin
  {
  a := 98;
  b := 20;
  m := 39;
  }
  write('a = ');
  read(a);
  write('b = ');
  read(b);
  write('m = ');
  read(m);
  
  a := a mod m;
  b := b mod m;
  
  if (b < 0) then
    b := m + b;
  
  for i := 1 to m do
  begin
    if (((a * i) mod m) = b) then
      writeln('x = ', i);
  end;
end.