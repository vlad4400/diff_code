{Vladyslav Mambetov}
{Date 2016.02.26-28}

program MM_3_3;

uses crt;

var
  k, n1, n2, d, dd, s, i, nn, n1c, p :byte;
  titi, v:real;

begin
  {cleaning the screen}
  clrscr;
  
  {input data}
  write('Number of columns: ');
  read(k);
  writeln;
  
  {main part}
  n1 := 104;
  n2 := 230;
  
  n1 := n1 - 1;
  n2 := n2 - 1;
  n1c := n1;
  nn := n2 - n1;
  titi := nn / k;
  if frac(titi) = 0 then dd := trunc(titi)
    else dd := trunc(titi) + 1;
  if dd mod 2 = 1 then dd := dd + 1
    else dd := dd + 2;
        writeln ('d = ',d);
        writeln('nn = ',nn);
        writeln ('dd = ',dd);
        writeln('titi = ',titi);
  v := (dd * k - nn) / 2;
        writeln('v = ',v);
        //змiщення, перерозподiл;
  while v >= k do
    begin
      v := v - k;
      dd := dd - 2;
      p := p + 2;
    end;
  writeln;
  while n1 < 104 + (n2 - n1c) / k - p do
  begin
    n1 := n1 + 2;
    for i := 1 to k do
    begin
      s := n1 + (i - 1) * dd;
      if s <= n2 then 
        write('[':4,s,'] = ',char(s));
    end;
    writeln;
  end;
  
  {pause}
  readkey;
end.