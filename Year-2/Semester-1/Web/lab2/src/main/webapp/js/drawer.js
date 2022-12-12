var minColorVal = 80;
var maxColorVal = 200;

var r = minColorVal;
var g = minColorVal;
var b = minColorVal;

var isColorExpanding = true;

function getColor(){
    if (isColorExpanding) {
        if (r < maxColorVal) {r++;}
        else {
            if (g < maxColorVal) {g++;}
            else{
                if (b < maxColorVal) {b++;}
                else {isColorExpanding = false;}
            }
        }
    }
    else {
        if (b > minColorVal) {b--;}
        else {
            if (g > minColorVal) {g--;}
            else {
                if (r > minColorVal) {r--;}
                else {isColorExpanding = true;}
            }
        }
    }

    return "rgb(" + r + "," + g + "," + b + ")";
}
function getRadians(degrees){
    return (Math.PI / 180) * degrees;
}
function draw(){
    console.log("drawing..");
    //var cnv = document.querySelector("canvas");
    var cnv = $('canvas.map')[0];
    var ctx = cnv.getContext("2d");
    var color = getColor();
    var radius = 100;

    //circle
    ctx.arc(cnv.width / 2, cnv.height / 2, radius, 0, getRadians(360));
    ctx.fill();
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, cnv.width, cnv.height / 2);
    ctx.fillRect(0, 0, cnv.width / 2, cnv.height);

    //rect
    ctx.fillStyle = color;
    ctx.fillRect(cnv.width / 2 - radius / 2, cnv.height / 2, radius / 2, radius);

    //triangle
    ctx.beginPath();
    ctx.moveTo(cnv.width / 2 - radius / 2, cnv.height / 2);
    ctx.lineTo(cnv.width / 2, cnv.height / 2 - radius);
    ctx.lineTo(cnv.width / 2, cnv.height / 2);
    ctx.fill();
}
function animateGraph(){
    setInterval(draw, 3);
}
//animateGraph();
draw();
