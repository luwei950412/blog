<#include "../base/header.ftl" />

<section class="container container-page">
    <div class="pageside">
        <div class="pagemenus">
            <ul class="pagemenu">
                <li><a href="/user/userCenter">基本信息</a></li>
                <li><a href="/user/userModifyPassword">修改密码</a></li>
                <li><a href="/user/userBlog">个人博客</a></li>
                <#if "${(userInfo.status)!}"=="99">
                    <li><a href="/notice/findAll/">站点通知</a></li>
                    <li><a href="/category/listCategory/">类别管理</a></li>
                </#if>
            </ul>
        </div>
    </div>
    <div class="content">
        <header class="article-header">
            <h1 class="article-title">基本信息</h1>
        </header>
        <div class="readers">
            <div class="row">
                <div id="content" class="col-sm-12">
                    <form action="/user/updateUser" id="registerWindowForm" method="post"
                          enctype="multipart/form-data"
                          class="form-horizontal account-register clearfix">
                        <fieldset id="account">
                            <legend>你的个人信息</legend>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" value="${(userInfo.username)!}"
                                           placeholder="输入您的用户名" id="username" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">真实姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="realName" value="${(userInfo.realName)!}"
                                           placeholder="输入您的真实姓名" id="realName" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-email">E-mail</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" value="${(userInfo.email)!}"
                                           placeholder="Email" id="email" class="form-control">
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>个性签名</legend>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-email">E-mail</label>
                                <div class="col-sm-10">
                                    <textarea name="sign" id="" cols="107" rows="5">${(userInfo.sign)!}</textarea>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>你的头像</legend>
                            <div class="form-group required">
                                <div class="col-sm-5" style="text-align: center">
                                    <img src="${base}/headimg/${(userInfo.headimg)!}" width="120px" height="120px"
                                         style="border-radius: 40%" alt="headimg">
                                </div>
                                <div class="col-sm-7" style="margin-top: 30px;">
                                    <input type="file" name="headimg"
                                           placeholder="headimg" id="headimg" class="form-control">
                                </div>
                            </div>
                        </fieldset>

                        <div class="buttons">
                            <div class="pull-right">
                                <input type="submit" value="提交修改" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<#include "../base/footer.ftl" />
