<#include "../base/header.ftl" />
<script type="text/javascript">
    /**创建ue对象*/
    var ue = UE.getEditor('editorAdd');
    ue.ready(function () {
    });
    var ue1 = UE.getEditor('editor');
    ue1.ready(function () {
        // ue.setContent("");
    });
</script>
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
            <button data-toggle="modal" data-target="#myModal" class=" btn ripple-infinite btn-3d btn-primary" value="primary"
                    style="margin-top: -10px;">
                <span><i class="fa fa-plus-square fa-lg"></i>&nbsp;&nbsp;添加通知</span>
            </button>
            <div style="margin-top: 50px" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                添加通知信息
                            </h4>
                        </div>
                        <form action="${base}/notice/addNotice" method="post" enctype="multipart/form-data">
                            <div class="modal-body" style="height:450px;width:800px">
                                <label for="name" class="col-sm-2 control-label">通知标题</label>
                                <div class="col-sm-10">
                                    <input type="text" style="width: 400px;" class="form-control" name="title"
                                           placeholder="请输入通知标题">
                                </div>
                                <label for="name" class="col-sm-2 control-label">通知内容</label>
                                <div class="col-sm-12">
                                    <script id="editorAdd" type="text/plain" name="content" style="width:100%;height:300px;"></script>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <input type="submit" value="提交" class="btn btn-primary" />
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </header>
        <div class="readers">
            <div class="content-wrap">
                <div class="content">

                    <div class="row">
                        <div class="col-sm-12">
                            <table id="datatables-example"
                                   class="table table-striped table-bordered dataTable no-footer" role="grid"
                                   aria-describedby="datatables-example_info" style="width: 100%;" width="100%"
                                   cellspacing="0">
                                <thead>
                                <tr role="row">
                                    <th class="sorting" tabindex="0" aria-controls="datatables-example"
                                        rowspan="1" colspan="1" style="width: 185px;"
                                        aria-label="Name: activate to sort column ascending">标题
                                    </th>
                                    <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                        rowspan="1" colspan="1" style="width: 110px;"
                                        aria-label="Position: activate to sort column ascending"
                                        aria-sort="descending">创建时间
                                    </th>
                                    <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                        rowspan="1" colspan="1" style="width: 110px;"
                                        aria-label="Position: activate to sort column ascending"
                                        aria-sort="descending">通知状态
                                    </th>
                                    <th class="sorting_desc" tabindex="0" aria-controls="datatables-example"
                                rowspan="1" colspan="1" style="width: 110px;"
                                aria-label="Position: activate to sort column ascending"
                                        aria-sort="descending">操作
                                        </th>

                                </tr>
                                </thead>
                                <tbody>

                                        <#assign count=0 />
                                        <#if (noticeList?size > 0)>
                                        <#--<@lectureList count=100; lectureList>-->
                                            <#list noticeList as notice>
                                                <#assign count=count + 1 />
                                            <#--<#if "${lecture.userType}" != "1">-->
                                            <tr role="row" class="odd">

                                                <td class="sorting_1">${notice.title}</td>

                                                <td><#if notice.createDate??>
                                                    <span title="${notice.createDate?string("yyyy-MM-dd HH:mm:ss")}">${notice.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                <#else>
                                                    &nbsp;
                                                </#if>
                                                </td>
                                                <td>
                                                    <#if notice.status == 0>未完成
                                                    <#else>完成
                                                    </#if>
                                                </td>
                                                <td>
                                                    <a href="${base}/notice/deleteNotice?id=${notice.id}" onclick="javascript:return p_del()" title="删除">[删除]</a>

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
                                                    <a href="" data-toggle="modal" data-target="#myModal_update${count}" title="修改通知信息">[修改]</a>
                                                    <!-- 模态框（Modal） 修改课程信息-->
                                                    <div style="margin-top: 50px" class="modal fade" id="myModal_update${count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content" style="width: 800px;">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                        &times;
                                                                    </button>
                                                                    <h4 class="modal-title" id="myModalLabel">
                                                                        修改通知信息
                                                                    </h4>
                                                                </div>
                                                                <form action="${base}/notice/updateNotice" method="post" enctype="multipart/form-data">
                                                                    <div class="modal-body" style="height:450px;width:800px">
                                                                        <label for="name" class="col-sm-2 control-label">通知标题</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="hidden" name="id" value="${notice.id}" />
                                                                            <input type="text" style="width: 400px;" class="form-control" name="title"
                                                                                   value="${(notice.title)!}" placeholder="请输入通知标题">
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">通知内容</label>
                                                                        <div class="col-sm-10">
                                                                            <script id="editor" type="text/plain" name="content" style="width:100%;height:300px;">${(notice.content)!}</script>
                                                                        </div>
                                                                        <label for="name" class="col-sm-2 control-label">通知状态</label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" style="width: 400px;" class="form-control" name="status"
                                                                                   value="${(notice.status)!}" placeholder="请输入通知状态">
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                                        </button>
                                                                        <input type="submit" value="提交" class="btn btn-primary" />
                                                                    </div>
                                                                </form>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal -->
                                                    </div>
                                                <#--<a href="income!view.action?id=${income.id}" title="查看">[查看]</a>-->
                                                </td>
                                            </tr>
                                            <#--</#if>-->
                                            </#list>
                                        <#--</@lectureList>-->
                                        <#else>
                                        没有记录
                                        </#if>


                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>

<#include "../base/footer.ftl" />