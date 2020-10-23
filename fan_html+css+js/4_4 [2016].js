id = document.getElementById("test");
var newElement = document.createElement("li");
id.appendChild(newElement);
newElement = document.createElement("li");
id.appendChild(newElement);
newElement = document.createElement("li");
id.appendChild(newElement);

arrOfLi = document.getElementsByTagName("li");
arrOfLi[0].innerText = "Yes Text";
//arrOfLi[0].innerHTML = "Yes";
arrOfLi[1].innerHTML = "Yes";