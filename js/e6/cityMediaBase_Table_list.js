import { DTable } from 'DTable';
var provinces = ['','北京市','上海市','天津市','重庆市','河北省','山西省','内蒙古省','辽宁省','吉林省','黑龙江省','江苏省','浙江省','安徽省','福建省','江西省','山东省','河南省','湖北省','湖南省','广东省','广西省','海南省','四川省','贵州省','云南省','西藏省','陕西省','甘肃省','宁夏省','青海省','新疆省','香港','澳门','台湾'];
var citys = [[''],
    ["东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", "海淀区", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县"],
    ["黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "虹口区", "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"],
    ["和平区", "河东区", "河西区", "南开区", "河北区", "红桥区", "塘沽区", "汉沽区", "大港区", "东丽区", "西青区", "津南区", "北辰区", "武清区", "宝坻区", "宁河县", "静海县", "蓟县"],
    ["万州区", "涪陵区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "黔江区", "长寿区", "綦江县", "潼南县", "铜梁县", "大足县", "荣昌县", "璧山县", "梁平县", "城口县", "丰都县", "垫江县", "武隆县", "忠县", "开县", "云阳县", "奉节县", "巫山县", "巫溪县", "石柱土家族自治县", "秀山土家族苗族自治县", "酉阳土家族苗族自治县", "彭水苗族土家族自治县", "江津市", "合川市", "永川市", "南川市"],
    ["石家庄市","张家口市","承德市","秦皇岛市","唐山市","廊坊市","保定市","衡水市","沧州市","邢台市","邯郸市"],
    ["太原市","朔州市","大同市","阳泉市","长治市","晋城市","忻州市","晋中市","临汾市","吕梁市","运城市"],
    ["呼和浩特市","包头市","乌海市","赤峰市","通辽市","呼伦贝尔市","鄂尔多斯市","乌兰察布市","巴彦淖尔市","兴安盟","锡林郭勒盟","阿拉善盟"],
    ["沈阳市","朝阳市","阜新市","铁岭市","抚顺市","本溪市","辽阳市","鞍山市","丹东市","大连市","营口市","盘锦市","锦州市","葫芦岛市"],
    ["长春市","白城市","松原市","吉林市","四平市","辽源市","通化市","白山市","延边州"],
    ["哈尔滨市","齐齐哈尔市","七台河市","黑河市","大庆市","鹤岗市","伊春市","佳木斯市","双鸭山市","鸡西市","牡丹江市","绥化市","大兴安岭地区"],
    ["南京市","徐州市","连云港市","宿迁市","淮安市","盐城市","扬州市","泰州市","南通市","镇江市","常州市","无锡市","苏州市"],
    ["杭州市","湖州市","嘉兴市","舟山市","宁波市","绍兴市","衢州市","金华市","台州市","温州市","丽水市"],
    ["合肥市","宿州市","淮北市","亳州市","阜阳市","蚌埠市","淮南市","滁州市","马鞍山市","芜湖市","铜陵市","安庆市","黄山市","六安市","巢湖市","池州市","宣城市"],
    ["福州市","南平市","莆田市","三明市","泉州市","厦门市","漳州市","龙岩市","宁德市"],
    ["南昌市","九江市","景德镇市","鹰潭市","新余市","萍乡市","赣州市","上饶市","抚州市","宜春市","吉安市"],
    ["济南市","青岛市","聊城市","德州市","东营市","淄博市","潍坊市","烟台市","威海市","日照市","临沂市","枣庄市","济宁市","泰安市","莱芜市","滨州市","菏泽市"],
    ["郑州市","开封市","三门峡市","洛阳市","焦作市","新乡市","鹤壁市","安阳市","濮阳市","商丘市","许昌市","漯河市","平顶山市","南阳市","信阳市","周口市","驻马店市","济源市"],
    ["武汉市","十堰市","襄樊市","荆门市","孝感市","黄冈市","鄂州市","黄石市","咸宁市","荆州市","宜昌市","随州市","省直辖县级行政单位","恩施州"],
    ["长沙市","张家界市","常德市","益阳市","岳阳市","株洲市","湘潭市","衡阳市","郴州市","永州市","邵阳市","怀化市","娄底市","湘西州"],
    ["广州市","深圳市","清远市","韶关市","河源市","梅州市","潮州市","汕头市","揭阳市","汕尾市","惠州市","东莞市","珠海市","中山市","江门市","佛山市","肇庆市","云浮市","阳江市","茂名市","湛江市"],
    ["南宁市","桂林市","柳州市","梧州市","贵港市","玉林市","钦州市","北海市","防城港市","崇左市","百色市","河池市","来宾市","贺州市"],
    ["海口市","三亚市","省直辖县级行政单位"],
    ["成都市","广元市","绵阳市","德阳市","南充市","广安市","遂宁市","内江市","乐山市","自贡市","泸州市","宜宾市","攀枝花市","巴中市","达州市","资阳市","眉山市","雅安市","阿坝州","甘孜州","凉山州"],
    ["贵阳市","六盘水市","遵义市","安顺市","毕节地区","铜仁地区","黔东南州","黔南州","黔西南州"],
    ["昆明市","曲靖市","玉溪市","保山市","昭通市","丽江市","思茅市","临沧市","德宏州","怒江州","迪庆州","大理州","楚雄州","红河州","文山州","西双版纳州"],
    ["拉萨市","那曲地区","昌都地区","林芝地区","山南地区","日喀则地区","阿里地区"],
    ["西安市","延安市","铜川市","渭南市","咸阳市","宝鸡市","汉中市","榆林市","安康市","商洛市"],
    ["兰州市","嘉峪关市","白银市","天水市","武威市","酒泉市","张掖市","庆阳市","平凉市","定西市","陇南市","临夏州","甘南州"],
    ["西宁市","海东地区","海北州","海南州","黄南州","果洛州","玉树州","海西州"],
    ["银川市","石嘴山市","吴忠市","固原市","中卫市"],
    ["乌鲁木齐市","克拉玛依市","自治区直辖县级行政单位","喀什地区","阿克苏地区","和田地区","吐鲁番地区","哈密地区","克孜勒苏柯州","博尔塔拉州","昌吉州","巴音郭楞州","伊犁州","塔城地区","阿勒泰地区"],
    ["香港"],
    ["澳门"],
    ["台北市","高雄市","台中市","花莲市","基隆市","嘉义市","金门市","连江市","苗栗市","南投市","澎湖市","屏东市","台东市","台南市","桃园市","新竹市","宜兰市","云林市","彰化市"]];
    $(function () {
        setTimeout(function() {
            initIndex();
        }, 1500);
        
    })

    	var tooblar = "\n <div>\n  \t     <span>\u5730\u533A&nbsp;&nbsp;</span>\n\t\t <span><select id=\"a2_s_s\"> <option value=\"\">请选择</option></select></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u53BF\uFF08\u5E02\uFF09&nbsp;&nbsp;</span>\n\t\t <span><select id=\"a3_s_s\"> <option value=\"\">请选择</option></select></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>GDP(\u767E\u4E07\u5143) &nbsp;&nbsp;</span>\n\t\t <span><input id=\"a4_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u53BF\u57DF\u4EBA\u53E3\uFF08\u4E07\u4EBA\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a5_i_i\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u8986\u76D6\u4E61\u9547&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a6_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8FD0\u7BA1\u6240 \u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a7_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u662F\u5426\u6709\u5408\u4F5C&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a8_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u60C5\u51B5&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a9_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u5A92\u4F53\u7C7B\u578B&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a10_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u516C\u4EA4\u516C\u53F8&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a11_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a12_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u804C\u4F4D&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a13_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a14_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u624B\u673A\uFF0F\u5C0F\u7075\u901A&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a15_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u4F20\u771F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a16_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5176\u5B83\u8054\u7CFB\u65B9\u5F0F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a17_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u4EE3\u7406\u516C\u53F8&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a18_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a19_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u804C\u4F4D&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a20_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a21_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\"  >\u6240\u6709</option>\n\t\t <option value=\"0\" selected=\"selected\">\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
		/**
  let line_emun = {
     "1":"媒介发起", 
  "2":"总监确认",
  "3":"媒介发放",
  "50":"流程结束"
     };*/
		var fromValue = $("#fromValue").val();
		var coluns = [{
			"data": "id",
			"render": function render(data, type, row, meta) {
				var f = $('#fromValue').val();
				f = f == 'list' ? '查看' : '处理';
				var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaBase_Table','cityMediaBase_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
				// if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
				c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + '&f=cityMediaBase_Table\',\'cityMediaBase_edit\');"><font color="green"><B>\u7F16\u8F91</B></font></a>';

				c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + '\',\'table\',\'R1_base\');"><font color="green"><B>\u5220\u9664</B></font></a>';
				// }
				return c;
			}
		},
		/** { "data": "task_ss","render": (data, type, row, meta) => {
       let f = data[0];
       return line_emun[f];
   } },*/
		{ "data": "a2_s" }, { "data": "a3_s" }, { "data": "a4_s" }, { "data": "a5_i" }, { "data": "a6_s" }, { "data": "a7_s" }, { "data": "a8_s" }, { "data": "a9_s" }, { "data": "a10_s" }, { "data": "a11_s" }, { "data": "a12_s" }, { "data": "a13_s" }, { "data": "a14_s" }, { "data": "a15_s" }, { "data": "a16_s" }, { "data": "a17_s" }, { "data": "a18_s" }, { "data": "a19_s" }, { "data": "a20_s" }, { "data": "a21_s" }, { "data": "a22_s" }, { "data": "a23_s" }, { "data": "a24_s" }, { "data": "a25_s" }, { "data": "a26_s" }, { "data": "a27_s" }, { "data": "a28_s" }, { "data": "a29_s" }, { "data": "a30_d" }, { "data": "a31_s" }, { "data": "a32_d" }, { "data": "a33_s" }, { "data": "a34_s" }, { "data": "a35_s" }, { "data": "a39_s" }, { "data": "a40_s" }, { "data": "a41_s" }, { "data": "a42_dt", "format": "yyyy-MM-dd" }];

		var ajaxCallback = function ajaxCallback(json) {
			return json.content;
		};

		var ta = new DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

		}).preAjaxReduce(ajaxCallback).withAjax("R1_base", function () {
			//filter
			var st = $('#st').val();
			return {
				"filter[task_ss_ss]": st == 'Y' ? 50 : '',
				"filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
				"filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

				"filter[a2_s_s]": $('#a2_s_s').val(),
				"filter[a3_s_s]": $('#a3_s_s').val(),
				"filter[a4_s_s]": $('#a4_s_s').val(),
				"filter[a5_i_i]": $('#a5_i_i').val(),
				"filter[a6_s_s]": $('#a6_s_s').val(),
				"filter[a7_s_s]": $('#a7_s_s').val(),
				"filter[a8_s_s]": $('#a8_s_s').val(),
				"filter[a9_s_s]": $('#a9_s_s').val(),
				"filter[a10_s_s]": $('#a10_s_s').val(),
				"filter[a11_s_s]": $('#a11_s_s').val(),
				"filter[a12_s_s]": $('#a12_s_s').val(),
				"filter[a13_s_s]": $('#a13_s_s').val(),
				"filter[a14_s_s]": $('#a14_s_s').val(),
				"filter[a15_s_s]": $('#a15_s_s').val(),
				"filter[a16_s_s]": $('#a16_s_s').val(),
				"filter[a17_s_s]": $('#a17_s_s').val(),
				"filter[a18_s_s]": $('#a18_s_s').val(),
				"filter[a19_s_s]": $('#a19_s_s').val(),
				"filter[a20_s_s]": $('#a20_s_s').val(),
				"filter[a21_s_s]": $('#a21_s_s').val()

			};
		}).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

		ta.withInitComplete(function () {
			//set initcomplete
			$('#a2_s_s').change(function () {
                if($("#a2_s_s").val()==''){
                    $('#a3_s_s').val('')
                } 
				ta.fndraw();
			});
			$('#a3_s_s').change(function () {
				ta.fndraw();
			});
			$('#a4_s_s').change(function () {
				ta.fndraw();
			});
			$('#a5_i_i').change(function () {
				ta.fndraw();
			});
			$('#a6_s_s').change(function () {
				ta.fndraw();
			});
			$('#a7_s_s').change(function () {
				ta.fndraw();
			});
			$('#a8_s_s').change(function () {
				ta.fndraw();
			});
			$('#a9_s_s').change(function () {
				ta.fndraw();
			});
			$('#a10_s_s').change(function () {
				ta.fndraw();
			});
			$('#a11_s_s').change(function () {
				ta.fndraw();
			});
			$('#a12_s_s').change(function () {
				ta.fndraw();
			});
			$('#a13_s_s').change(function () {
				ta.fndraw();
			});
			$('#a14_s_s').change(function () {
				ta.fndraw();
			});
			$('#a15_s_s').change(function () {
				ta.fndraw();
			});
			$('#a16_s_s').change(function () {
				ta.fndraw();
			});
			$('#a17_s_s').change(function () {
				ta.fndraw();
			});
			$('#a18_s_s').change(function () {
				ta.fndraw();
			});
			$('#a19_s_s').change(function () {
				ta.fndraw();
			});
			$('#a20_s_s').change(function () {
				ta.fndraw();
			});
			$('#a21_s_s').change(function () {
				ta.fndraw();
			});
			$('#isdelete_i_i').change(function () {
				ta.fndraw();
			});
		}).draw();

		// this file is generator by tools

		//default sort 2 ,notsort-field 1,6
	
        function initIndex(){
            // 注意这里是要通过 id 获取元素，而不是通过 class 获取
            var province = document.getElementById('a2_s_s');
            //给选择框一个高度，可直接写进数据，不然要先创建dom元素option再录值
            try{
            province.length=provinces.length;
            for(var i=1;i<provinces.length;i++){
                province.options[i].text=provinces[i];
                province.options[i].value=provinces[i];
            }
            }catch(e){} 
        }
        $(document).on("change","#a2_s_s",function(){
            var province = document.getElementById("a2_s_s");
            var num = province.selectedIndex; // 选中option索引
            var city = document.getElementById('a3_s_s');
            var citystemp=citys[num];
            try{
            city.length=citystemp.length;
            for(var i=1;i<citystemp.length;i++){
                city.options[i].text=citystemp[i];
                city.options[i].value=citystemp[i];
            }
            city.options[0].selected=true;
            }catch(e){} 
        });


