var senseOfLife = 42;
function showVariable (otherSenseOfLife) {
    senseOfLife = otherSenseOfLife || 42;
	return senseOfLife;
}

alert(showVariable())