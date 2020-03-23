<#include "../base/header.ftl" />
<script type="text/javascript">
    UE.getEditor('editor_comment',{
        toolbars:[
            ['fullscreen', 'undo', 'redo', 'bold', 'italic',
                'underline','fontborder', 'backcolor', 'fontsize', 'fontfamily',
                'emotion']
        ]
    });
</script>
<section class="container">
    <div class="content-wrap">
        <div class="content" style="background-color: #fff;padding: 0 20px;border: 1px solid #EAEAEA;border-radius: 4px;">
            <header class="article-header">
                <h1 class="article-title"><a href="article.html">${(blog.title)!}</a></h1>
                <div class="article-meta"> <span class="item article-meta-time">
          <time class="time" data-toggle="tooltip" data-placement="bottom" title="时间：2016-1-4 10:29:39">
              <i class="glyphicon glyphicon-time"></i> ${(blog.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</time>
          </span>
  <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="来源：第一PHP社区">
      <i class="glyphicon glyphicon-globe"></i> 第一PHP社区</span>
   <span class="item article-meta-category" data-toggle="tooltip" data-placement="bottom" title="栏目：后端程序">
       <i class="glyphicon glyphicon-list"></i> <a href="program" title="">${(blog.tag)!}</a></span>
    <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="查看：120">
        <i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span>
     <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="评论：0">
         <i class="glyphicon glyphicon-comment"></i> 0个不明物体</span> </div>
            </header>
            <article class="article-content">
                <p><img data-original="${base}/blogimg/${(blog.filePath)!}" src="${base}/blogimg/${(blog.filePath)!}" alt="" /></p>
                 ${(blog.content)!}
                <#--<pre class="prettyprint lang-php">-->

                <#--</pre>-->
            </article>
            <div class="article-tags">标签：<a href="" rel="tag">${(blog.tag)!}</a></div>
            <div class="relates">
                <div class="title">
                    <h3>相关博文</h3>
                </div>
                <ul>
                    <li><a href="article.html">php如何判断一个日期的格式是否正确</a></li>
                    <li><a href="article.html">php如何判断一个日期的格式是否正确</a></li>
                </ul>
            </div>
            <div class="title" id="comment">
                <h3>评论 <small>抢沙发</small></h3>
            </div>
            <#--<div id="respond">-->
              <#--<div class="comment-signarea">-->
                <#--<h3 class="text-muted">评论前必须登录！</h3>-->
                <#--<p> <a href="javascript:;" class="btn btn-primary login" rel="nofollow">立即登录</a> &nbsp; <a href="javascript:;" class="btn btn-default register" rel="nofollow">注册</a> </p>-->
                <#--<h3 class="text-muted">当前文章禁止评论</h3>-->
              <#--</div>-->
            <#--</div>-->
            <div id="respond">
                <form action="/comment/addComment" method="post" id="comment-form">
                    <div class="comment">
                        <div class="comment-title">
                            <#if "${(userInfo.username)!}" == "">
                                <img class="avatar" src="${base}/images/icon/icon.png" alt="" />
                            <#else>
                                <img class="avatar" src="${base}/headimg/${(userInfo.headimg)!}" alt="" />
                            </#if>
                        </div>
                        <div class="comment-box">
                            <#--<textarea placeholder="您的评论可以一针见血" name="content" id="comment-textarea" cols="100%" rows="3" tabindex="1" ></textarea>-->
                            <script id="editor_comment" type="text/plain" name="content" style="width:100%;height:150px;"></script>
                            <div class="comment-ctrl">

                                <#--<input type="hidden" value="1" class="articleid" />-->
                                <input type="hidden" value="${(blog.id)!}" class="articleid" name="blogId" />
                                <#if "${(userInfo.username)!}" == "">
                                    <button type="button" name="comment-submit" id="comment-submit" tabindex="5" articleid="1" onclick="alert('请登录后再评论')">评论</button>
                                <#else>
                                    <button type="submit" name="comment-submit" id="comment-submit" tabindex="5" articleid="1">评论</button>
                                </#if>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div id="postcomments">
                <ol class="commentlist">

                    <#list commentList as key>
                        <#assign count=key_index />
                        <li class="comment-content"><span style="float:right;margin-top:20px;">#${(count)!}</span>
                            <div class="comment-avatar"><img class="avatar" src="${base}/headimg/${(userMap["${(key.id)!}"].headimg)!}" alt="" /></div>
                            <div class="comment-main">
                                <p>来自<span class="address">${(userMap["${(key.id)!}"].username)!}</span>的用户<span class="time">(${(key.createDate?string("yyyy-MM-dd"))!})</span><br />
                                    ${(key.content)!}</p>
                                <#if "${(userInfo.username)!}" != ""><span style="color:#3399CC;cursor:pointer;" onclick="reply(${(count)!})">回复</span></#if>
                            </div>
                            <div id="respond${(count)!}" style="margin-left:100px;display: none">
                                <form action="/comment/addComment" method="post">
                                    <div class="comment">
                                        <div class="comment-title"><img class="avatar" src="${base}/headimg/${(userInfo.headimg)!}" alt="" />
                                        </div>
                                        <div class="comment-box">
                                            <#--<textarea placeholder="您的评论可以一针见血" name="content" id="comment-textarea${(key_index)!}" cols="90%" rows="3" tabindex="1" ></textarea>-->
                                            <script id="editor_comment${(count)!}" type="text/plain" name="content" style="width:100%;height:150px;"></script>
                                            <div class="comment-ctrl">
                                                <input type="hidden" value="${(blog.id)!}" class="articleid" name="blogId" />
                                                <input type="hidden" value="${(key.id)!}" class="articleid" name="parentId" />
                                                <button type="submit" class="btn btn-success" style="float:right" name="comment-submit" id="comment-submit${(key_index)!}" tabindex="5" articleid="1">回复</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <script>
                                    $(function(){
                                        UE.getEditor('editor_comment${(count)!}',{
                                            toolbars:[
                                                ['fullscreen', 'undo', 'redo', 'bold', 'italic',
                                                    'underline','fontborder', 'backcolor', 'fontsize', 'fontfamily',
                                                    'emotion']
                                            ]
                                        });
                                    });
                                </script>
                            </div>
                            <ol class="commentlist" style="margin-left: 50px;">
                                <#if (allCommentMap["${(key.id)!}"]?size > 0 ) >
                                    <#list allCommentMap["${(key.id)!}"] as reply>
                                    <li class="comment-content" style="border-bottom: white 1px solid">
                                        <div class="comment-avatar"><img class="avatar" src="${base}/headimg/${(userMap["${(reply.id)!}"].headimg)!}" alt="" /></div>
                                        <div class="comment-main">
                                            <p>来自<span class="address">${(userMap["${(reply.id)!}"].username)!}</span>的用户<span class="time">(${(reply.createDate?string("yyyy-MM-dd"))!})</span><br />
                                                ${(reply.content)!}</p>
                                        </div>
                                    </li>
                                    </#list>
                                </#if>

                            </ol>
                        </li>
                    </#list>
                    <#--<li class="comment-content"><span class="comment-f">#1</span>-->
                        <#--<div class="comment-avatar"><img class="avatar" src="${base}/images/icon/icon.png" alt="" /></div>-->
                        <#--<div class="comment-main">-->
                            <#--<p>来自<span class="address">河南郑州</span>的用户<span class="time">(2016-01-06)</span><br />-->
                                <#--这是匿名评论的内容这是匿名评论的内容，这是匿名评论的内容这是匿名评论的内容这是匿名评论的内容这是匿名评论的内容这是匿名评论的内容这是匿名评论的内容。</p>-->
                        <#--</div>-->
                    <#--</li>-->
                </ol>

                <div class="quotes"><span class="disabled">首页</span><span class="disabled">上一页</span><a class="current">1</a><span class="disabled">下一页</span><span class="disabled">尾页</span></div>
            </div>
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
        </div>
        <div class="widget widget_sentence">
            <h3>每日一句</h3>
            <div class="widget-sentence-content">
                <h4>2016年01月05日星期二</h4>
                <p>Do not let what you cannot do interfere with what you can do.<br />
                    别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
            </div>
        </div>
        <div class="widget widget_hot">
            <h3>相关推荐</h3>
            <ul>
                <li>
                    <a href="/blog/showBlog?id=">
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
            </ul>
        </div>
    </aside>
</section>

<#include "../base/footer.ftl" />
<script src="${base}/js/jquery.qqFace.js"></script>
<script type="text/javascript">
    <#--$(function(){-->
        <#--$('.emotion').qqFace({-->
            <#--id : 'facebox',-->
            <#--assign:'comment-textarea',-->
            <#--path:'${base}/images/arclist/'	//表情存放的路径-->
        <#--});-->
    <#--});-->
    function reply(count){
        if(showdiv_display = document.getElementById('respond'+count).style.display=='none'){//如果show是隐藏的
            document.getElementById('respond'+count).style.display='block';//show的display属性设置为block（显示）
        }else{//如果show是显示的
            document.getElementById('respond'+count).style.display='none';//show的display属性设置为none（隐藏）
        }
    }
</script>