program word;

uses crt;

type mas = array[1..15] of integer;
 	
var str :string; 
	n, i, j, p, k, c :byte;
	mas1, mas2 :mas; 
	var_wold :string;
	
begin 
	clrscr;
	
	n := 1; 
	write('Input row: '); 
	read(str); 
	
	for i := 1 to length(str) - 1 do 
		if copy(str, i, 1) = ' ' then n := n + 1;
		
	c := 1;
	
	for i := 1 to n do 
	begin 
		mas1[i] := c;
		k := 0; 
		for j := c to length(str) do 
		if str[j] = ' 'then break 
		else
			k := k + 1; 
		mas2[i] := k; 
		c := c + k + 1; 
	end;
	
	write('Number of words: '); 
	read(p); 
	
	{if p > n then 
		delete (str,mas1[2], mas2[2] + mas2[3]+1) 
	else 
		delete (str,mas1[p],mas2[p]);}
	
	if p <= n then
	begin
		//var_word := copy(str, mas1[p], mas2[p]);
		delete(str, mas1[p] + mas2[p] - 1, 1);
		writeln(str);
		delete(str, mas1[p], 1);
		//delete(str, mas1[p], mas2[p]);
	end;
	
	
	writeln(mas1[1]);
	writeln(mas2[2]);
	writeln(mas1[p]);
	writeln(mas2[p]);
	writeln(str);
	
	readkey;
End.