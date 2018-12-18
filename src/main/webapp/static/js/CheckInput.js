function checkLoginAndRegister()
{
    if(document.getElementById("username").value=='')
    {
        alert("登录名不能为空");
        return false;
    }
    if(document.getElementById("password").value=='')
    {
        alert("密码不能为空");
        return false;
    }
    var objs=document.getElementsByName('role');
    var isSel=false;//判断是否有选中项，默认为无
    for(var i=0;i<objs.length;i++)
    {
        if(objs[i].checked==true)
        {
            isSel=true;
            break;
        }
    }
    if(isSel==false)
    {
        alert("请选择角色！");
        return false;
    }
    if(document.getElementById("name").value=='')
    {
        alert("姓名不能为空");
        return false;
    }
    var objs1=document.getElementsByName('sex');
    var isSel1=false;//判断是否有选中项，默认为无
    for(var i=0;i<objs.length;i++)
    {
        if(objs1[i].checked==true)
        {
            isSel1=true;
            break;
        }
    }
    if(isSel1==false)
    {
        alert("请选择性别！");
        return false;
    }
    if(document.getElementById("phone").value=='')
    {
        alert("电话号码不能为空");
        return false;
    }
    if(document.getElementById("email").value=='')
    {
        alert("电子邮箱不能为空");
        return false;
    }
    return true;
}
