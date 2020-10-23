﻿program lab_1;

uses crt;

var
  a, b, r, d, x0, x1, y0, y1, x, y, a_cp, b_cp, _a, _b, _n, alpha,
  alp, L :longint;

begin
  clrscr;
  //cursoron;
  
  x0 := 1;
  x1 := 0;
  y0 := 0;
  y1 := 1;
  
  {
  write('Enter a = ');
  read(_a);
  write('Enter b = ');
  read(_b);
  write('Enter n = ');
  read(_n);
  }
  {
  _a := 31;
  _b := 20;
  _n := 103;
  }
  
  _a := 98;
  _b := 20;
  _n := 39;
  
  a := _a mod _n;
  b := _n;
  
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
  writeln(' НОД(',a_cp,',',b_cp,') = ', a_cp*x+b_cp*y, ';');
  writeln;
  //writeln(' НОК(',a_cp,',',b_cp,') = ', a_cp / (a_cp*x+b_cp*y) * b_cp);
  
  if b = 1 then
  begin
    {
    alpha := y;
    alp := (_a * alpha) mod _n;
    if alp < 0 then
      alp := _n + alp;
    }
    
    {
    writeln(' a * alpha = 1 (mod n) = ');
    writeln(' = ', _a, ' * ', alpha,' = 1 (mod ', _n, ') = ');
    writeln(' = ', _a * alpha, ' = 1 (mod ', _n, ') = ');
    writeln(' = ', alp, ' = 1 (mod ', _n, ');'
    writeln;
    }
    
    L := x;
    if L < 0 then
      L := _n + L;
     
    if (_a * ((L * _b) mod _n)) mod _n <> _b mod _n then
    begin
      L := y;
      if L < 0 then
        L := _n + L;
    end;
    
    writeln((L * _b) mod _n);
    writeln(_b);
     
    //xx := 
    
    writeln(' L = ', L, ' (mod ', _n,');');
    writeln;
    writeln(' L * a * x = L * b (mod n) =');
    writeln(' = ', L,' * ', _a,' * x = ', L, ' * ', _b, ' (mod ', _n ,') =');
    writeln(' = ', L * _a, ' * x = ', L * _b, ' (mod ', _n ,') ='); 
    writeln(' = ', (L * _a) mod _n, ' * x = ', (L * _b) mod _n,
      ' (mod ', _n ,');');
    writeln;
    writeln(' x = ', (L * _b) mod _n, ' (mod ',_n ,');');
  end
  else
    writeln(' НОД = ', b, ' - нельзя решить за алгоритмом Эвклида');
  
  //cursoroff;
  repeat until keypressed;
  //cursoron;
end.
