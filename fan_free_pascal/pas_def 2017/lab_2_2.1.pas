var
  x1, y1, r, n, n_cp, nn: integer;

begin
  write('n = ');
  read(n);
  
  n_cp := n;
  x1 := 2 * trunc(sqrt(n)) + 1;
  y1 := 1;r := sqr(trunc(sqrt(n))) - n;
  
  while r <> 0 do
  begin
    if r >= 0 then begin
      r := r - y1;
      y1 := y1 + 2;
    end
    else begin
      r := r + x1;
      x1 := x1 + 2
    end;
  end;
  
  n := trunc(((x1 - y1) / 2) * ((x1 + y1 - 2) / 2));
  nn := trunc((x1 + y1 - 2) / 2);
  
  writeln;
  writeln(n_cp,' = ',nn,' * ',n_cp / nn);
end.