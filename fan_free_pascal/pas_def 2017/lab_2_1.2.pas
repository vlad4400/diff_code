var
  n, i, k, s :integer;
begin
  s := 0;
  k := 0;
  n := 3364;
  
  while (n mod 2 = 0) do
  begin
    writeln(n);
    n := n div 2;
  end;
  
  i := 3;
  
  while (i <= n) do
  begin
  
    if (n mod i = 0) then
    begin
      writeln(i);
      s := s + i;
      k := k + 1;
      n := n div i;
    end else
      i := i + 2;
  end;
  
  writeln('s = ',s);
  writeln('k = ',k);
  
end.