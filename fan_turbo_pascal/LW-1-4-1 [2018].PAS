uses crt;

var
   c: longint;
   a, b, i: word;
   t: real;

procedure intp; interrupt;
begin
     writeln('interrupt');
end;

begin

     clrscr;

     {test}
     {
     readln;

     writeln('nosound');
     nosound;
     writeln('sound');
     sound(220);
     delay(800);
     writeln('nosound');
     nosound;
     writeln;
     }

     readln;

     port[$43] := $B6;
     port[$40] := $FF;
     port[$40] := $FF;

     {sound}
     port[$61] := $86;

     port[$61] := $86;


     c := mem[$0040:$006C];
     writeln('mem0: ', c);

     delay($00FF);
     writeln('1');
     delay($00FF);
     writeln('2');
     delay($00FF);
     writeln('3');
     delay($00FF);
     writeln(4);

     c := meml[$0040:$006C];
     writeln('mem1: ', c);

     port[$43] := $06;

     c := meml[$0040:$006C];
     writeln('mem2: ', c);

     {pause}
     writeln;
     write('pause...');
     readln;
end.