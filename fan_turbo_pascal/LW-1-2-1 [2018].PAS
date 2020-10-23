uses crt;

var
   c: longint;
   a, b, i: word;
   t: real;

begin
     clrscr;

     for i := 0 to 5 do
     begin
          port[$43] := $36;
          port[$40] := $FF;
          port[$40] := $FF;

          readkey;

          port[$43] := $06;

          a := port[$40];
          b := port[$40];

          c := $FFFF - a - b*256;

          t := c / (1.19*1000000);

          writeln(t);
     end;

     {pause}
     writeln;
     write('pause...');
     readln;
end.