{Vladyslav Mambetov}
{Date 2016.02.24}

program AL3;

uses crt;

var n1,n1c, n2, d, dd :byte;

begin
  {cleaning the screen}
  clrscr;

  {main part}
  n1 := 65;
  n2 := 104;
  
  writeln;
  n1 := n1 + 1;
  n1c := n1;
  if (n2 - n1) mod 3 = 0 then 
    d := (n2 - n1) div 3
    else d := (n2 - n1) div 3 + 1;
  if d mod 2 = 1 then d := d + 1;
  repeat
      write('[':4,n1,'] = ',char(n1));
      dd := n1 + d;
      if dd <= n2 then
        begin
          write('[':4,dd,'] = ',char(dd));
          dd := dd + d;
          if dd <= n2 then
            writeln('[':4,dd,'] = ',char(dd)) 
          else writeln;
        end
      else writeln;
      n1 := n1 + 2;
  until n1 >= n1c + d;
  
  {pause}
  readkey;
end.