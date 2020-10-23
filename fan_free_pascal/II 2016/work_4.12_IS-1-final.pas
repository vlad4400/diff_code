{Vladyslav Mambetov}
{Date 2016.03.12}

program ASCII;

uses
  crt;

var
  ch1, ch2: char;
  n1, n2, i, j, df, v, k, h, clm: byte;
  h1, h2: word;

begin
  clrscr;
  
  
  {receverd data entered with keyboad}
  write(' The starting character: ');
  readln(ch1);
  write(' The end character: ');
  readln(ch2);
  writeln;
  
  
  {prymary data processing}
  clm := 3;
  df := 12;
  n1 := ord(ch1);
  n2 := ord(ch2);
  
  if n1 mod 2 <> 0 then n1 := n1 + 1;
  if n2 mod 2 <> 0 then n2 := n2 - 1;
  
  if (n2 - n1) / 2 + 1 < clm then clm := trunc((n2 - n1) / 2) + 1;
  h1 := (trunc((n2 - n1) / 2) + 1) div clm;
  if trunc((n2 - n1) / 2) + 1 mod clm = 0 then h2 := trunc((n2 - n1) / 2 / clm)
  else h2 := trunc((n2 - n1) / 2 / clm) + 1;
  
  v := trunc((n2 - n1) / 2) + 1 - h1 * clm;
  
  if v = 0 then v := clm;
  
  
  {main part}
  write(' ╔');
  for i := 1 to clm * df do
    if i mod df <> 0 then 
      write('═') 
    else if i <> clm * df then write('╤');
  write('╗');
  writeln;
  
  while n1 <= n2 do
  begin
    h := h + 1;
    write(' ║');
    for i := 1 to clm do
    begin
      case length(inttostr(n1)) of
        1: k := 3;
        2: k := 2;
        3: k := 1;
      end;
      if n1 <= n2 then
      begin
        case n1 of
          7, 8, 9, 10, 13, 149: write(' ':k, '[', n1, '] = ?');
        else write(' ':k, '[', n1, '] = ', chr(n1));
        end;
        case i of
          1, 2: write(' │');
          3:  write(' ║');
        end;
      end;
      n1 := n1 + 2;
    end;
    writeln;
    
    if (n1 <= n2) and (h < h1) then
    begin
      write(' ╟');
      for i := 1 to clm * df do
        if i mod df <> 0 then 
          write('─') 
        else if i <> clm * df then write('┼');
      write('╢');
      writeln;
    end
    else if h <> h2 then begin
      write(' ╟');
      for i := 1 to clm * df do
        if i mod df <> 0 then 
          write('─') 
        else if (i <= v * df) and (i <> clm) then write('┼')
        else if (i <> clm * df) then write('┴')
        else if v = clm then writeln('╜')
        else if h = h1 then writeln('╜');
    end;
    
  end;
  
  write(' ╚');
  for i := 1 to v * df do 
    if i mod df <> 0 then 
      write('═') 
    else if i <> v * df then write('╧');
  if v = clm then writeln('╝')
  else writeln('╛');
  
  
  readkey;
end.