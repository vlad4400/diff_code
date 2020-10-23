{Vladyslav Mambetov}
{Date 2016.03.10}

program lab_5_7;

uses
  crt;

var
  x: array[1..90] of longint;
  i: byte;
  max: shortint;
  sm, sp: smallint;

begin
  clrscr;
  
  randomize;
  
  max := -50;
  
  for i := 1 to 90 do
  begin
    x[i] := random(101) - 50;
    writeln(' [', i, '] = ', x[i]);
    if (x[i] > max) and (x[i] < 0) then max := x[i];
    if round(x[i]) mod 2 <> 0 then
      if x[i] > 0 then sp := sp + x[i]
      else sm := sm + x[i];
  end;
  
  writeln;
  writeln(' Maximum: ', max);
  writeln(' The sum of positive number: ', sm);
  writeln(' The sum of negative number: ', sp);
  
  readkey;
end.