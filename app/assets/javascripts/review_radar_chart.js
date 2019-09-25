var colorSet = {
    red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
}

var color = Chart.helpers.color;

var radarChartConfig ={
    type: "radar",// required
    data:{
        labels:["おすすめ度","価格","わかりやすさ","信頼度","おもしろさ"], // required
        datasets:[{ // required
            label:"testdata 1",
            backgroundColor: color(colorSet.blue).alpha(0.5).rgbString(),
			borderColor: colorSet.blue,
			pointBackgroundColor: colorSet.red,
            data: [0, 0, 0, 0, 0]
        }]
    },
    options:{
        showTooltips:false,
        legend:{
            display:false
        },
        title:{
            display:false
        },
        scale:{
            display:true,
            pointLabels:{
                fontSize:15,
                fontColor: colorSet.blue,
            },
            ticks:{
                display:true,
                fontSize:12,
                fontColor: colorSet.purple,
                min:0,
                max:5,
                beginAtZero:true,
            },
            gridLines:{
                display:true,
                color:colorSet.blue
            }
        },




    }
}

$(document).on('turbolinks:load',function(){
    var reviewDataset = $("#reviewDataset")
    if (reviewDataset[0]){
        var recommend = reviewDataset.attr("recommend")
        var price = reviewDataset.attr("price")
        var understandable = reviewDataset.attr("understandable")
        var trustable = reviewDataset.attr("trustable")
        var interesting = reviewDataset.attr("interesting")
        radarChartConfig.data.datasets[0].data = [
            recommend,price,understandable,trustable,interesting
        ]
        var reviewRadar = new Chart($("#reviewDistrib"),radarChartConfig);
    }
})
