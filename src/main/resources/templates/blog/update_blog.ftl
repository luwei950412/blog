<#include "../base/header.ftl" />
<link href="${base}/css/bootstrap-select.min.css" rel="stylesheet">
<script type="text/javascript">
    /**创建ue对象*/
    var ue = UE.getEditor('editor');
    ue.ready(function () {

    });
</script>
<section class="container container-page" style="padding-left: 0px;">
    <div class="content">
        <header class="article-header">
            <h1 class="article-title">修改博文</h1>
        </header>
        <div class="readers">
            <div class="row">
                <div id="content" class="col-sm-12">
                    <form action="/blog/updateBlog" id="registerWindowForm" method="post"
                          enctype="multipart/form-data"
                          class="form-horizontal account-register clearfix">
                        <fieldset id="account">
                            <legend>博客基本信息</legend>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">博客标题</label>
                                <div class="col-sm-10">
                                    <input type="hidden" name="id" value="${(blog.id)!}" />
                                    <input type="text" name="title" value="${(blog.title)!}"
                                           placeholder="输入博客标题" id="title" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">标签</label>
                                <div class="col-sm-10">
                                    <select id="id_select" class="selectpicker" name="tag" data-live-search="true">
                                        <option>请选择标签</option>
                                        <#list categoryList as category>
                                            <#if blog.tag == category.name>
                                            <option selected="selected">${(category.name)!}</option>
                                            <#else>
                                                <option>${(category.name)!}</option>
                                            </#if>

                                        </#list>
                                    </select>
                                    <#--<input type="text" name="tag" value="${(blog.tag)!}"-->
                                           <#--placeholder="输入博客标签" id="tag" class="form-control">-->
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">博客内容</label>
                                <div class="col-sm-10">
                                    <script id="editor" type="text/plain" name="content" style="width:100%;height:800px;">${(blog.content)!}</script>
                                </div>
                            </div>
                            <#--<div class="form-group required">-->
                                <#--<label class="col-sm-2 control-label" for="input-email">博客封面</label>-->
                                <#--<div class="col-sm-10">-->
                                    <#--<input type="file" name="filePath" id="filePath" class="form-control"/>-->
                                <#--</div>-->
                            <#--</div>-->
                        </fieldset>
                        <fieldset>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-email">博客封面</label>
                                <div class="col-sm-5" style="text-align: center">
                                    <img src="${base}/blogimg/${(blog.filePath)!}" width="120px" height="120px"
                                         style="border-radius: 40%" alt="">
                                </div>
                                <div class="col-sm-5" style="margin-top: 30px;">
                                    <input type="file" name="filePath"
                                           placeholder="filePath" id="filePath" class="form-control">
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
                                        <script src="${base}/js/bootstrap-select.min.js"></script>
