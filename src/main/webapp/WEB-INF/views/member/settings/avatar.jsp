<%-- 
    Document   : avartar
    Created on : 2015-11-2, 13:08:14
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8" />
        <title>Lockbur-更多壁纸，更多分享</title>
        <jsp:include page="/WEB-INF/views/portal/common/head_and_css.jsp"/>
        <!--百度统计-->
        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "//hm.baidu.com/hm.js?15dcd777f63423d27dbca739598638ed";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </head>
    <body>
        <section class="vbox">
            <jsp:include page="/WEB-INF/views/portal/common/header.jsp"/>
            <section>
                <section class="container scrollable m-b m-t">
                    <section class="hbox stretch">
                        <aside class="aside-lg bg-light lter b-r">
                            <section class="vbox">
                                <section class="scrollable">
                                    <div class="wrapper">
                                        <div class="text-center m-b m-t">
                                            <a href="#" class="thumb-lg">
                                                <img src="${pageContext.request.contextPath}/assets/images/avatars.jpg" class="img-circle">
                                            </a>
                                            <div>
                                                <div class="h3 m-t-xs m-b-xs">${member.username}</div>
                                                <small class="text-muted"><i class="fa fa-map-marker"></i> 中国,北京</small>
                                            </div>                
                                        </div>
                                        <div class="panel wrapper">
                                            <div class="row text-center">
                                                <div class="col-xs-6">
                                                    <a href="#">
                                                        <span class="m-b-xs h4 block"><i class="fa fa-camera"></i></span>
                                                        <small class="text-muted">头像</small>
                                                    </a>
                                                </div>
                                                <div class="col-xs-6">
                                                    <a href="#">
                                                        <span class="m-b-xs h4 block"><i class="fa fa-user"></i></span>
                                                        <small class="text-muted">账户</small>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-group btn-group-justified">
                                            <a href="${pageContext.request.contextPath}/member/settings/account" class="btn btn-primary">
                                                <i class="fa fa-edit"></i> 修改资料
                                            </a>
                                            <a href="${pageContext.request.contextPath}/member/favorite" class="btn btn-success"><i class="fa fa-star"></i> 收藏列表</a>
                                        </div>
                                        <div>
                                            <h4 class="text-uc text-xs text-muted">用户描述信息</h4>
                                            <p>${memberInfomation.description}</p>
                                        </div>
                                    </div>
                                </section>
                            </section>
                        </aside>
                        <aside class="bg-white">
                            <section class="panel panel-default">
                                <header class="panel-heading bg-light">
                                    <ul class="nav nav-justified">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/member/settings/profile">
                                                <span class="m-b-xs h4 block"> 
                                                    <i class="fa fa-user text-muted"></i>
                                                </span>
                                                <span class="text-muted">个人资料</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/member/settings/avatar" class="bg-light">
                                                <span class="m-b-xs h4 block"> 
                                                    <i class="icon-eyeglasses"></i>
                                                </span>
                                                <span class="text-muted">头像修改</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/member/settings/browsing">
                                                <span class="m-b-xs h4 block"> 
                                                    <i class="fa fa-cog text-muted"></i>
                                                </span>
                                                <span class="text-muted">个人设置</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/member/settings/account" class="bg-light">
                                                <span class="m-b-xs h4 block"> 
                                                    <i class="fa fa-css3"></i>
                                                </span>
                                                <span class="text-muted">账户</span>
                                            </a>
                                        </li>
                                    </ul>
                                </header>
                                <div class="panel-body">
                                    <div class="tab-pane" id="home">
                                        <form class="form-horizontal" data-validate="parsley" action="${pageContext.request.contextPath}/member/settings/account" method="post">
                                            <section class="panel panel-default">
                                                <header class="panel-heading">
                                                    <strong>头像修改</strong>
                                                </header>
                                                <div class="panel-body"> <div class="line line-dashed b-b line-lg pull-in"></div>
                                                    <div class="form-group">
                                                        <div class="col-sm-3 text-center">
                                                            <div class="b-a b-dashed b-danger">
                                                                <img src="${pageContext.request.contextPath}/assets/images/avatars.jpg" class="img-full">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <div class="clearfix m-b-lg">
                                                                <div class="clear">
                                                                    <small class="block text-muted">你头像上传为. 200x200 px.如果不符合尺寸,系统将自动裁剪.</small>
                                                                    <a href="#" class="text-info">头像大小限制: 200KB</a>
                                                                    <small class="block text-muted">上传类型限制: *.png *.jpg *.gif</small>
                                                                </div>
                                                            </div>
                                                            <div class="m-b-lg">
                                                                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                                </div>
                                                <footer class="panel-footer text-center bg-light lter">
                                                    <button type="submit" class="btn btn-success btn-s-xs">确认修改</button>
                                                </footer>
                                            </section>
                                        </form>
                                    </div>
                                </div>
                            </section>
                        </aside>
                    </section>
                </section>
            </section>
            <footer class="footer bg-black dker">
                <div class="container">
                    <small>所有图片同步于<a href="http://alpha.wallhaven.cc/" target="_blank">alpha.wallhaven.cc</a>©lockbur.com2015  京ICP备15054053号</small>
                </div>
            </footer>
        </section>
    </body>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <!-- App -->
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>  
    <script src="${pageContext.request.contextPath}/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vegas/vegas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.plugin.js"></script>
    <script type="text/javascript">
            $(document).ready(function () {
                $("#search").click(function () {
                    $("#searchbar").toggle("slow");
                });
                $('body').vegas({
                    timer: false,
                    slides: [
                        {src: '${pageContext.request.contextPath}/assets/images/background1.jpg'}
                    ]
                });
            });
    </script>
</html>


