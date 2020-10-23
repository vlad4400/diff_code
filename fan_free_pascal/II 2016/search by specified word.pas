{Date 2016.04.27}
{//uses crt;}

var
  st, new_st, st_prot, sl, p :string;
  j, n1, n2:byte;
  FlagNoSpace :boolean;
  
begin
  {//clrscr;}
  
  {starting value}
  n1 := 0;
  n2 := 0;
  FlagNoSpace := True;
  new_st := '';
  
  {enter value}
  write('Enter the string: ');
  readln(st);
  write('Search word: ');
  read(sl);
  
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
  
  while sl[1] = ' ' do delete(sl, 1, 1);
  while sl[length(sl)] = ' ' do delete(sl, length(sl), 1);
  
  st := st + ' ';
  
  {MAIN PART: determine the number of words and move it to front row}
  st_prot := st;
  for j := length(st) downto 2 do
  begin
    if st[j] = ' ' then
    begin
      n2 := n1;
      n1 := j;
      p := copy(st, n1 + 1, n2 - n1 - 1);
      if p = sl then
      begin
        {new_st := new_st +  sl + ' ' + copy(st, 1, n1 - 1) + ' ' + copy(st, n2 + 1, length(st) - 1);}
        new_st := new_st + sl + ' ';
        writeln(n1,' ',n2);
        delete(st_prot, n1, n2 - n1 - 1);
        writeln(j);
      end;
    end;
  end;

  writeln('Result: ', new_st + st_prot);
  
  {//readkey}
end.