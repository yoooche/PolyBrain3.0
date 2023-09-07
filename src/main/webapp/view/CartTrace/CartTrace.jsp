<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.cart.dao.*"%>
<%@ page import="feature.cart.vo.*"%>
<%@ page import="feature.item.vo.*"%>
<%@ page import="feature.cart.service.*"%>
<%@ page import="feature.item.dao.impl.*"%>

<!-- <%@ page isELIgnored="false"%> -->




<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PolyBrain確認訂單</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <style>
        .logoImg {
            max-width: 200px;
            height: auto;
            margin: 0;
        }
    </style>
</head>

<body>
    <div class="container">

        <div class="mt-4 image-wrapper">

            <a href="select.jsp" style="display:inline-block; ">
                <img class="d-block mb-3 logoImg " src="../logo/JennyBluePoly.png" alt="">
            </a>


        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">購物車清單</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <c:forEach var="itemVOs" items="${itemVONewList}">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">${itemVOs.itemName}</h6>
                                    <small class="text-muted">${itemVOs.itemProdDescription}</small>
                                </div>
                                <span class="text-muted">
                                    <c:forEach var="cartTraceVOs" items="${cartTraceVOList}">
                                        <c:if test="${cartTraceVOs.itemNo eq itemVOs.itemNo}">
                                            ${cartTraceVOs.quantity}
                                        </c:if>
                                    </c:forEach>
                                </span>
                            </li>
                        </c:forEach>

                    </ul>
                </div>




                <div class="col-md-8 order-md-1">
                    <form method="post" action="<%=request.getContextPath()%>/view/CartTrace/ConfirmOrder">
                        <div class="container">
                            <h4 class="mb-3">填寫付款資訊</h4>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="receiverName">收件人姓名：</label>
                                    <input type="text" id="receiverName" name="receiverName" class="form-control">
                                    <p style="display: block; color: red; padding: 0px 3px;">
                                        ${errorMsgs["receiverName"]}
                                    </p>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="receiverPhone">收件人電話：</label>
                                    <input type="text" id="receiverPhone" name="receiverPhone" class="form-control">
                                    <p style="display: block; color: red; padding: 0px 3px">
                                        ${errorMsgs["receiverPhone"]}
                                    </p>
                                </div>
                            </div>

                            <div class=" row twzipcode">
                                <div class="col-md-6 mb-3" data-role="county" data-style="d-block w-100">
                                    <label for="county">Country</label>
                                    <div class="invalid-feedback"> Please select a valid country. </div>
                                </div>

                                <div class="col-md-6 mb-3" data-role="district" data-style="d-block w-100">
                                    <label for="state">state</label>
                                    <div class="invalid-feedback"> Please provide a valid state. </div>
                                </div>
                                <div>
                                    <label for="receiverAddress">收件人地址：</label>
                                    <input type="text" id="receiverAddress" name="receiverAddress" class="form-control">
                                    <p style="display: block; color: red; padding: 0px 3px">
                                        ${errorMsgs["receiverAddress"]}
                                    </p>
                                </div>
                            </div>



                            <div class="form-row">
                                <label for="receiverMethod">寄送方式：</label>
                                <select id="receiverMethod" name="receiverMethod" required>
                                    <option value="default" selected>請選擇寄送方式...</option>
                                    <option value="mail">郵寄</option>
                                    <option value="storePickup">超商取貨</option>
                                </select>
                            </div>

                            <input type="hidden" name="action" value="orderConfirm" id="actionInput">
                            <button type="submit" class="btn btn-primary btn-lg">
                                結帳
                            </button>
                            <p style="display: block; color: red; padding: 0px 3px">${errorMsgs["noConfirmOrder"]}</p>

                            <a href="#" class="canceled">返回購物車</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('.twzipcode').twzipcode({
            zipcodeIntoDistrict: true,
            'css': ['county', 'district'],
            // countyName: 'city_name',
            // districtName: 'district_name',
        });
        var selectElement = document.querySelector('select[name="county"]');
        selectElement.classList.add('form-select');
        var selectElementDistrict = document.querySelector('select[name="district"]');
        selectElementDistrict.classList.add('form-select');
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>

