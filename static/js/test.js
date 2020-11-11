let datalist = document.getElementById('datalist');
let datalist1 = document.getElementById('datalist1');
let datalist2 = document.getElementById('datalist2');
let datalist3 = document.getElementById('datalist3');
var myArr = [datalist, datalist1, datalist2, datalist3];
console.log(datalist);

function addAge() {

    for (let i = 20; i <= 79; i++) {

        datalist.insertAdjacentHTML('beforeend',
            `<option value="${i}">`);
    }

}

addAge();

function addTrestbps() {

    for (let i = 90; i <= 200; i++) {

        datalist1.insertAdjacentHTML('beforeend',
            `<option value="${i}">`);
    }

}


addTrestbps();

function addThalach() {

    for (let i = 120; i <= 570; i++) {

        datalist2.insertAdjacentHTML('beforeend',
            `<option value="${i}">`);
    }

}


addThalach();

function addChol() {

    for (let i = 40; i <= 230; i++) {

        datalist3.insertAdjacentHTML('beforeend',
            `<option value="${i}">`);
    }

}


addChol();