let items;

function $id(id) {
  return document.getElementById(id);
}

//---------------------------------------------------clearForm()
// function clearForm(){
//   let inputs = document.querySelectorAll("#empPanel input");
//   for(let i in inputs){ //清空所有輸入盒
//     inputs[i].value = "";
//   }
//   $id("JOB").selectedIndex = 0;  //將下拉式選單reset在第0個位置
// }

//----------------------------------------------------------
//function addItemToDb(){
//    //------------打包資料(start)
//    let ItemData = {
//		ITEMNO:parseInt($id("ITEMNO").value),
//		ITEMCLASSNO:$id("ITEMCLASSNO").value,
//		ITEMNAME:$id("ITEMNAME").value,
//		ITEMPRICE:parseInt($id("ITEMPRICE").value),
//		ITEMSTATE:parseInt($id("ITEMSTATE").value),
//		ITEMQTY:parseInt($id("ITEMQTY").value),
//		PLAYER:parseInt($id("PLAYER").value),
//		GAMETIME:parseInt($id("GAMETIME").value),
//		ITEMPRODDESCRIPTION:$id("ITEMPRODDESCRIPTION").value
//        }
//    //------------打包資料(end)
//
//    //------------送出Ajax請求
//		fetch("itemInsert_json.jsp",{
//		    	method:"post",
//		    	body:JSON.stringify(ItemData)
//		    })
//		    .then(response=>response.text())
//		    .then(data=>{
//			    		if (data.indexOf("success") !== -1) {
//				        	//-------放入table中---一
//					        let html = "";
//									html += `<td>${ItemData.ITEMNO}</td>`;
//									html += `<td>${ItemData.ITEMCLASSNO}</td>`;
//									html += `<td>${ItemData.ITEMNAME}</td>`;
//									html += `<td>${ItemData.ITEMPRICE}</td>`;
//									html += `<td>${ItemData.ITEMSTATE}</td>`;
//									html += `<td>${ItemData.ITEMQTY}</td>`;
//									html += `<td>${ItemData.PLAYER}</td>`;
//									html += `<td>${ItemData.GAMETIME}</td>`;
//									html += `<td>${ItemData.ITEMPRODDESCRIPTION}</td>`;
//
//					        let tr = document.createElement("tr");
//					        tr.innerHTML = html;
//					        $id("showPanel").appendChild(tr);
//					        //-------放入table中---二
//				        	// emps.push(empData);
//				        	// showEmps();
//				        	//------------
//				          alert("新增成功~");
//				          $id("itemsPanel").classList.toggle("hide");
//				          clearForm();
//			        }
//		    })
//		    .catch(error=>console.log(error));
//		}

//----------------------------------------------------------
function getItems(){
	let url = "http://localhost:8080/PolyBrain/selectAllServlet";

	 const requestOptions = {
        method: "POST",
        headers: {
            "Content-Type": "application/json", // 设置请求头
        },
      }
     fetch(url, requestOptions)
     .then(function (response) {
      return response.json()
     })
     .then(function (data) {
      items = data;
      showItems();//將其顯示到頁面中
     })
     .catch(function(error){
      console.log(error);
     })
    }

//----------------------------------------------------------
function showItems(){
	let html = "";
	if (items.length === 0) {
      html = "<tr><td colspan='4' align='center'>尚無商品資料</td></tr>";
     } else {
       for(let i=0; i<items.length; i++){
        html += "<tr>";
        html += `<td>${items[i].itemNo}</td>`;
        html += `<td>${items[i].itemClassNo}</td>`;
        html += `<td>${items[i].itemName}</td>`;
        html += `<td>${items[i].itemPrice}</td>`;
        html += `<td>${items[i].itemState}</td>`;
        html += `<td>${items[i].itemQty}</td>`;
        html += `<td>${items[i].player}</td>`;
        html += `<td>${items[i].gametime}</td>`;
        html += `<td width>${items[i].itemProdDescription}</td>`;
            html += `<td><button id=itemupdate >修改</button>`;
            html += `<button id=itemdelete >刪除</button></td>`;
        html += "</tr>";
       }
      //將Item資料放入頁面中
     }

     $id("showPanel").innerHTML = html;
    }
//----------------------------------------------------------

window.addEventListener("load", function () {
	//------------先取回所有商品資料
//	getItems();
	})

$(document).ready(function() {
    // 先確保 DOM 已經載入完成後再執行以下代碼

    // 顯示所有遊戲按鈕點擊事件處理
    $("button.showAll").on("click", function() {
        getItems();
    });

    // 修改按鈕點擊事件處理
    $("body").on("click", "button#itemupdate", function() {
        // 在這裡處理修改按鈕的點擊事件
        // 可以獲取按鈕所在行的資料，然後進行適當的處理
    });

    // 刪除按鈕點擊事件處理
    $("body").on("click", "button#itemdelete", function() {
        // 在這裡處理刪除按鈕的點擊事件
        // 可以獲取按鈕所在行的資料，然後進行適當的處理
    });
});




