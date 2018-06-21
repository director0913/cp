var _prefixURL={
    common:"assets/statics/images/common",
    statics:"assets/statics/images",
    plugins:"assets/js/plugins"
};
var _gameObj={};
try{
    _gameObj=gameObj;
}catch(e){
    _gameObj.HK6="tm";
    _gameObj.PLAY="";
    _gameObj.lotteryType="SSC";
}
requirejs.config({ //配置
    baseUrl: 'assets/js/application',
    paths: {
        jquery: '../plugins/jquery/jquery.min',
        jqueryui:'../plugins/jqueryui/jquery-ui.min',//jqui的拖拽插�?
        dialog:'../plugins/dialog/jquery.dialogUI',//弹窗和拖拽js
        layer: '../plugins/layer/layer.min',//弹窗
        scrollbar:'../plugins/scrollbar/jquery.mCustomScrollbar.concat.min',//滚动插件
        slide:'../plugins/slide/jquery.slide',//轮播
        user:'../plugins/user/user',
        common:'../plugins/common/common',
        main:'../plugins/common/main',//tab切换
        datePicker:'../plugins/datePicker/datePicker',//时间控件
        zclip:'../plugins/zclip/jquery.zclip',//复制
        laypage:'../plugins/laypage/laypage',//分页
        qrcode:'../plugins/qrcode/jquery.qrcode',
        qrutf:'../plugins/qrcode/utf',
        //以下为各个使用的js
        firstLOT:'../plugins/common/first'+_gameObj.lotteryType,//lottery的滑块和角分厘切�?
        elevenGame:'../plugins/elevenGame/elevenGame',//eleven特有插件
        game0:'../plugins/common/game0',
        game2:'../plugins/common/game2',
        game4:'../plugins/common/game4',
        templateLOT:'../plugins/common/template'+_gameObj.lotteryType,//模板，默认时时彩
        handlebars:'../plugins/sixlottery/handlebars',//模板引擎
        easyDrag:'../plugins/sixlottery/jquery.easyDrag',//拖拽
        sixlottery:'../plugins/sixlottery/sixlottery',
        sixbetHK6:'../plugins/sixlottery/sixbet-'+_gameObj.HK6,
        sixbet:'../plugins/sixlottery/sixbet',
        sixCom:'../plugins/sixlottery/six-com',

        lottery:'../plugins/lottery/lottery',
        betPLAY:'../plugins/lottery/' + _gameObj.lotteryType + '/bet-' + _gameObj.PLAY,
        bet:'../plugins/lottery/bet',
        betCom:'../plugins/lottery/bet-com'
    },
    urlArgs: "v=2.31",
    shim:{
        jqueryui:["jquery","css!../plugins/jqueryui/jquery-ui.min.css"],
        dialog:["jquery","css!../plugins/dialog/dialog.css"],
        layer:{
            deps:[
                "jquery",
                'css!../plugins/layer/skin/layer.css'
            ],
            exports:"layer"
        },
        scrollbar:["jquery","css!../plugins/scrollbar/jquery.mCustomScrollbar.css"],
        slide:["jquery"],
        user:["jquery",'css!../plugins/user/tip.css'],
        common:["jquery","dialog"],
        main:["jquery","scrollbar"],
        zclip:["jquery"],
        laypage:{
            deps:["jquery",'css!../plugins/laypage/laypage.css'],
            exports:"laypage"
        },
        qrcode:["jquery", "qrutf"],
        datePicker:["jquery",'css!../plugins/datePicker/datePicker.css'],
        //以下为各个使用的js
        firstLOT:["jquery"],
        elevenGame:["jquery"],
        game0:["jquery","jqueryui","common"],
        game2:["jquery","jqueryui","common"],
        game4:["jquery","jqueryui","common"],
        easyDrag:["jquery"],

        sixCom:["jquery"],
        sixlottery:["jquery","scrollbar","easyDrag"],
        sixbetHK6:["jquery","handlebars","sixCom"],
        sixbet:["jquery","handlebars","sixbetHK6"],

        lottery:["jquery","scrollbar","easyDrag"],
        betPLAY:["jquery","handlebars","betCom"],
        bet:["jquery", "betCom"]
    },
    map: {
        '*': {
            'css': '../require-css/css'
        }
    }
});
