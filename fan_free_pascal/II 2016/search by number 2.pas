{Date 2016.06.29}

uses crt;

var
  st, new_st, st_prot :string;
  j, n, n1, n2, ch :byte;
  FlagNoSpace :boolean;
  
begin
  clrscr;
  
  {starting value}
  n := 0;
  n1 := 0;
  n2 := 0;
  FlagNoSpace := True;
  
  {enter value}
  write('Enter the string: ');
  readln(st);
  write('Index search word: ');
  read(ch);
  
  {remove extra spaces}
  while st[1] = ' ' do delete(st, 1, 1);
  st_prot := st;
  st := '';
  for j := 1 to length(st_prot) do
  begin
    if st_prot[j] = ' ' then
    begin
      if FlagNoSpace then st := st + st_prot[j];
    end
    else st := st + st_prot[j];
    if st_prot[j] = ' ' then FlagNoSpace := False
    else FlagNoSpace := True;
  end;
  while st[length(st)] = ' ' do delete(st, length(st), 1);
  
  st := st + ' ';
  
  {MAIN PART: determine the number of words and move it to front row}
  if ch > 1 then
  begin
    for j := 2 to length(st) do
    begin
      if st[j] = ' ' then
      begin
        n := n + 1;
        n1 := n2;
        n2 := j;
        if (n = ch) and (ch > 1) then
        begin
          //new_st := copy(st, n1 + 1, n2 - n1 - 1);
          //new_st := new_st + ' ' + copy(st, 1, n1 - 1) + ' ' + copy(st, n2 + 1, length(st) - 1);
          new_st := copy(st, 1, n1 - 1) + ' ' + copy(st, n2 + 1, length(st) - 1);
        end;
      end;
    end;
  end
  else new_st := st;
  if (ch > n) and (ch <> 1) then new_st := 'The word sequence number greater than the number of words per line.';
  
  writeln('Result: ', new_st);
  
  readkey
end.