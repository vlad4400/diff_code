program bd_filmov;
uses crt;

type spisok = record
    name: string[20];
    studia: string[10];
    zhanr: string[10];
    god: integer;
    rezhisser: string[10];
    ispolnroley: string[30];
    soderzh: string[100];
    otsenka:integer;
    nalichie:integer;
  end;
  FT = file of spisok;
var a: ft;
  i, z: integer;
  s: real;

procedure Sozdanie(var a: ft);
var j: integer;
  bd: spisok;
begin
  rewrite(a);
  repeat
    begin
      write('Введите название фильма: ');
      readln(bd.name);
      write('Введит студию: ');
      readln(bd.studia);
      write('Введите жанр: ');
      Readln(bd.zhanr);
      write('Вветите год: ');
      readln(bd.god);
      write('Введите режисера: ');
      readln(bd.rezhisser);
      write('Введите исполнителей главных ролей: ');
      readln(bd.ispolnroley);
      write('Введие пкраткое содержание: ');
      readln(bd.soderzh);
      write('Введите субъектвную оценку фильма: ');
      readln(bd.otsenka);
      write('Введите наличие фильма в видеотеке: ');
      readln(bd.nalichie);
      write(a, bd);
      writeln('Продолжить ввод? Да - 1 Нет - 0');
      readln(j);
    end;
  until j = 0;
  close(a);
end;

procedure vyvod(var a: ft);
var i: integer;
  bd: spisok;
begin
  clrscr;
  reset(a);
  writeln('┌────────────────────┬──────────┬──────────┬────┬──────────┬──────────────────────────────┬──────────┬──────┬───────┐');
  writeln('│Название фильма     │Студия    │Жанр      │Год │Режиссер  │Исполнители главных ролей     │Содержание│Оценка│Наличие│');
  writeln('├────────────────────┼──────────┼──────────┼────┼──────────┼──────────────────────────────┼──────────┼──────┼───────┤');
  while not eof(a) do
  begin
    read(a, bd);
    write('│', bd.name: 20, '│');
    write(bd.studia: 10, '│');
    write(bd.zhanr: 10, '│');
    write(bd.god: 4, '│');
    write(bd.rezhisser: 10, '│');
    write(bd.ispolnroley: 30, '│');
    write(bd.soderzh: 10, '│');
    write(bd.otsenka: 6, '│');
    write(bd.nalichie: 7, '│');
    writeln;
    writeln('├────────────────────┼──────────┼──────────┼────┼──────────┼──────────────────────────────┼──────────┼──────┼───────┤');
    end;
    writeln('└────────────────────┴──────────┴──────────┴────┴──────────┴──────────────────────────────┴──────────┴──────┴───────┘');
  //end;
  close(a);
  writeln;
  readln;
end;

begin
  repeat
    clrscr;
    assign(a, 'base');
    writeln('       MEHU      ');
    writeln('1:cozdanie ');
    writeln('2:vyvod ');
    writeln('3:poisk ');
    writeln('4:vyxod ');
    readln(z);
    case z of
      1: Sozdanie(a);
      2: vyvod(a);
      4: exit;
    end;
  until z=4;
  readln
end.
