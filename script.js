var btn = document.getElementById("btn");
var chip = document.getElementById("chip");
var Chip_order = document.getElementById("Chip_order");

btn.addEventListener("click", function(){
    Chip_order.innerHTML=Chip_order.innerHTML+chip.innerHTML
})