{Vladyslav Mambetov}
{Date 2016.02.25}

program MM_3_1;

uses crt;

var 
  ch1, ch2, c2, ch1c2, dd, win:integer;
  n, j:integer;

begin
  {cleaning the screen}
  clrscr;
  
  write('Enter the n = ');
  read(n);
  clrscr;
  writeln('For n = ',n);
  writeln;
  
  {main part}
  ch1 := 104;
  ch2 := 230;
  c2 := (ch2 - ch1) div n;
  ch1 := ch1 - 1;
  ch2 := ch2 - 1;
  ch1c2 := ch1 + c2;
  while ch1 < ch1c2 do
  begin
    ch1 := ch1 + 2;
    dd := ch1;
    //if c2 mod 2 = 1 then c2 := c2 - 1;
    for j:= 1 to n do
    begin
      {//if dd mod 2 = 0 then win := dd + 1
        //else win := dd;
      //if (j > 1) and (j mod 2 = 1) then win := win + (j div 2 - 1) * 2;
      //if n <> 3 then 
      if n = 3 then dd := dd - 2;
      //3
      if n = 7 then dd := dd - 2;
      //2
      if n = 10 then dd := dd - 2;
      //1
      if n = 12 then dd := dd - 2;
      //2
      if n = 15 then dd := dd - 2;
      //3
      if n = 19 then dd := dd - 2;
      if n = 20 then dd := dd - 2;
      if n = 21 then dd := dd - 2;
      //4
      if n = 26 then dd := dd - 2;
      if n = 27 then dd := dd - 2;
      if n = 28 then dd := dd - 2;
      if n = 29 then dd := dd - 2;
      if n = 30 then dd := dd - 2;
      if n = 31 then dd := dd - 2;
      //5 
      dd := dd  + 2;}
      write('[':4,dd,'] = ',char(dd));
      dd := dd + c2;
      //write(' ',dd,' ',c2);
    end;
    writeln;
  end;
  
  {pause}
  writeln;
  //readkey;
end.