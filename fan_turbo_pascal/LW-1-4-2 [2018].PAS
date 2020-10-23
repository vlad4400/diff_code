uses crt;

var
   c: longint;
   a, b, i: word;
   y, x, t: real;


begin


     port[$43] := $36;


     port[$40] := $FF;
     port[$40] := $FF;

     x := 0.1;
     y := sin(x) * cos(x);

     port[$43] := $06;
     a := mem[$40:$06];
     b := mem[$40:$06];

     c := $FFFF - a - b*256;

     t := c / (1.19*1000000);

     writeln(t);

     {pause}
     writeln;
     write('pause...');
     readln;
end.