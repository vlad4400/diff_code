{Vladyslav Mambetov}
{Date 2016.02.19-21}

program ASCII_SS;

uses crt;

var
  chi, n, n1, n2 :integer;
  chk :char;

begin
  {cleaning the screen}
  clrscr;
  
  {input data}
  write('Enter the symbol: ');
  read(chk);
  n := ord(chk);
  While n < 65 do
    begin
      clrscr;
      write('Error. Enter another symbol: ');
      read(chk);
      n := ord(chk);
    end;
  clrscr;
  writeln('You have entered the symobol «',chk,'».');
  writeln;
  
  {main part}
  n := ord(chk);
  For chi := 65 to n do 
    begin
      n1 := chi div 16;
      If n1 < 10 then
      n1 := n1 + 48
    else begin
      n1 := n1 + 55;
    end;
      n2 := chi mod 16;
      If n2 < 10 then
      n2 := n2 + 48
    else begin
      n2 := n2 + 55;
    end;
      Writeln(chr(chi):2,' ',chi:3,'d ',chr(n1),chr(n2),'h');
    end;
  
  {pause}
  readkey;
end.