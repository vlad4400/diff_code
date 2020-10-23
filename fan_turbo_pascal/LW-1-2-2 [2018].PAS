uses crt;

var
   c: longint;
   x0, x1, x2, x3: word;
   y, t: real;

begin
     writeln('=BEGIN');
     writeln;

     port[$43] := $36;

     x0 := mem[$0040:$006C];
     writeln(x0);

     port[$43] := $36;
     portw[$40] := $0FF;
     port[$43] := $06;

     writeln(port[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);
     writeln(port[$40], '--', port[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);
     writeln(portw[$40]);

     writeln('----');
     writeln(port[$40]);
     writeln(port[$40]);
     writeln(port[$40]);
     writeln(port[$40]);

     x0 := mem[$0040:$006C];
     x1 := mem[$0040:$006C];
     x2 := mem[$0040:$006C];
     x3 := mem[$0040:$006C];
     c := meml[$0040:$006C];

     writeln(x0);
     writeln(x1);
     writeln(x2);
     writeln(x3);
     writeln(c);

     y := sin(0.1);

     {c := $FFFF - a - b*256;

     t := c / (1.19*1000000);

     write('Shot time: ');
     writeln(t:0:11);}

     writeln;
     writeln('=END');

     {pause}
     readln;
end.
