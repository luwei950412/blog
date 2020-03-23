<#include "../base/header.ftl" />

<section class="container">
    <div class="content-wrap">
        <div class="content">
            <div class="title">
                <#--<h3>当前分类为：${(tag)!}</h3>-->
                <#--<br/><br/>-->
                <#--<p>其他类别：-->
                <#--<#list categoryList?sort_by("createDate")?reverse as category>-->
                    <#--<a href="/blog/classifiedDisplay?tag=${(category.name)!}">${(category.name)!}</a>/-->
                <#--</#list>-->
                <#--</p>-->
            </div>
            <#assign count = 0 />
            <#list blogList?sort_by("createDate")?reverse as blog>
                <#assign count= count +1 />
            <article class="excerpt excerpt-${(count)!}">
                <#--<a class="focus" href="/blog/showBlog?id=${(blog.id)!}" title="">-->
                    <#--<img class="thumb"  src="${base}/blogimg/${(blog.filePath)!}" alt="">-->
                <#--</a>-->
                <header><a class="cat" href="/blog/showBlog?id=${(blog.id)!}">${(blog.tag)!}<i></i></a>
                    <h2><a href="/blog/showBlog?id=${(blog.id)!}" title="">${(blog.title)!}</a></h2>
                </header>
                <p class="meta">
                    <time class="time"><i class="glyphicon glyphicon-time"></i> ${(blog.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</time>
                    <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span>
                    <a class="comment" href="/blog/showBlog?id=${(blog.id)!}"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
                <p class="note">
                    <#assign content="${(blog.content)!}"?replace("<.*?>","","r")>
                    <a href="/blog/showBlog?id=${(blog.id)!}">
                        <#if content?length gt 60>
                            ${(content?html?substring(0,60))!}
                        <#else>
                            ${(content?html)!}
                        </#if>
                    </a>
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
    <aside class="sidebar">
        <div class="fixed">
            <div class="widget widget_search">
                <form class="navbar-form" action="/Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
                        <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
                </form>
            </div>
            <div class="widget widget_sentence">
                <h3>每日一句</h3>
                <div class="widget-sentence-content">
                    <h4>${.now?string("yyyy年MM月dd日")}</h4>
                    <p>Do not let what you cannot do interfere with what you can do.<br />
                        别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
                </div>
            </div>
        </div>
        <div class="widget widget_hot">
            <h3>热门文章</h3>
            <ul>
                <#list blogList as blog>
                    <li>
                        <a href="/blog/showBlog?id=${(blog.id)!}">
                        <span class="thumbnail">
                            <img class="thumb" data-original="" src="${base}/blogimg/${(blog.filePath)!}" alt="">
                        </span>
                            <span class="text">${(blog.title)!}</span>
                            <span class="muted">
                            <i class="glyphicon glyphicon-time"></i>
                                ${(blog.createDate?string("yyyy-MM-dd"))!}
                        </span>
                            <span class="muted">
                            <i class="glyphicon glyphicon-eye-open"></i>
                            120
                        </span>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </aside>
</section>

<#include "../base/footer.ftl" />