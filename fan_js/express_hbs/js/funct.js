
example = () => {
    const fromInput = document.getElementById("example").value;
    document.getElementById("text").innerText = fromInput;
}

document.getElementById("action").addEventListener("click", example);