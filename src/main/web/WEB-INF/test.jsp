<%--
  Created by IntelliJ IDEA.
  User: 74355
  Date: 2018/6/9
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
    <div id="handsontable-code"></div>
    <button onclick="get1()">get</button>
    <script type="text/javascript">
        function get1() {
            var $container = $("#handsontable-code");
            var handsontable = $container.data('handsontable');
            var data = handsontable.getData();
            alert(data[0][0])
        }
    </script>
    <script type="text/javascript">
               $(document).ready(function () {

               var data1 = [
                     [1,2,3,4,5,6],
                     [2009, 0, 2941, 4303, 354, 5814],
                     [2010, 5, 2905, 2867,1,2],
                     [2011, 4, 2517, 4822, 552, 6127],
                     [2012,1,2,3, 12, 4151]
                   ];

                        function negativeValueRenderer(instance, td, row, col, prop, value, cellProperties) {
                                Handsontable.renderers.TextRenderer.apply(this, arguments);
                            }

               //类似excel进行拖放，公式会变
               var container1 = $('#handsontable-code');
               Handsontable.renderers.registerRenderer('negativeValueRenderer', negativeValueRenderer);
               container1.handsontable({
                     data: data1,
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

             });

            </script>
</body>
</html>
