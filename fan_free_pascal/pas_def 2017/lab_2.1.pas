program lab_1;

uses crt;

var
  a, b, r, d, x0, x1, y0, y1, x, y :longint;

begin
  clrscr;
  //cursoron;
  
  x0 := 1;
  x1 := 0;
  y0 := 0;
  y1 := 1;

  write('Enter a = ');
  read(a);
  write('Enter b = ');
  read(b);
  writeln(a,'->',b,'->',r);
  if (a > b) then
  begin
    r := b;
    b := a;
  end else
    begin
      r := a;
    end;
  writeln(a,'->',b,'->',r);
  writeln;
  repeat
    //writeln(a,'->',b,'->',r);
    a := b;
    b := r;
    r := a mod b;
    
    if (r <> 0)then
    begin
      d := a div b;
      x := x0 - x1 * d;
      y := y0 - y1 * d;
      x0 := x1;
      x1 := x;
      y0 := y1;
      y1 := y;
      
      writeln(a,'->',b,'->',r,' >> ', d, ' ', x, ' ', y);
    end;
  until (r = 0);
  
  writeln;
  writeln(a,'->',b,'->',r);

  writeln;
  writeln('NSD(a, b) = ', b);

  //cursoroff;
  repeat until keypressed;
  //cursoron;
end.
