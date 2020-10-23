program base;
uses crt;
var c,i:integer;
var n,k,dateint, priceint:integer;
var stringdate:string;
Type Travel=record
country:string;
price:string;
dated, datem, datey :integer;

number:integer;
end;


FT = file of Travel;
var
a: ft;
z: integer;
mas : array[1..99] of Travel;


procedure clean(var a: ft);
begin
rewrite(a);

Reset(a);
end;


procedure massave;
begin
	assign(a,'base1.txt');
	reset(a);
	c:=0;
	while not eof(a) do begin
	c:=c+1;
	read(a, mas[c]);
end;
close(a);

end;
procedure save;
	begin 
		assign(a,'base1.txt');
		rewrite(a);
		for i:= 1 to c do begin
		write(a,mas[i]);
		end;
		close(a);
	end;

procedure addmod(var a: ft);
var
j: integer;
bd: Travel;
begin

massave;

rewrite(a);

repeat
begin
clrscr;

c := c + 1;

write('ขฅคจโฅ แโเ ญใ ');
readln(mas[c].country);


write('ขฅคจโฅ ๆฅญใ ');
readln(mas[c].price);

write('ขฅคจโฅ ค โใ ');
Readln(mas[c].dated);
clrscr;
writeln('ขฅคจโฅ แโเ ญใ ', mas[c].country);mas[c]
writeln('ขฅคจโฅ ๆฅญใ ', mas[c].price);
write('ขฅคจโฅ ค โใ ',mas[c].dated,'.') ;
Readln(mas[c].datem);
clrscr;
writeln('ขฅคจโฅ แโเ ญใ ', mas[c].country);
writeln('ขฅคจโฅ ๆฅญใ ', mas[c].price);
write('ขฅคจโฅ ค โใ ',mas[c].dated,'.',mas[c].datem,'.') ;
Readln(mas[c].datey);

write('ฎซจ็ฅแโขฎ แขฎกฎคญ๋ๅ ฌฅแโ ');
readln(mas[c].number);
write(a,mas[c]);

writeln('•ฎโจโฅ ฏเฎคฎซฆจโ์ ง ฏจแ์? ค -1 ญฅโ-0');
readln(j);
Writeln;
end;
until j = 0;
close(a);

save;

end;




procedure main1;
begin
clrscr;
writeln('ซ ขญฎฅ ฌฅญ๎');
writeln('');
writeln('');
writeln('');
writeln('');
writeln('');
writeln('1-็จแโจโ์ ก งใ');
writeln('2-ฎคฎกเ โ์ ซจฆ ฉ่จฉ โใเ');
writeln('3-๋ขฅแโจ ขแฅ ง ฏจแจ');
writeln('4-ฅเฅฏจแ โ์ ก งใ ค ญญ๋ๅ');
writeln('5-ฎคฎกเ โ์ โใเ๋ ฏฎ ค โฅ');

writeln('0-๋ๅฎค');
end;


procedure ALL(var a: ft);
var bd: Travel;
var cl10:integer;
var prov:integer;
begin
clrscr;
cl10:=0;
reset(a);

writeln('ษอออออออออออออออหออออออออออหอออออออออออหอออออออออออออออออออออป');
writeln('บ งข ญจฅ แโเ ญ๋บ‘โฎจฌฎแโ์ บ    โ     บฎซฎขฎ แขฎกฎคญ๋ๅ ฌฅแโบ');
writeln('ฬอออออออออออออออฮออออออออออฮอออออออออออฮอออออออออออออออออออออน');
while not eof(a) do
begin
read(a, bd);
With bd do

  Begin
While length(country)<15 do country:=country+' ';
write('บ', country, 'บ');
While length(price)<10 do price:=price+' ';

write(price, 'บ');
prov:=dated div 10;

if prov=0 then cl10:=cl10+1;
prov:=datem div 10;

	if prov=0 then  cl10:=cl10+1;
  prov:=datey div 10;
		if prov=0 then cl10:=cl10+1;
