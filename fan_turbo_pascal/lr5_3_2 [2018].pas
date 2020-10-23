program lr5_3;
uses Dos,Crt,TPString;


Begin
clrscr;
	while(true) do
		Begin
				Writeln('Buffer: ');
				Write(mem[$0040:$001E], ' ');
				Write(mem[$0040:$001F], ' ');
				Write(mem[$0040:$0020], ' ');
				Write(mem[$0040:$0021], ' ');
				Write(mem[$0040:$0022], ' ');
				Write(mem[$0040:$0023], ' ');
				Write(mem[$0040:$0024], ' ');
				Write(mem[$0040:$0025], ' ');
				Write(mem[$0040:$0026], ' ');
				Write(mem[$0040:$0027], ' ');
				Write(mem[$0040:$0028], ' ');
				Write(mem[$0040:$0029], ' ');
				Write(mem[$0040:$002A], ' ');
				Write(mem[$0040:$002B], ' ');
				Write(mem[$0040:$002C], ' ');
				Write(mem[$0040:$002D], ' ');
				Write(mem[$0040:$002E], ' ');
				Write(mem[$0040:$002F], ' ');
				Write(mem[$0040:$0030], ' ');
				Write(mem[$0040:$0031], ' ');
				Write(mem[$0040:$0032], ' ');
				Write(mem[$0040:$0033], ' ');
				Write(mem[$0040:$0034], ' ');
				Write(mem[$0040:$0035], ' ');
				Write(mem[$0040:$0036], ' ');
				Write(mem[$0040:$0037], ' ');
				Write(mem[$0040:$0038], ' ');
				Write(mem[$0040:$0039], ' ');
				Write(mem[$0040:$003A], ' ');
				Write(mem[$0040:$003B], ' ');
				Write(mem[$0040:$003C]);
				writeln;
				writeln('head: ');
				Write(binaryb(memw[$0040:$001A]));
				writeln;
				write('tail: ');
				write(binaryb(memw[$0040:$001C]));
				writeln;
				writeln;
				delay(1000);
		end;
End.
