<#import "../template/template.ftl" as frame> <#global menu="派出所管理">
<@frame.html title="派出所管理"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js"]
css=["js/jquery-ui/jquery-ui.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/uploadprogess.css","css/liselect/pkg-generator.css$ver=1431443489.css"]>

<script src="${rc.contextPath}/js/vue.min.js"></script>


<style type="text/css">
.operation
{
	color: #E0296C;
    font-weight: 800;
}
table.dataTable.display tbody td {
    word-break: break-all;
    white-space: normal;
    word-wrap: break-word;
}
div.dt-buttons{
      float: right !important;
      margin-top: -15px;
}
a.green{
    border: 0;
    font-size: 16px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    background: #ff9966;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    padding: 0 15px;
    text-decoration: none;
    font-weight: 600;
    letter-spacing: 2px;
    }
.ui-input {
    width: 180px;
}
</style>

<script type="text/javascript">
     
        var vm = new Vue({
            el : '#pMsg2',
            data :{
                policeSMsg:{}
            },
            method: {
                msg2:function(){
                    

                        console.log('进入程序1');
                     
                }
            }
        })

</script>


 
<div id="app">
 
    <div class="widthdrawBtBox">
        <a id="subutton" @click="greet" class="block-btn" value="">确认提交</a>
    </div>
   <button v-on:click="greet">Greet</button>
</div>



 
 

<script>

var vm2 = new Vue({
            el : '#app22',
            data :{
            },
            methods: {
                greet:function(){
                    

                        console.log('进入程序1');
                     
                }
            }
        })


var app2 = new Vue({
  el: '#app',
  data: {
    //name: {}
  },
  
  methods: {
    greet: function ( ) {
      
      alert('Hello ' + this.name + '!')
       
    }
  }
})


    var postData={"length":5000,"order[0][unitName_s_s]":'asc'};
                    var schList = queryByExampleV2(postData,"Unit");
                    console.log(schList);
                    if(isNotNull(schList) && isNotNull(schList.content) ){
                        var i =0 ;
                         $.each( schList.content, function(index, data){
                               

                              var postData = {
                              
                               selectByField:"id",
                               id:data.id, 
                               hyType_s :data.hyType_s.replace("industryindustry",'industry'),
                                checkUniq : "Y"
                            };
                            if(i==0){
                             console.log(postData)
                            //saveDataModel(postData, "Unit")
                            }
                           //i++;



                        });
                    }
 
 
</script>



  
</@frame.html>