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
            <h2><stong>恭喜你，你填写的基本信息已验证通过，验证邮件已经发送到您填写的邮箱，请进入到您的有限点击验证。</stong></h2>
            <br/>
            <p>【主题为：芦苇的博客--用户注册邮箱验证】</p>
            <div>
                <div class="float-left"> <img src="${base}/images/404/left.gif" alt="" />
                    <div class="alert"> 找不到邮件，别忘了查看垃圾邮件奥！ </div>
                </div>
                <div class="float-right"> <img src="${base}/images/404/right.png" width="260" class="hidden-xs" alt="" /> </div>
            </div>
            <div class="padding-big">
                <a href="/" class="btn btn-default">返回首页</a>
            </div>
        </div>
    </div>
</section>

<#include "./footer.ftl" />