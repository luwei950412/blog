<#include "../base/header.ftl">

<!-- Main Container  -->
<div class="main-container container" style="padding-bottom: 50px">
    <ul class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i></a></li>
        <li><a href="#">账户</a></li>
        <li><a href="#">注册</a></li>
    </ul>

    <div class="row">
        <div id="content" class="col-sm-12">
            <h2 class="title">用户注册</h2>
            <p>
                如果您有我们的帐户，请点击左上角登录.
            </p>
            <form action="" id="registerWindowForm" method="post"
                  enctype="multipart/form-data"
                  class="form-horizontal account-register clearfix">
                <fieldset id="account">
                    <legend>你的个人信息</legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" value=""
                                   placeholder="输入您的用户名" id="username" class="form-control">
                            <p style="font-size: 8px;color: red;">* 用户名只允许包含中文、英文、数字和下划线，长度：2-20字符！！</p>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname">真实姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="realName" value=""
                                   placeholder="输入您的真实姓名" id="realName" class="form-control">
                            <p style="font-size: 8px;color: red;">* 请输入真实姓名，便于大家认识你奥，只能包含汉字哟！！</p>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">E-mail</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value=""
                                   placeholder="Email" id="email" class="form-control">
                            <p style="font-size: 8px;color: red;">* 请输入真实邮箱，以便激活用户验证！！</p>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>你的密码</legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" value=""
                                   placeholder="密码" id="password" class="form-control">
                            <p style="font-size: 8px;color: red;">* 密码长度只允许在4-20之间！！</p>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-confirm">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="confirm" value="" placeholder="确认密码"
                                   id="confirm" class="form-control">

                        </div>
                    </div>
                </fieldset>

                <div class="buttons">
                    <div class="pull-right">
                        我已阅读并同意 <input class="box-checkbox" type="checkbox" name="agree"
                                       value="1"> &nbsp; <input type="button"
                                                                onclick="memberRegister()" value="注册" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- //Main Container -->

<#include "../base/footer.ftl">