program homework_3;

var
  i: real;
  j: integer;
  sp, sk, ds: word; //sp - the initial number of nights
                      //sk - the final number of nights (limit)
                      //ds - step
  h: array [1..1000] of word;
  m, s: array [1..1000] of real;

label 1, 2;

begin
  write('Enter the initial number of nights: ');
  read(sp);
  write('Enter the final number of nights(limit): ');
  read(sk);
  write('Enter the step: ');
  read(ds);
  h[1] := 24 * sp;
  m[1] := 24 * 60 * sp;
  s[1] := 24 * 60 * 60 * sp;
  for j := 1 to 1000 do
  begin
    sp := sp + ds;
    h[j] := 24 * sp;
    m[j] := 24 * 60 * sp;
    s[j] := 24 * 60 * 60 * sp;
    if sp > sk then goto 1;
  end;
  1:
  i := h[1] / 24;
  writeln;
  writeln('Path':5, 'Hours':7, 'Minutes':10, 'Second':13);
  for j := 1 to 1000 do
  begin
    writeln(i:5, h[j]:7, m[j]:10, s[j]:13);
    i := i + ds;
    if i > sk then goto 2;
  end;
  2:
  read(i); 
end.