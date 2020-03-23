<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>芦苇博客</title>
    <link rel="stylesheet" type="text/css" href="${base}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/nprogress.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="${base}/images/icon/icon.png">
    <link rel="shortcut icon" href="${base}/images/icon/favicon.ico">
    <script src="${base}/js/jquery-2.1.4.min.js"></script>
    <script src="${base}/js/nprogress.js"></script>
    <script src="${base}/js/jquery.lazyload.min.js"></script>
    <!--[if gte IE 9]>
    <script src="${base}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${base}/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="${base}/js/respond.min.js" type="text/javascript"></script>
    <script src="${base}/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->


    <link rel="stylesheet" href="${base}/css/yzm.css">
    <script type="text/javascript" src="${base}/js/yzm.js"></script>

    <script src="${base}/ueditor/ueditor.config.js"></script>

    <script src="${base}/ueditor/ueditor.all.min.js"></script>

    <script src="${base}/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body class="user-select">
<#if "${(userInfo.username)!}"=="">
<script>
    var pathname = window.location.pathname;
    if(pathname.indexOf("Center") >0 || pathname.indexOf("Modify") >0 || pathname.indexOf("notice") >0 ||
            pathname.indexOf("update") >0 || pathname.indexOf("delte")>0 || pathname.indexOf("add")>0 || pathname.indexOf("listCategory")>0){
        window.location.href="/";
    }
</script>
</#if>
<header class="header">
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
                <ul class="site-nav topmenu">
                    <li><a href="tags.html">标签云</a></li>
                    <li><a href="readers.html" rel="nofollow">读者墙</a></li>
                    <li><a href="links.html" rel="nofollow">友情链接</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
                        <ul class="dropdown-menu header-topbar-dropdown-menu">
                            <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
                            <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
                            <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> RSS</a></li>
                        </ul>
                    </li>
                </ul>
                <#if "${(userInfo.username)!}" == "">
                    <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>
                    &nbsp;&nbsp;
                    <a href="/user/register" class="register" rel="nofollow">我要注册</a>&nbsp;&nbsp;
                    <a href="/backPassword" rel="nofollow">找回密码</a>
                <#else>
                    <a rel="nofollow" href="/user/userCenter">欢迎您 ${(userInfo.realName)!}&nbsp;&nbsp;&nbsp;&nbsp;${.now?string("yyyy-MM-dd")}</a>
                    <a rel="nofollow" href="/user/logout"> 注销 </a>
                </#if>
            </div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <h1 class="logo hvr-bounce-in"><a href="/" title=""><img src="${base}/images/logo.png" alt=""></a></h1>
            </div>
            <div class="collapse navbar-collapse" id="header-navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-index active"><a data-cont="芦苇.首页" href="/">芦苇.首页</a></li>
                    <li>
                        <a href="/blog/classifiedDisplay">全类展示</a>
                    </li>
                    <li><a href="/blog/classifiedByDev">业务开发</a></li>
                    <li><a href="/blog/classifiedByArc">架构之路</a></li>
                    <li><a href="/blog/classifiedByInt">人工智障</a></li>
                    <li>
                        <#if "${(userInfo.username)!}" == "">
                        <a href="javascript:alert('您还没登录，请点击左上进行登录！');" style="color: red;font-weight: bold;">
                            <span class="btn btn-danger">发布博客</span>
                        </a>
                        <#else>
                            <a href="/blog/postBlog" style="color: red;font-weight: bold;">
                                <span class="btn btn-danger">发布博客</span>
                            </a>
                        </#if>
                    </li>
                </ul>
                <form class="navbar-form visible-xs" action="/Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
                        <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
                </form>
            </div>
        </div>
    </nav>
</header>