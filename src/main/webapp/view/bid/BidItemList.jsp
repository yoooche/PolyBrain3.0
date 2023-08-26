<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="feature.bid.vo.*" %>
<%@ page import="feature.bid.service.*" %>
<%@ page import="feature.bid.dao.*" %>

<% 
BiddingService biddingService=new BiddingServiceImpl(); 
List<BidItemVo> list = biddingService.viewAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i>
                            </div>
                            Layouts
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.html">Static
                                    Navigation</a>
                                <a class="nav-link" href="layout-sidenav-light.html">Light
                                    Sidenav</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                            aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i>
                            </div>
                            Pages
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                    aria-controls="pagesCollapseAuth">
                                    Authentication
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.html">Login</a>
                                        <a class="nav-link" href="register.html">Register</a>
                                        <a class="nav-link" href="password.html">Forgot
                                            Password</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseError" aria-expanded="false"
                                    aria-controls="pagesCollapseError">
                                    Error
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.html">401 Page</a>
                                        <a class="nav-link" href="404.html">404 Page</a>
                                        <a class="nav-link" href="500.html">500 Page</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link" href="charts.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i>
                            </div>
                            Charts
                        </a>
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Tables
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Tables</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active">Tables</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                            DataTables is a third party plugin that is used to generate the
                            demo table below. For more information about DataTables, please
                            visit the
                            <a target="_blank" href="https://datatables.net/">official
                                DataTables documentation</a>
                            .
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            DataTable Example
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>編號</th>
                                        <th>圖片</th>
                                        <th>名稱</th>
                                        <th>描述</th>
                                        <th>類別</th>
                                        <th>發行商</th>
                                        <th>編輯</th>
                                        <th>刪除</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% List<BidItemVo> listAll = (List<BidItemVo>)pageContext.getAttribute("list"); %>
                                            <% if(listAll !=null) { %>
                                                <% for(BidItemVo bidItemVo : listAll) {%>
                                                    <tr>
                                                        <td><%= bidItemVo.getBidItemNo() %></td>
                                                        <td><img src="<%=request.getContextPath()%>/bid/BidItemPic?bidItemNo=<%=bidItemVo.getBidItemNo()%>" width="100px" height="100px"></td>
                                                        <td><%= bidItemVo.getBidItemName() %></td>
                                                        <td>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bid_item_describe_<%= bidItemVo.getBidItemNo() %>">
                                                                商品說明
                                                            </button>
                                                            
                                                            <!-- Modal -->
                                                             <div class="modal fade" id="bid_item_describe_<%= bidItemVo.getBidItemNo() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content"> 
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <%= bidItemVo.getBidItemDescribe() %>
                                                                            <!-- ${bidItemVo.bidItemDescribe} -->
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                        </td>
                                                        <td><%= bidItemVo.getItemClassNo() %></td>
                                                        <td><%= bidItemVo.getGamePublisher() %></td>
                                                        <td>
                                                            <!-- 新增一筆競標商品資料 -->
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bid_item_edit"style="float: right; margin-bottom: 1px;">
                                                                編輯
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="bid_item_edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">競標商品新增</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="<%=request.getContextPath()%>/bid/BidItemList" method="post">
                                                                                <div style="margin-bottom: 10px; display: inline-block;">
                                                                                    <label for="bidItemName">競標品名稱:</label>
                                                                                    <input type="text" id="bidItemName" name="bidItemName">
                                                                                    <select id="itemClassNo" name="itemClassNo">
                                                                                        <option disabled selected>--類別--</option>
                                                                                        <option value="1">策略</option>
                                                                                        <option value="2">派對</option>
                                                                                        <option value="3">親子</option>
                                                                                        <option value="4">合作</option>
                                                                                        <option value="5">陣營</option>
                                                                                        <option value="6">派對</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div>
                                                                                    <label for="gamePublisher">遊戲發行商:</label>
                                                                                    <input type="text" id="gamePublisher" name="gamePublisher">
                                                                                </div>
                                                                                <div style="border: 1px solid white; margin: 10px 0;"></div>
                                                                                <div>
                                                                                    <label for="bidItemDescribe">商品描述:</label><br>
                                                                                    <textarea id="bidItemDescribe" name="bidItemDescribe" cols="30" rows="10"
                                                                                        style="width: 100%; height: 150px; resize: none;"></textarea>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                                                    <input type="hidden" name="action" value="insert">
                                                                                    <button type="submit" class="btn btn-primary">儲存</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#bid_item_delete">
                                                            刪除
                                                        </button>
                                                        
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="bid_item_delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        確定刪除嗎?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                                        <form action="<%=request.getContextPath()%>/bid/BidItemList" method="get">
                                                                        <button type="submit" class="btn btn-primary">確認刪除</button>
                                                                        <input type="hidden" name="bidItemNo" value="<%= bidItemVo.getBidItemNo() %>">
                                                                        <input type="hidden" name="action" id="delete">
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                                        <% } %>
                                </tbody>
                            </table>
                            <!-- 新增一筆競標商品資料 -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal" style="float: right; margin-bottom: 1px;">
                                新增
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">競標商品新增</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="<%=request.getContextPath()%>/bid/BidItemList" method="post" enctype="multipart/form-data">
                                                <div style="margin-bottom: 10px; display: inline-block;">
                                                        <label for="bidItemName">競標品名稱:</label>
                                                        <input type="text" id="bidItemName" name="bidItemName">
                                                        <select id="itemClassNo" name="itemClassNo">
                                                            <option disabled selected>--類別--</option>
                                                            <option value="1">策略</option>
                                                            <option value="2">派對</option>
                                                            <option value="3">親子</option>
                                                            <option value="4">合作</option>
                                                            <option value="5">陣營</option>
                                                            <option value="6">派對</option>
                                                        </select>
                                                </div>
                                                <div>
                                                    <label for="gamePublisher">遊戲發行商:</label>
                                                    <input type="text" id="gamePublisher" name="gamePublisher">
                                                </div>
                                                <div style="border: 1px solid white; margin: 10px 0;"></div>
                                                <div>
                                                    <label for="bidItemPic">商品圖片:</label>
                                                    <input type="file" id="bidItemPic" name="bidItemPic" onclick="preview()" multiple="multiple">
                                                    <div id="blob_holder"></div>
                                                </div>
                                                <div>
                                                    <label for="bidItemDescribe">商品描述:</label><br>
                                                    <textarea id="bidItemDescribe" name="bidItemDescribe" cols="30" rows="10" style="width: 100%; height: 150px; resize: none;"></textarea>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">取消</button>
                                                    <input type="hidden" name="action" value="insert">
                                                    <button type="submit" id="submit" class="btn btn-primary">儲存</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script>
        let filereader_support = typeof FileReader != 'undefined';
        if(!filereader_support){
            alert("No FileReader Support");
        }
        acceptedTypes = {
            'image/png' : true,
            'image/jpeg' : true,
            'image/gif' : true
        }
        function preview(){
            let bidItemPic = document.getElementById('bidItemPic');
            bidItemPic.addEventListener("change", function(event){
                let files = event.target.files || event.dataTransfer.files;
                for(let i = 0; i < files.length; i++){
                    previewfile(files[i])
                }
            }, false);
        }
        function previewfile(file){
            if(filereader_support === true && acceptedTypes[file.type] === true){
                let reader = new FileReader();
                reader.onload = function(event){
                    let image = new Image();
                    image.src = event.target.result;
                    image.width = 100;
                    image.height = 75;
                    image.border = 2;
                    if(blob_holder.hasChildNodes()){
                        blob_holder.removeChild(blob_holder.childNodes[0]);
                    }
                    blob_holder.appendChild(image);
                };
                reader.readAsDataURL(file);
                document.getElementById('submit').disabled = false;
            } else{
                blob_holder.innerHTML = "<div style='text-align: left;'>" + "filename" + file.name;
                    document.getElementById('submit').disabled = true;
            }
        }


    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>