case cl10 of
						3:write(dated:7,'.',bd.datem,'.',bd.datey ,'บ');

						2:write(dated:6,'.',bd.datem,'.',bd.datey ,'บ');
                        1:write(dated:5,'.',bd.datem,'.',bd.datey ,'บ');
						0:write(dated:4,'.',bd.datem,'.',bd.datey ,'บ');
end;
prov:=0;
cl10:=0;
write(number:21, 'บ');

writeln;
if eof(a) then writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ')
else           writeln('ฬอออออออออออออออฮออออออออออฮอออออออออออฮอออออออออออออออออออออน');
end;
end;

close(a);

readln;
end;



procedure date(var a: ft);

var bd: Travel;

var cl10:integer;
var prov,error:integer;
var day,month,year,minday,minmonth,minyear,minday1,minmonth1,minyear1:integer;
var maxday,maxmonth,maxyear,maxday1,maxmonth1,maxyear1:integer;
begin
	error:=1;
clrscr;
minday:=32;
minmonth:=13;
minyear:=100;
write('ขฅคจโฅ ค โใ ');
readln(day);
clrscr;
write('ขฅคจโฅ ค โใ ',day,'.');
Readln(month);
clrscr;
write('ขฅคจโฅ ค โใ ',day,'.',month,'.');
Readln(year);
clrscr;
write('ขฅคฅญญ ๏ ค โ  ',day,'.',month,'.',year);
writeln('');
cl10:=0;
reset(a);
minday1:=111;
minmonth1:=111;
minyear1:=111;
maxday1:=111;
maxmonth1:=111;
maxyear1:=111;
maxday:=0;
maxmonth:=0;
maxyear:=0;

while not eof(a) do
	begin
	read(a, bd);
	With bd do if (datey>=year) and ( datem>=month) and ( dated>=day) then
	Begin
{writeln(datey,datem,dated);}
if (datey-year)<minyear then
	begin
	minyear:=datey-year; minyear1:=datey;
	if (datem-month)<minmonth then begin
        minmonth:=datem-month; minmonth1:=datem;
	 if (dated-day)<minday then begin minday:=dated-day; minday1:=dated;
	 end;
	 end;
	end;
end;end;

close(a);

reset(a);

while not eof(a) do
	begin
	read(a, bd);
	With bd do if (datey<=year) and ( datem<=month) and ( dated<=day) then
	Begin

if (year-datey)>=maxyear then
	begin
	maxyear:=year-datey; maxyear1:=datey;
	if (month-datem)>=maxmonth then begin
        maxmonth:=month-datem; maxmonth1:=datem;
	 if (day-dated)>=maxday then begin maxday:=day-dated; maxday1:=dated;
	 end;
	 end;
	end;
end;end;

close(a);

Writeln('ซจฆ ฉ่จฅ โใเ๋:',minday1,'.',minmonth1,'.',minyear1,' ',maxday1,'.',maxmonth1,'.',maxyear1) ;

Reset(a);
writeln('ษอออออออออออออออหออออออออออหอออออออออออหอออออออออออออออออออออป');
writeln('บ งข ญจฅ แโเ ญ๋บ‘โฎจฌฎแโ์ บ    โ     บฎซฎขฎ แขฎกฎคญ๋ๅ ฌฅแโบ');
writeln('ฬอออออออออออออออฮออออออออออฮอออออออออออฮอออออออออออออออออออออน');
while not eof(a) do
begin
read(a, bd);
With bd do
if (datey=minyear1) and (datem=minmonth1) and (dated=minday1)  then
  Begin error:=0;
While length(country)<15 do country:=country+' ';
write('บ', country, 'บ');
While length(price)<10 do price:=price+' ';

write(price, 'บ');
prov:=dated div 10;

if prov=0 then cl10:=cl10+1;
prov:=datem div 10;

	if prov=0 then  cl10:=cl10+1;
  prov:=datey div 10;
		if prov=0 then cl10:=cl10+1;
case cl10 of
						3:write(dated:7,'.',bd.datem,'.',bd.datey ,'บ');

						2:write(dated:6,'.',bd.datem,'.',bd.datey ,'บ');
                        1:write(dated:5,'.',bd.datem,'.',bd.datey ,'บ');
						0:write(dated:4,'.',bd.datem,'.',bd.datey ,'บ');
