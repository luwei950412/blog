<#include "./header.ftl" />
<style type="text/css">
    .panel{
        padding:80px 20px 0px;
        min-height:500px;
        cursor:default;
    }
    .text-center {
        margin:0 auto;
        text-align: center;
        border-radius:10px;
        max-width:900px;
        -moz-box-shadow: 0px 0px 5px rgba(0,0,0,.3);
        -webkit-box-shadow: 0px 0px 5px rgba(0,0,0,.3);
        box-shadow: 0px 0px 5px rgba(0,0,0,.1);

    }
    .float-left {
        float: left !important;
    }
    .float-right {
        float: right !important;
    }
    img {
        border: 0;
        vertical-align: bottom;
    }
    h2 {
        padding-top: 20px;
        font-size: 20px;
    }
    .padding-big {
        padding: 20px;
    }
    .alert {
        border-radius: 5px;
        padding: 15px;
        border: solid 1px #ddd;
        background-color: #f5f5f5;
    }
</style>
<section class="container">
    <div class="panel">
        <div class="text-center">
            <h2><stong>厉害呀！大兄弟，你的博客《${(blog.title)!}》发布成功</stong></h2>
            <br/>
            <p><img src="${base}/blogimg/${(blog.filePath)!}" width="500px" height="200px"/></p>
            <div>
                <div class="float-left"> <img src="${base}/images/404/left.gif" alt="" />
                    <div class="alert"> 卧槽！太强啦！ </div>
                </div>
                <div class="float-right"> <img src="${base}/images/404/right.png" width="260" class="hidden-xs" alt="" /> </div>
            </div>
            <div class="padding-big">
                <a href="/blog/showBlog?id=${(blog.id)!}" class="btn btn-primary">查看文章</a>
                <a href="/user/userBlog" class="btn btn-primary">管理博文</a>
                <a href="/" class="btn btn-default">返回首页</a>
            </div>
        </div>
    </div>
</section>

<#include "./footer.ftl" />