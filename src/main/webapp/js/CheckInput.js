function checkLoginAndRegister()
{
    if(document.getElementById("username").value=='')
    {
        alert("用户名不能为空");
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
    return true;
}
