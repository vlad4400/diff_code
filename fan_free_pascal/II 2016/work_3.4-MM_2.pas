{Vladyslav Mambetov}
{Date 2016.02.26-27}

program MM_3_2;

uses crt;

var
  k, n1, n2, d, dd, s, i, nn :byte;
  //p :integer;
  titi:real;

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
  nn := n2 - n1;
  titi := nn / k;
  if frac(titi) = 0 then dd := trunc(titi)
    else dd := trunc(titi) + 1;
  if dd mod 2 = 1 then dd := dd + 1 
    else dd := dd + 2;
  //dd := (n2 - n1) div k; // + (n2 - n1) mod 2;
  //if nn mod 2 = 0 then dd := dd + 1
    //else dd := dd + 
  writeln ('d = ',d);
  writeln('nn = ',nn);
  //dd := nn div k + nn mod 2;
  //dd := dd div k + dd mod 2;
  //dd := k * (dd);
  writeln ('dd = ',dd);
  writeln('titi = ',titi);
  writeln;
  while n1 < 104 + (230 - 104) / k do
  begin
    n1 := n1 + 2;
    for i := 1 to k do
    begin
      s := n1 + (i - 1) * dd;
      write('[':4,s,'] = ',char(s));
    end;
    writeln;
  end;
  
  {pause}
  readkey;
end.