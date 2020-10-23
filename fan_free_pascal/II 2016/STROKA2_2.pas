program string_edit;

uses crt;

var
	str, word :string;
	begin_position, i :byte;
	var_pos :integer;

begin
	clrscr;
	
	{test}
	//str := '  bing     boom sado    ming do  it  in dreem    ';
	//word := '   do  ';
	
	{input data}
	write('Enter the string: ');
	readln(str);
	write('Enter word: ');
	readln(word);
	
	{delete space}
	while str[1] = ' ' do delete(str, 1, 1);
	while str[length(str)] = ' ' do delete(str, length(str), 1);
	while word[1] = ' ' do delete(word, 1, 1);
	while word[length(word)] = ' ' do delete(word, length(word), 1);
	for i := length(str) downto 2 do
	begin
		if (str[i] = ' ') and (str[i] = str[i + 1]) then delete(str, i, 1);
	end;
	
	{alignment}
	str := ' ' + str + ' ';
	word := ' ' + word + ' ';
	
	
	{MAIN PART}
	begin_position := pos(word, str);
	
	if begin_position <> 0 then
	begin
		var_pos := begin_position + length(word); // -2 + 1
		while str[var_pos] <> ' ' do var_pos := var_pos + 1;
		delete(str, begin_position + length(word), var_pos - begin_position - length(word) + 1);
		writeln(var_pos, ' ',begin_position);
		
		var_pos := begin_position - 1;
		while str[var_pos] <> ' ' do var_pos := var_pos - 1;
		delete(str, var_pos, begin_position - var_pos);
	end;
	
	writeln;
	writeln('Result:', str);
	
	repeat until keypressed;
end.
