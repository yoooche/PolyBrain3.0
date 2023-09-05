<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>預約狀態修改 - update_emp_input.jsp</title>


<style type="text/css">

	button {
		padding: 5px;
	}
	form {
		display: table;
	}
	form div {
		display: table-row;
	}
	label, input, span, select {
		display: table-cell;
		margin: 5px;
		text-align: left;
	}
	input[type=text], input[type=password], select, textarea {
		width: 200px;
		margin: 5px;
	}
	form div div {
		display: table-cell;
	}
	.center {
        margin-left: auto;
        margin-right: auto;
    }


   .radio-item {
       display: inline-flex;  /* 使用 flex 使子項目在同一行 */
       align-items: center;  /* 垂直居中 */
       margin-right: 20px;   /* 提供右邊的間距，使兩個 radio-item 之間有一些距離 */
   }

   .radio-buttons {
       display: inline-flex;  /* 使其子項目在同一行 */
       align-items: center;  /* 垂直居中 */
   }

</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top justify-content-center">
		 <div align="center"> <h2>預約狀態修改 - 2.jsp</h2>
		 <h3><a class="navbar-brand" href="<%=request.getContextPath()%>/view/bookingtast/1.jsp"><img src="<%=request.getContextPath()%>/view/bookingtast/images/back1.gif">回查詢頁${success}</a></h3></div>
</nav>

	<div align="center">

		<form action="<%=request.getContextPath()%>/bookingtast/inserservlet" method="post"  enctype="multipart/form-data">

            <div>
			<label for="TABLE_BOOK_NO">編號:</label>
			<input id ="TABLE_BOOK_NO" name="TABLE_BOOK_NO" type="text" value="${param.TABLE_BOOK_NO}" style="border:0px ; font-weight: bold;" readonly />
			</div>

            <div>
			<label for="TABLE_DATE">日期:</label>
			<input id ="TABLE_DATE" name="TABLE_DATE" type="date" value="${param.TABLE_DATE}" onclick="hideContent('TABLE_DATE.errors');" />
			<span  id ="TABLE_DATE.errors" class="error">${errorMsgs.TABLE_DATE}</span>
			</div>

			<div>
			<label for="TABLE_NO">桌號:</label>
			<input id ="TABLE_NO" name="TABLE_NO" type="text" value="${param.TABLE_NO}" onclick="hideContent('TABLE_NO.errors');" />
			<span  id ="TABLE_NO.errors" class="error">${errorMsgs.TABLE_NO}<br/></span>
			</div>


			                            <div class="radio-group">
                                       <div class="radio-group-label">
                                           <label>上午(09-12):</label>
                                       </div>
                                       <div class="radio-buttons">
                                           <div class="radio-item">
                                               <input type="radio" id="TABLE_MOR_available" name="TABLE_MOR" value="0"${param.TABLE_MOR == '0' ? 'checked' : ''} onclick="hideContent('TABLE_MOR.errors');" />
                                               <label for="TABLE_MOR_available">可預約</label>
                                           </div>
                                           <div class="radio-item">
                                               <input type="radio" id="TABLE_MOR_unavailable" name="TABLE_MOR" value="2"${param.TABLE_MOR == '2' ? 'checked' : ''} onclick="hideContent('TABLE_MOR.errors');" />
                                               <label for="TABLE_MOR_unavailable">不開放</label>
                                           </div>
                                       </div>
                                   </div>
                                   <span id="TABLE_MOR.errors" class="error">${errorMsgs.TABLE_MOR}</span>

                       <div class="radio-group">
                           <div class="radio-group-label">
                               <label>下午(13-16):</label>
                           </div>
                           <div class="radio-buttons">
                               <div class="radio-item">
                                   <input type="radio" id="TABLE_EVE_available" name="TABLE_EVE" value="0"${param.TABLE_EVE == '0' ? 'checked' : ''} onclick="hideContent('TABLE_EVE.errors');" />
                                   <label for="TABLE_EVE_available">可預約</label>
                               </div>
                               <div class="radio-item">
                                   <input type="radio" id="TABLE_EVE_unavailable" name="TABLE_EVE" value="2"${param.TABLE_EVE == '2' ? 'checked' : ''} onclick="hideContent('TABLE_EVE.errors');" />
                                   <label for="TABLE_EVE_unavailable">不開放</label>
                               </div>
                           </div>
                       </div>
                       <span id="TABLE_EVE.errors" class="error">${errorMsgs.TABLE_EVE}</span>

                        <div class="radio-group">
                            <div class="radio-group-label">
                                <label>晚上(17-20):</label>
                            </div>
                            <div class="radio-buttons">
                                <div class="radio-item">
                                    <input type="radio" id="TABLE_NIGHT_available" name="TABLE_NIGHT" value="0"
                                    ${param.TABLE_NIGHT == '0' ? 'checked' : ''} onclick="hideContent('TABLE_NIGHT.errors');" />
                                    <label for="TABLE_NIGHT_available">可預約</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="TABLE_NIGHT_unavailable" name="TABLE_NIGHT" value="2"
                                    ${param.TABLE_NIGHT == '2' ? 'checked' : ''} onclick="hideContent('TABLE_NIGHT.errors');" />
                                    <label for="TABLE_NIGHT_unavailable">不開放</label>
                                </div>
                            </div>
                        </div>
                        <span id="TABLE_NIGHT.errors" class="error">${errorMsgs.TABLE_NIGHT}</span>




			<div>
				<div></div>
				<input  type="hidden" name="action" value="updatetab">
				<button type="submit" id="submit"> 送出修改 </button>
				<div></div>
			</div>
		</form>
	</div>


<!-- JavaScript part -->
<script type="text/javascript">
//清除提示信息
function hideContent(d) {
     document.getElementById(d).style.display = "none";
}

//enctype="multipart/form-data有檔案上傳的接口 如果沒有處理會造成短路要碼刪掉要碼在servlet設接口
</script>

</body>
</html>