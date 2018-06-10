<%--
  Created by IntelliJ IDEA.
  User: 74355
  Date: 2018/6/2
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="bootstrap-fileinput/css/fileinput.css"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <title>tea</title>
</head>
<body style="height: 100%; margin: 0">
<div style="background: linear-gradient(#666666,white) ">
<h4 style="text-align: center">model1</h4>
<form id="doupload" enctype="multipart/form-data">
    train_data<input type="file" name="train_data" class="file input-id">
    train_label<input type="file" name="train_label">
    text_data<input type="file" name="text_data">
    text_label<input type="file" name="text_label">
    <input type="button" value="上传" onclick="doUpLoad()" />
</form>
<div id="result" style="text-align: center"></div>
<div id="handsontable-code"  style=" text-align: center; overflow-y:auto; overflow-x:auto;  width:1500px; height:600px;">
    <p >未导入数据</p>
</div>
</div>
<div id="buttons2"></div>
<div id="buttons"></div>
<div id="container" style="height: 80%"></div>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/jquery/jquery-1.10.2.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/handsontable/handsontable.full.js"></script>
<link rel="stylesheet" media="screen" href="http://handsontable.github.io/handsontable-ruleJS/lib/handsontable/handsontable.full.css">
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/lodash/lodash.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/underscore.string/underscore.string.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/moment/moment.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/numeral/numeral.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/numericjs/numeric.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/js-md5/md5.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/jstat/jstat.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/formulajs/formula.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/js/parser.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/js/ruleJS.js"></script>
<script src="http://handsontable.github.io/handsontable-ruleJS/lib/handsontable/handsontable.formula.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap-fileinput/js/fileinput.js"></script>


<script type="text/javascript">

    $(".input-id").fileinput({
        language : 'zh',// 设置语言
        uploadUrl : 'files_upload/'+JSON.stringify(params), // 上传的地址ZF
        allowedPreviewTypes: ['image'],
        allowedFileExtensions : [ 'xls', 'xlsx', 'doc', 'docx', 'pdf', 'txt',"pptx",'ppt','zip','rar' ],// 接收的文件后缀
        maxFileCount : 10, // 文件数量
        maxFileSize : 100000,
        showUpload : true, // 是否显示上传按钮
        // showCaption : true,// 是否显示标题
        browseClass : "btn btn-sm btn-primary",
        removeClass : "btn btn-sm btn-default",
        uploadClass : "btn btn-sm btn-default",// 按钮样式
        dropZoneEnabled : false,// 是否显示拖拽区域
        enctype : 'multipart/form-data',
        slugCallback : function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    // 上传完成后数据处理
    var fileId = new Array();
    $(".input-id").on("fileuploaded", function(event, data, previewId, index) {
        fileId.push(JSON.stringify(data.response));
        //console.log(data.response)
        //alert(fileDir.toString())
        $('#fileId').val(fileId.toString());
    });



    function third() {
        var $container = $("#handsontable-code");
        var handsontable = $container.data('handsontable');
        var data = handsontable.getData();
        $.ajax({
            url:'dxx',
            type:'post',
            contentType: false,
            processData: false,
            dataType:'json',
            data:{"data":data},
            success:function (result) {
                alert(result)
            }
        })
    }
</script>
<script type="text/javascript">
    function second() {
        $.ajax({
            url:'bxx',
            type:'post',
            contentType: false,
            processData: false,
            dataType:'json',
            success:function (result) {
                var dom = document.getElementById("container");

                var myChart = echarts.init(dom);

                option = null;
                option = {
                    title: {
                        text: 'test_data'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type:'category',
                        data:result[0]
                    },
                    yAxis: {

                    },
                    series: [
                    ]
                };
                option.series=new Array();
                var i;
                for (i=0;i<result.length-1;i++){
                    option.series[i] = new Object();
                    option.series[i].type = 'line';
                    option.series[i].stack = '样本' + i;
                    option.series[i].data = result[i+1];

                }
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }

            }
        })
    }
</script>
<script type="text/javascript">
    function first() {
        $.ajax({
            url:'cxx',
            type:'post',
            contentType: false,
            processData: false,
            dataType:'json',
            success:function (result) {
                var dom = document.getElementById("container");

                var myChart = echarts.init(dom);

                option = null;
                option = {
                    title: {
                        text: 'train_data'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type:'category',
                        data:result[0]
                    },
                    yAxis: {

                    },
                    series: [
                    ]
                };
                option.series=new Array();
                var i;
                for (i=0;i<result.length-1;i++){
                    option.series[i] = new Object();
                    option.series[i].type = 'line';
                    option.series[i].stack = '样本' + i;
                    option.series[i].data = result[i+1];

                }
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }

            }
        })
    }
</script>
<script type="text/javascript">
    function doUpLoad() {
        var formData = new FormData($("#doupload")[0])
        $.ajax({
            url:'axx',
            type:'post',
            contentType: false,
            processData: false,
            dataType:'json',
            data:formData,
            success:function (result) {
                function negativeValueRenderer(instance, td, row, col, prop, value, cellProperties) {
                    Handsontable.renderers.TextRenderer.apply(this, arguments);
                }

                //类似excel进行拖放，公式会变
                var container1 = $('#handsontable-code');
                container1.empty();
                Handsontable.renderers.registerRenderer('negativeValueRenderer', negativeValueRenderer);
                container1.handsontable({
                    data: result[2],
                    minSpareRows: 1,
                    colHeaders: true,
                    rowHeaders: true,
                    contextMenu: true,
                    manualColumnResize: true,
                    formulas: true,
                    cells: function (row, col, prop) {
                        var cellProperties = {};
                        var escaped = Handsontable.helper.stringify(this.instance.getData()[row][col]);
                        if (escaped.indexOf('return')===0) {
                            cellProperties.renderer = "negativeValueRenderer";
                        }
                        return cellProperties;
                    }
                });


                var r=$("#result");
                r.append("Result:"+result[1]);

                var dom = document.getElementById("container");

                var myChart = echarts.init(dom);

                option = null;
                option = {
                    title: {
                        text: 'train_data'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type:'category',
                        data:result[0][0]
                    },
                    yAxis: {

                    },
                    series: [
                    ]
                };
                option.series=new Array();
                var i;
                for (i=0;i<result[0].length-1;i++){
                    option.series[i] = new Object();
                    option.series[i].type = 'line';
                    option.series[i].stack = '样本' + i;
                    option.series[i].data = result[0][i+1];

                }
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
                var b=$("#buttons");
                b.append("<button onclick=\"first()\">train_data</button>\n" +
                    "<button onclick=\"second()\">test_data</button>")

                var b2=$("#buttons2");
                b2.append("<button onclick=\"third()\">update</button>")
            }
        })
    }
</script>

</body>
</html>
