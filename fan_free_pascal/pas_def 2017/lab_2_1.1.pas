var
  x, i, s, k, p, qx, j, qi :integer;
  f_p :boolean;
  
begin
  s := 0;
  k := 0;
  
  write('x = ');
  read(x); //3364
  
  while (x <> 1) do
  begin
    //---------------------------
    f_p := true;
    qx := trunc(sqrt(x));
    i := 2;
    
    while (i <= qx) and f_p do
    begin
      if (x mod i = 0) then
        f_p := false;
      i := i + 1;
    end;
    
    if f_p then
      begin
        s := s + x;
        k := k + 1;
        break;
      end;
    //---------------------------
    p := 2;
    
    if (x mod 2 <> 0) then
      begin
        i := 3;
        qx := trunc(sqrt(x));
        
        repeat
          f_p := true;
          qi := trunc(sqrt(i));
          j := 3;
          
          while (j <= qi) and f_p do
          begin
            if (i mod j = 0) then
              f_p := false;
            j := j + 2;
          end;
        
          if f_p then
            begin
              if (x mod i = 0) then
                begin
                  p := i;
                  break;
                end;
            end;
              
          i := i + 2;
        until (i > qx);
      end;
      
    x := x div p;
    //writeln(p);
    //writeln(x);
    
    s := s + p;
    k := k + 1;
  end;
  
  writeln;
  writeln('S = ',s);
  writeln('k = ',k);
end.