
const down = document.getElementsByClassName('down');
const up = document.getElementsByClassName('up');
const btn = document.getElementsByClassName('btn');
const inner = document.getElementsByClassName('inner');
for(let i=0;i<btn.length;i++){
    btn[i].addEventListener("click",function(){
    down[i].classList.toggle("exit");
    up[i].classList.toggle("active");
    inner[i].classList.toggle("active");

  });
}

