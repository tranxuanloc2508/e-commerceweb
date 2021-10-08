/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function generateColor(){
    let r = parseInt(Math.random()*255);
    let g = parseInt(Math.random()*255);
    let b = parseInt(Math.random()*255);
    return `rgb(${r},${g},${b})`
}
function cateChart(id, cateLabel=[], cateInfo=[]){
    let colors =[]
    for (var i = 0; i < cateInfo.length; i++) {
        colors.push(generateColor())
    }
  
    const data = {
        labels: cateLabel,
        datasets: [{
                label: 'THONG KE',
                data: cateInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };
    
    const config = {
        type: 'doughnut',
        data: data,
    };
    let c = document.getElementById(id).getContext("2d")
    new Chart(c,config)
}
function productChart(id, productLabel=[], productInfo=[]){
    let colors =[]
    for (var i = 0; i < productInfo.length; i++) {
        colors.push(generateColor())
    }
  
    const data = {
        labels: productLabel,
        datasets: [{
                label: 'THONG KE',
                data: productInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };
    
    const config = {
        type: 'line',
        data: data,
    };
    let c = document.getElementById(id).getContext("2d")
    new Chart(c,config)
}