$(function () {
    $("#user-info").on("click",function(){
        var id = $(this).data("id");
        var index = parent.layui.layer.open({
            type : 2,
            title : "<i class='fa fa-user-plus'></i>用户详细",
            content : ctx + '/sys/user/detail/'+id,
            area : [ '90%', '90%' ],
            maxmin : true
        });
    });
    $("#user-login-history").on("click",function(){
        var id = $(this).data("id");
        var index = parent.layui.layer.open({
            type : 2,
            title : "<i class='fa fa-user-plus'></i>用户登录历史",
            content : ctx + '/sys/loginhistory/list?id='+id,
            area : [ '90%', '90%' ],
            maxmin : true
        });
    });
    $("#userPwd").on("click",function(){
    
    });
});