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
            <h1 class="article-title">修改信息</h1>
        </header>
        <div class="readers">
            <div class="row">
                <div id="content" class="col-sm-12">
                    <form id="validateForm" method="post"
                          enctype="multipart/form-data"
                          class="form-horizontal account-register clearfix">
                        <fieldset id="account">
                            <legend>你的个人信息</legend>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" value="${(userInfo.username)!}"
                                           placeholder="输入您的用户名" id="username" readonly class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">新密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" id="password" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-email">再次输入密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="confirm" id="confirm" class="form-control">
                                </div>
                            </div>
                        </fieldset>



                        <div class="buttons">
                            <div class="pull-right">
                                <input type="button" onclick="updatepassword()" value="提交修改" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<#include "../base/footer.ftl" />
