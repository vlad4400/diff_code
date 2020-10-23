program lab_1;

uses crt;

var
  a, b, r :longint;

begin
  clrscr;
  cursoron;

  write('Enter a = ');
  read(a);
  write('Enter b = ');
  read(b);

  if (a > b) then
  begin
    r := b;
    b := a;
  end else
    begin
      r := a;
    end;

  repeat
    a := b;
    b := r;

    r := a mod b;
  until (r = 0);

  writeln;
  writeln('NSD(a, b) = ', b);

  cursoroff;
  repeat until keypressed;
  cursoron;
end.
