uses crt;

var
   c: longint;
   a, b, i: word;
   t: real;

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
     {
     nosound;
     sound(220);
     nosound;
     }

     readln;
     port[$43] := $B6;
     port[$42] := $FF;
     port[$42] := $7;

     {sound}

     port[$61] := $3;

     delay(800);


     {readln; }
     port[$61] := $0;

     {pause}
     writeln;
     write('pause...');
     readln;
end.