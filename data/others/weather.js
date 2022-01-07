//京都府の今日の天気を取得
var url = "https://www.jma.go.jp/bosai/forecast/data/forecast/260000.json"

fetch(url)
    .then(function(response){
        return response.json();
    })
    .then(function(weather){
        area = weather[0].timeSeries[0].areas[0];
        //ゲーム変数はTYRANO.kag.stat.f["変数名"]に代入すればいい
        TYRANO.kag.stat.f["weather"] = area.weathers[0];
        //tfやsfはTYRANO.kag.variable.のあとに["変数名"]で代入する
    });
