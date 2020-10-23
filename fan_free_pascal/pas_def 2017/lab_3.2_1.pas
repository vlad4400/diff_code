var 
  a, b, c, i0, i1, quan, n :integer;
  n_arr :array[0..100] of boolean;
  pbool :boolean;
  
begin
  writeln('Lab work 3_2');
  writeln('Groupe 926');
  writeln('Mambetov Vladyslav');
  writeln;
  
  write('a = ');
  readln(a);
  write('b = ');
  readln(b);
  write('c = ');
  readln(c);
  {
  a := 5;
  b := 30;
  c := -313;
  }
  
  for i0 := 0 to 100 do
  begin
    n := a*i0*i0 + b*i0 + c;
    if n < 2 then continue;

    quan := (n + 1) div 2;
    pbool := true;
    
    for i1 := 2 to quan do
    begin
      if n mod i1 = 0 then
      begin

        pbool := false;
        break;
      end;
    end;

    n_arr[i0] := pbool;
  end;
  
  for i0 := 0 to 100 do
  begin
  
    if (i0 mod 10 = 0) and (i0 < 100) then
    begin
      writeln;
      write('':1, i0, '-', i0 + 10, ': ');
    end;
    
    if n_arr[i0] then
      write(i0, ' ');
  
  end;
  
  writeln;
  writeln;
end.