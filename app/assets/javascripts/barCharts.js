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


var barChartConfig ={
    type:"horizontalBar",
    data: {
        labels:["おすすめ度5","おすすめ度4","おすすめ度3","おすすめ度2","おすすめ度1"],
        datasets:[
            {
                label:"おすすめ度",
                backgroundColor:colorSet.purple
            }
        ]
    },
    options:{
        showtoolTips:false
    }
}


$(document).on("turbolinks:load",function(){
    
    var barChartCanvas = $("#reviewBarChart")
    if(barChartCanvas[0]){
        var barChartDataset = $("#barChartDataset")
        barChartConfig.data.datasets[0].data =recommendData
        var review_bar_chart = new Chart(barChartCanvas,barChartConfig)
    
        $(".tag").on("click",function(e){
            tags = $(".tag.for-barChart")
            for(var i=0;i<tags.length;i++){
                if(tags[i].classList.contains("is-info")){
                    tags[i].classList.remove("is-info")
                }
            }
            e.target.classList.add("is-info")
            
            if(e.target.id=="recommend"){
                barChartConfig.data.labels=["おすすめ度5","おすすめ度4","おすすめ度3","おすすめ度2","おすすめ度1"]
                barChartConfig.data.datasets[0].label="おすすめ度"
                barChartConfig.data.datasets[0].backgroundColor = colorSet.purple
                barChartConfig.data.datasets[0].data = recommendData
            }else if(e.target.id=="price"){
                barChartConfig.data.labels=["価格満足度5","価格満足度4","価格満足度3","価格満足度2","価格満足度1"]
                barChartConfig.data.datasets[0].label="価格"
                barChartConfig.data.datasets[0].backgroundColor = colorSet.green
                barChartConfig.data.datasets[0].data = priceData
            }else if(e.target.id=="understandable"){
                barChartConfig.data.labels=["わかりやすさ5","わかりやすさ4","わかりやすさ3","わかりやすさ2","わかりやすさ1"]
                barChartConfig.data.datasets[0].label="わかりやすさ"
                barChartConfig.data.datasets[0].backgroundColor=colorSet.yellow
                barChartConfig.data.datasets[0].data = understandableData
            }else if(e.target.id=="trustable"){
                barChartConfig.data.labels=["信頼度5","信頼度4","信頼度3","信頼度2","信頼度1"]
                barChartConfig.data.datasets[0].label="信頼度"
                barChartConfig.data.datasets[0].backgroundColor=colorSet.blue
                barChartConfig.data.datasets[0].data = trustableData
            }else if(e.target.id =="interesting"){
                barChartConfig.data.labels=["おもしろさ5","おもしろさ4","おもしろさ3","おもしろさ2","おもしろさ1"]
                barChartConfig.data.datasets[0].label="おもしろさ"
                barChartConfig.data.datasets[0].backgroundColor=colorSet.red
                barChartConfig.data.datasets[0].data = interestingData
            }
            review_bar_chart.update()
        })
    }

})