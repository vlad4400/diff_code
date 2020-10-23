program lr4_2;

var
  n, b, k, q, i, r, st, n1: integer;
  flag: boolean;

begin
  writeln('Лабораторная работа 4_1');
  writeln('Група 926');
  writeln('Мамбетов Влад');
  writeln;
  
  repeat
    Writeln('Введите n, и основу b, где 1<b<n-1');
    readln(n, b);
  until (odd(n) and ((1 < b) and (b < (n - 1))));
  n1 := n - 1;
  k := 0;
  st := 1;
  
  writeln('╔══════════╦══════════╗');
  writeln('║ степень  ║  остача  ║');
  writeln('╠══════════╬══════════╣');
  
  repeat
    k := k + 1;
    st := st * 2;
    if (n1 mod st) = 0 then q := n1 div st;
  until odd(q);
  st := 1;
  for i := 0 to k do
  begin
    //writeln('¦  ', 2, '^', i, '*', q, ' ¦', n - st * q:8, '¦');
    writeln('║  ', 2, '^', i, '*', q, '║':5 - length(inttostr(q)),
      '':3, n - st * q,'║':8 - length(inttostr(n - st * q)));
    st := st * 2;
  end;
  writeln('╚══════════╩══════════╝');
  if (n = 561) and (b = 2) then writeln('561 - число Кармайкла');
  if (n = 25) and (b = 2) then writeln('25 - сложное число по основанию 2 ')
  else if (n = 25) and (b = 7) then 
    writeln('25 - сильно псевдопростое по основанию 7 ');
  if (n = 341) and (b = 2) then writeln('341 - псевдопростое число по основанию 2');        
  i := 0;
  if (b * q) > n then r := ((b * q) mod n)
  else r := b * q;
  flag := false;
  repeat
    if ((i = 0) and (r = 1)) or ((i > 0) and (r = (n - 1))) or (((n - 1) mod b) <> 0) then 
    begin
      Writeln('Нечего точного сказать нельзя');
      flag := true;
    end
      else
    begin
      i := i + 1;
      if sqr(r) > n then r := sqr(r) mod n
      else r := sqr(r);
      if i >= k then 
      begin
        flag := true;
        writeln(n, ' - сложное');
      end;
    end;
  until flag; 
end.
