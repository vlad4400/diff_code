window.onload = init;

let currenciesMid = [undefined];

function init() {
    fetch('http://api.nbp.pl/api/exchangerates/tables/a/?format=json')
        .then(data => data.json())
        .then(([{rates: array}]) => array.map((el, idx) => {
            document.querySelector("#currency-names").innerHTML 
                += `<option value="${ idx + 1 }">${ el.code }</option>`;
            currenciesMid.push(el.mid);
        }))
        .then(() => document.querySelector("#btn-currency").addEventListener("click", calc))
        .catch(err => console.log(err));
}

function calc(e) {
    e.preventDefault();

    let input = document.querySelector("#input-currency-name").value;
    let idx = document.querySelector("#currency-names").value;

    if (input && !isNaN(input) && idx && currenciesMid[idx]) {
        document.querySelector("#currency-output").innerText = `Res: ${ currenciesMid[idx] * input } PLN`;
    }
}