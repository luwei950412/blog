<#include "../base/header.ftl" />

<section class="container">
    <div class="content-wrap">
        <div class="content">
            <header class="article-header">
                <h1 class="article-title"><a href="article.html">${(notice.title)!}</a></h1>
                <div class="article-meta"> <span class="item article-meta-time">
          <time class="time" data-toggle="tooltip" data-placement="bottom" title="时间：${(notice.createDate?string("yyyy-MM-dd HH:mm:ss"))!}">
              <i class="glyphicon glyphicon-time"></i> ${(notice.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</time>
          </span>
                    <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="来源：第一PHP社区">
      <i class="glyphicon glyphicon-globe"></i> 第一PHP社区</span>
                    <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="查看：120">
        <i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span>
                    <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="评论：0">
         <i class="glyphicon glyphicon-comment"></i> 0个不明物体</span> </div>
            </header>
            <article class="article-content">
                <#--<p><img data-original="${base}/blogimg/${(blog.filePath)!}" src="${base}/blogimg/${(blog.filePath)!}" alt="" /></p>-->
             ${(notice.content)!}
                <pre class="prettyprint lang-php">

                </pre>
            </article>
            <div class="article-tags">标签：<a href="" rel="tag">Notice</a></div>





        </div>
    </div>

</section>

<#include "../base/footer.ftl" />