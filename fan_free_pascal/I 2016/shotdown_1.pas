program homewor_1;
//t1, t2, t3 - time of motion, v1, v2, v3 - speed of motion;
//v1, v2, v3 - way of motion;
var t1, t2, t3, v1, v2, v3, s1, s2, s3 :real;

begin
  writeln('Calculation of way (s1, s2, s3)');
  write('Enter this t1, t2, t3 = ');
  read(t1, t2, t3);
  write('Enter this v1, v2, v3 = ');
  read(v1, v2, v3);
  s1 := v1*t1;
  s2 := v2*t2;
  s3 := v3*t3;
  writeln('Result');
  writeln('s1 = ',s1);
  writeln('s2 = ',s2);
  writeln('s3 = ',s3);
  read(s1);
end.
