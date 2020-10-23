program lab_1;

uses crt;

var
  a, b, r, d, x0, x1, y0, y1, x, y, a_cp, b_cp :longint;

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
  
  if (a > b) then
  begin
    r := b;
    b := a;
  end
  else
    begin
      r := a;
    end;
    
  a_cp := b;
  b_cp := r;
  
    
  writeln('╔═════╦═════╦═════╦═════╗');
  writeln('║','ostat':5,'║','chast':5,'║','x':5,'║','y':5,'║');
  writeln('╠═════╬═════╬═════╬═════╣');
  writeln('║',b:5,'║','-':5,'║','1':5,'║','0':5,'║');
  writeln('║',r:5,'║','-':5,'║','0':5,'║','1':5,'║');
  
  repeat   
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
      
      if (r <> 0) then
        writeln('╠═════╬═════╬═════╬═════╣');
        
      writeln('║',r:5,'║',d:5,'║',x:5,'║',y:5,'║');
    end;
  until (r = 0);
  
  writeln('╚═════╩═════╩═════╩═════╝');
  writeln;
  writeln('НОД(',a_cp,',',b_cp,') = ', a_cp*x+b_cp*y);
  writeln('НОК(',a_cp,',',b_cp,') = ', a_cp / (a_cp*x+b_cp*y) * b_cp);
  
  //cursoroff;
  repeat until keypressed;
  //cursoron;
end.
