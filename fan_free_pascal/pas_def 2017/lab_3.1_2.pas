var
  n1, n2, i, x :integer;
  a :array[1..50000] of byte;
  
begin
  write('n1 = ');
  readln(n1);
  write('n2 = ');
  readln(n2);
 
  for i := 2 to (n2 + 1) div 2 do 
  begin
   x := i * 2;
   
    while x <= n2 do
    begin
      a[x] := 1;
      x := x + i;
    end;
    
    x := 0;
  end;

  for i := n1 to n2 do
    if a[i] = 0 then write(i,' ');
    
end.