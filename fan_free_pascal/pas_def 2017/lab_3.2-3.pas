program lab4_2;
var
  n, b, k, q, i, r :integer;

begin
  writeln('':2, 'Lab work 4_2');
  writeln('':2, 'Groupe 926');
  writeln('':2, 'Mambetov Vladyslav');
  writeln;
  {
  repeat
    writeln('--------------------');
    writeln('n --> unpaired');
    writeln('b --> 1 < b < n - 1');
    write('n = ');
    read(n);
    write('b = ');
    read(b);
  until (odd(n)) and (1 < b) and (b < n - 1);
  }
  n := 25;
  b := 7;
  
  k := 0;
  q := n - 1;
  
  while q mod 2 = 0 do
  begin
    k := k + 1;
    q := q div 2;
  end;
  
  writeln('╔══════════╦══════════╗');
  writeln('║  stupen  ║  ostach  ║');
  writeln('╠══════════╬══════════╣');
  
  for i := 0 to k do
  begin
    r := n - (trunc(power(b, i)) * q) mod n;
    writeln('║  ', b, '^', i, '*', q, '║':5 - length(inttostr(q)),
      '':3, r,'║':8 - length(inttostr(r)));
  end;
  
  writeln('╚══════════╩══════════╝');
  
  {
  if (((i = 0) and (r = 1)) or (i > 0)) and (r = n - 1) then
    write('Нечего точного сказать нельзя')
  else
    writeln('+');
  }
  i := 0;
  r := b * q mod n;
  
  repeat
  
    if ((i=0)and(r=1)) or ((i>0)and(r=(n-1))) then
      writeln('break');
    
    r := sqr(r) mod n;
    writeln(r, ' ', i, ' ', n, ' ');
    
    i := i + 1;
  until i = k;
  
  if n = k then
    writeln('skladne')
  else
    writeln('hz');
  
end.
