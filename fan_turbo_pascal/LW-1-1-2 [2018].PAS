uses crt;

var
   c: longint;
   a, b, i: word;
   y, x, t: real;


begin
     clrscr;

     for i := 0 to 255 do
         begin
         port[$43] := $36;
         port[$40] := $FF;
         port[$40] := $FF;
         x := 0.1;
         y := sin(x) * cos(x);
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