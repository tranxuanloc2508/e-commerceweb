/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function generateColor(){
    let r =parseInt(Math.random()*255);
    let g =parseInt(Math.random()*255);
    let b =parseInt(Math.random()*255);
    
    return `rgb(${r}, ${g}, ${b})`
}

function cateChart(id,cateLabels=[], cateinfo =[]) {
    let colors = []
    for(let i = 0; i<cateinfo.length ; i++)
        colors.push(generateColor())
    
    const data = {
        labels: cateLabels,
        datasets:[{
                label: 'Thong ke san pham theo danh muc',
                data: cateinfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };
      

    const config = {
        type: 'doughnut',
        data: data,
    };
    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}

function productChart(id,productLabels=[], productinfo =[]){
    
     let colors = []
    for(let i = 0; i<productinfo.length ; i++)
        colors.push(generateColor())
    
    const data = {
        labels: productLabels,
        datasets:[{
                label: 'Thong ke doanh thu theo san pham',
                data: productinfo,
                backgroundColor: colors,
                    borderColor: 'rgb(75, 192, 192)',
                hoverOffset: 4
            }]
    };
      

    const config = {
        type: 'bar',
        data: data,
    };
    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}