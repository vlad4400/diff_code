uses crt;

var
   i: integer;
   c: longint;
   y, t, p0, p1, dp: real;

begin
     writeln('=BEGIN');
     writeln;

     port[$43] := $36;
     port[$40] := $FF;
     port[$40] := $FF;

     p0 := meml[$0040:$006C];
     writeln(p0);
     writeln(meml[$0040:$006C]);
     writeln(mem[$0040:$006C]);

     for i := 0 to 10000 do
     begin
          y := sin(0.1) * cos(0.2) * ln(20) + y;
     end;

     p1 := meml[$0040:$006C];
     writeln(p1);
     writeln(meml[$0040:$006C]);
     writeln(mem[$0040:$006C]);

     dp := p1 - p0;
     writeln(dp);

     t := $FF / (1.19*1000000) * dp;

     write('Shot time: ');
     writeln(t:0:11);

     writeln;
     writeln('=END');

     {pause}
     readln;
end.
