uses crt;

var
   c: longint;
   a, b: word;
   y, t: real;

begin
     writeln('=BEGIN');
     writeln;

     port[$43] := $36;

     port[$40] := $FF;
     port[$40] := $FF;

     y := sin(0.1);

     port[$43] := $06;

     a := port[$40];
     b := port[$40];

     c := $FFFF - a - b*256;

     t := c / (1.19*1000000);

     write('Shot time: ');
     writeln(t:0:11);

     writeln;
     writeln('=END');

     {pause}
     readln;
end.
