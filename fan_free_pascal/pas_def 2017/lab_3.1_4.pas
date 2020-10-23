var
  n1, n2, i, x, quan :integer;
  a :array[2..50000] of byte;
  
begin
  writeln(' Lab work 3_1');
  writeln(' Groupe 926');
  writeln(' Mambetov Vladyslav');
  writeln;
  
  write(' n1 = ');
  readln(n1);
  write(' n2 = ');
  readln(n2);
  
  n1 := n1 - 1; // --> 1
  quan := (n2 + 1) div 2;
  
  for i := 2 to quan do
  begin
  
    if a[i] = 0 then
    begin
      
      x := 2*i;
      
      while x <= n2 do
      begin
        a[x] := 1;
        x := x + i;
      end;
      
    end;
    
  end;
  
  n1 := n1 + 1; // <-- 1
  
  for i := n1 to n2 do
  begin
  
    if (i mod 10 = 0) and (i < n2) then
    begin
      writeln;
      write('':1, i, '-', i + 10, ': ');
    end;
    
    if a[i] = 0 then write(i,' ');
    
  end;
    
  writeln;
  writeln;
end.