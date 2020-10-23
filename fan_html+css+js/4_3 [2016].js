var id = document.getElementById("test");
var className = document.getElementsByClassName("test");
var tag = document.getElementsByTagName("div");

for (i = 0; i < tag.length; i++) {
	tag[i].style.color = "blue"
}
for (i = 0; i < className.length; i++) {
	className[i].style.color = "green";
}
id.style.color = "red";