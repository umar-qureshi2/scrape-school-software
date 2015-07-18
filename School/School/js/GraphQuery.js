function showGraph(str) {
    //alert(str);
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

            // document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            //                document.getElementById("txtHint").innerHTML = "call back";
            var chart;

            chartData = new Array();

            var m = 0;
            var arrValues;
            //                var chartData = new Array();
            var responseStr = xmlhttp.responseText;
            //var temp = responseStr.toString();
            var arrSplit = responseStr.split('$');

            for (m = 0; m < (arrSplit.length - 1); m++) {
                //                    document.write(arrSplit[m] + "<br>");
                arrValues = arrSplit[m].split('-');
                //                    document.write(arrValues.length);

                chartData[m] = { "Subjects": arrValues[0], "Percentage": arrValues[1] };

            }


            // SERIAL CHART
            chart = new AmCharts.AmSerialChart();
            chart.dataProvider = chartData;
            chart.categoryField = "Subjects";
            // the following two lines makes chart 3D
            chart.depth3D = 20;
            chart.angle = 30;

            // AXES
            // category
            var categoryAxis = chart.categoryAxis;
            categoryAxis.labelRotation = 90;
            categoryAxis.dashLength = 5;
            categoryAxis.gridPosition = "start";

            // value
            var valueAxis = new AmCharts.ValueAxis();
            valueAxis.title = "Percentage";
            valueAxis.dashLength = 5;
            chart.addValueAxis(valueAxis);

            // GRAPH            
            var graph = new AmCharts.AmGraph();
            graph.valueField = "Percentage";
            graph.colorField = "color";
            // graph.balloonText = "<span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>";
            graph.type = "column";
            graph.lineAlpha = 0;
            graph.fillAlphas = 1;
            chart.addGraph(graph);

            // CURSOR
            var chartCursor = new AmCharts.ChartCursor();
            chartCursor.cursorAlpha = 0;
            chartCursor.zoomable = false;
            chartCursor.categoryBalloonEnabled = false;
            chart.addChartCursor(chartCursor);

            // WRITE
            chart.write("chartdiv");

        }
    }
    xmlhttp.open("GET", "GetGraph.aspx?q=" + str, true);
    xmlhttp.send();
}