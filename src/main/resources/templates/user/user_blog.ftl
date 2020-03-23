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
        <ul class="breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="#">2013</a></li>
            <li class="active">十一月</li>
        </ul>
        <header class="article-header" style="text-align: right">
            <button onclick="window.location.href='/blog/postBlog'" class="btn btn-success">
                发博客
            </button>
        </header>
        <div class="readers1">
            <div class="content-wrap">
                <div class="content">
                    <#assign count =0 />
                    <#list blogList as blog>
                    <#assign count = count +1 />
                        <article class="excerpt excerpt-${(count)!}">
                            <#--<a class="focus" href="/blog/showBlog?id=${(blog.id)!}" title="">-->
                                <#--<img class="thumb" height="200px;" src="${base}/blogimg/${(blog.filePath)!}" alt="">-->
                            <#--</a>-->
                            <header>
                                <a class="cat" href="program">${(blog.tag)!}<i></i></a>
                                <h2><a href="/blog/showBlog?id=${(blog.id)!}" title="${(blog.title)!}">${(blog.title)!}</a></h2>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="window.location.href='/blog/updateBlog?id=${(blog.id)!}'" class="btn btn-primary btn-sm">
                                    修改博文
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a onclick="javascript:return p_del()" href="/blog/deleteBlog?id=${(blog.id)!}" class="btn btn-danger btn-sm">
                                    删除博文
                                </a>
                                <script language="javascript">
                                    function p_del() {
                                        var msg = "您真的确定要删除吗？\n\n请确认！";
                                        if (confirm(msg) == true) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    }
                                </script>
                            </header>
                            <p class="meta">
                                <time class="time"><i class="glyphicon glyphicon-time"></i> ${(blog.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</time>
                                <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span>
                                <a class="comment" href="#">
                                    <i class="glyphicon glyphicon-comment"></i> 0个评论
                                </a>
                            </p>
                            <p class="meta">
                                <#assign content="${(blog.content)!}"?replace("<.*?>","","r")>
                                <a href="/blog/showBlog?id=${(blog.id)!}">
                                <#if content?length gt 60>
                                    ${(content?html?substring(0,60))!}
                                <#else>
                                    ${(content?html)!}
                                </#if>
                                </a>
                                <#--可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，-->
                                <#--来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ...-->
                            </p>
                        </article>
                    </#list>


                    <#--<nav class="pagination" style="display: none;">-->
                        <#--<ul>-->
                            <#--<li class="prev-page"></li>-->
                            <#--<li class="active"><span>1</span></li>-->
                            <#--<li><a href="?page=2">2</a></li>-->
                            <#--<li class="next-page"><a href="?page=2">下一页</a></li>-->
                            <#--<li><span>共 2 页</span></li>-->
                        <#--</ul>-->
                    <#--</nav>-->
                </div>
            </div>

        </div>
    </div>
</section>

<#include "../base/footer.ftl" />
