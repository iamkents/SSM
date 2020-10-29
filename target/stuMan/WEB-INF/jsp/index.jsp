<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<%=request.getContextPath()%>/statics/js/jquery-3.5.1.min.js"></script>

</head>
<body>

<h2>插入</h2>
<form method="post" action="${pageContext.request.contextPath}/saveUser">
    <input name="id" value="0" id="id" style="display:none" />
    <table>
        <tr><td>用户名：</td><td><input name="userName" id="userName"/></td></tr>
        <tr><td>密码：</td><td><input name="userPassword" id="userPassword"/></td></tr>
        <tr><td><button type="submit">提交</button> </td><td><button type="reset">重置</button> </td></tr>
    </table>
</form>
<hr/>
<h2>查询</h2>
<table>
    <tr><td>用户名：</td><td><input id="tag_userName"/></td><td><button type="button" onclick="listUserByUserName()">查询</button> </td></tr>
</table>
<hr/>
<h2>列表</h2>
<table cellspacing="30px">
    <thead><tr><td>id</td><td>用户名</td><td>密码</td><td>操作</td></tr></thead>
    <tbody id="list">

    </tbody>
</table>
<script>
    $( listUsers());

    //列出所有用户
    function listUsers() {
        $.post("<%=request.getContextPath()%>/user/listUsers",function (msg) {
            var data = JSON.parse(msg);
            var content = '';
            for(var i = 0;i<data.length;i++){
                content+= "<tr><td>"+data[i].sid+"</td><td>"+data[i].username+"</td><td>"+data[i].password+"</td>"
                    +"<td><a href='javascript:void(0)' onclick=updateUser('"+data[i].sid+"','"+data[i].username+"','"+data[i].password+"')>编辑</a></td>"
                    +"<td><a href='${pageContext.request.contextPath}/removeUserById?id="+data[i].sid+"'>删除</a></td></tr>";
            }
            $("#list").append(content);
        });
    };

    //编辑用户
    function updateUser(id,userName,userPassword){
        $("#id").val(id);
        $("#userName").val(userName);
        $("#userPassword").val(userPassword);
    }

    //查询用户
    function listUserByUserName(){
        $.post("${pageContext.request.contextPath}/listUserByUserName",{userName:$("#tag_userName").val()},function (msg) {
            var data = JSON.parse(msg);
            var content = '';
            $("#list").html('');
            for(var i = 0;i<data.length;i++){
                content+= "<tr><td>"+data[i].id+"</td><td>"+data[i].userName+"</td><td>"+data[i].userPassword+"</td>"
                    +"<td><a href='javascript:void(0)' onclick=updateUser('"+data[i].id+"','"+data[i].userName+"','"+data[i].userPassword+"')>编辑</a></td>"
                    +"<td><a href='${pageContext.request.contextPath}/removeUserById?id="+data[i].id+"'>删除</a></td></tr>";
            }
            $("#list").append(content);
        });
    }
</script>
</body>
</html>
