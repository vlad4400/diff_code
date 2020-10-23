program lr5_2;
uses Dos, Crt, TPString;

Begin
clrscr;
	while(true) do
		Begin
				writeln('$0040:$0017: ');
				Write(binaryb(mem[$0040:$0017]));
				writeln('$0040:$0018: ');
				Write(binaryb(mem[$0040:$0018]));
				writeln;
				writeln;
				delay(100);
		end;

End.
