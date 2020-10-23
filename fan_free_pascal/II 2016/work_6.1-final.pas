{Vladyslav Mambetov}
{Date 2016.03.12-17}

program lab_5_7;

uses
  crt;

var
  x, y: array[1..10] of longint;
  n, i: byte;

begin
  clrscr;
  
  {receive data entered from the keyboard}
  write(' Enter the number of array elements: ');
  read(n);
  writeln;
  writeln(' Enter the value of each array element:');
  for i := 1 to n do
  begin
    write(' {x', i, '}: ');
    read(x[i]);
  end;
  writeln;
  
  {ñonsolution entered elements}
  clrscr;
  write(' You have entered arry of elements: ');
  for i := 1 to n do write(' {x', i, '}=', x[i]);
  writeln;
  writeln;
  
  {processing and output of new value of the elements}
  for i := 1 to n do
  begin
    if x[i] mod 3 = 0 then y[i] := 0 else y[i] := 1;
    writeln(' {y',i,'} = ',y[i]);
  end;
  
  writeln;
  readkey;
end.