end;
prov:=0;
cl10:=0;
write(number:21, 'บ');

writeln;
if eof(a) then writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ')
else           writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ');
end;
end;
if error=5 then begin
	clrscr;
	Writeln('error');
	end;

close(a);
reset(a);
while not eof(a) do
begin
read(a, bd);
With bd do
if (datey=maxyear1) and (datem=maxmonth1) and (dated=maxday1)  then
  Begin error:=0;
While length(country)<15 do country:=country+' ';
write('บ', country, 'บ');
While length(price)<10 do price:=price+' ';

write(price, 'บ');
prov:=dated div 10;

if prov=0 then cl10:=cl10+1;
prov:=datem div 10;

	if prov=0 then  cl10:=cl10+1;
  prov:=datey div 10;
		if prov=0 then cl10:=cl10+1;
case cl10 of
						3:write(dated:7,'.',bd.datem,'.',bd.datey ,'บ');

						2:write(dated:6,'.',bd.datem,'.',bd.datey ,'บ');
                        1:write(dated:5,'.',bd.datem,'.',bd.datey ,'บ');
						0:write(dated:4,'.',bd.datem,'.',bd.datey ,'บ');
end;
prov:=0;
cl10:=0;
write(number:21, 'บ');

writeln;
if eof(a) then writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ')
else           writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ');
end;
end;
if error=5 then begin
	clrscr;
	Writeln('error');
	end;

close(a);
readln;
end;




procedure  price1(var a: ft);
var bd: Travel;
var cl10,minp,maxp,k:integer;
var prov, priceint,error:integer;

begin
	error:=1;
clrscr;
cl10:=0;
reset(a);
writeln('ขคจโฅ ฌจญจฌ ซ์ญใ๎ แโฎจฌฎแโ์');
Readln(minp);
writeln('ขคจโฅ ฌ ชแจฌ ซ์ญใ๎ แโฎจฌฎแโ์') ;
readln(maxp);
clrscr;
Writeln('ๆฅญ๋ ขขฅคฅญ๋ ข เ ฌช ๅ ',minp,' - ',maxp );
writeln('ษอออออออออออออออหออออออออออหอออออออออออหอออออออออออออออออออออป');
writeln('บ งข ญจฅ แโเ ญ๋บ‘โฎจฌฎแโ์ บ    โ     บฎซฎขฎ แขฎกฎคญ๋ๅ ฌฅแโบ');
writeln('ฬอออออออออออออออฮออออออออออฮอออออออออออฮอออออออออออออออออออออน');
while not eof(a) do
begin
read(a, bd);
With bd do
  begin val(price,priceint,k);
 if (priceint>=minp) and (priceint<=maxp) then begin error:=0;
While length(country)<15 do country:=country+' ';
write('บ', country, 'บ');
While length(price)<10 do price:=price+' ';

write(price, 'บ');
prov:=dated div 10;

if prov=0 then cl10:=cl10+1;
prov:=datem div 10;

	if prov=0 then  cl10:=cl10+1;
  prov:=datey div 10;
		if prov=0 then cl10:=cl10+1;
case cl10 of
						3:write(dated:7,'.',bd.datem,'.',bd.datey ,'บ');

						2:write(dated:6,'.',bd.datem,'.',bd.datey ,'บ');
                        1:write(dated:5,'.',bd.datem,'.',bd.datey ,'บ');
						0:write(dated:4,'.',bd.datem,'.',bd.datey ,'บ');
end;
prov:=0;
cl10:=0;
write(number:21, 'บ');

writeln;
if eof(a) then writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ')
else           writeln('ศอออออออออออออออสออออออออออสอออออออออออสอออออออออออออออออออออผ');
end;
end;



end;

if error=1 then begin
	clrscr;
	Writeln('error');
	end;
close(a);

readln;
end;








begin
clrscr;
repeat

assign(a, 'base1.txt');

main1;
readln(k);
case k of


1:clean(a);
2:date(a);
3:ALL(a);
4:addmod(a);
5:price1(a);


end;
until k=0;

end.
