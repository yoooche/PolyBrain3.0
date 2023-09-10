//不知道是啥的原本套版資料
window.addEventListener('DOMContentLoaded', event => {
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
let categoryMap = {};//宣告categoryMap變數
let dataTable; // 宣告 DataTables 變數
//data tables的資料匯入
$(document).ready(function () {
    // 初始化 DataTable
    function initializeDataTable(data) {
        if (dataTable) {
            dataTable.destroy(); // 銷毀當前的DataTables實例
        }

        dataTable = $('#itemTable').DataTable({
            "lengthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, "全部"]]
            , responsive: {
                breakpoints: [                        //設定五種螢幕尺寸的type
                    { name: 'desktop', width: Infinity },
                    { name: 'tablet-l', width: 1024 },//原本是768~1024不含768
                    { name: 'tablet-p', width: 767 },//
                    { name: 'mobile-l', width: 480 },
                    { name: 'mobile-p', width: 320 },
                    { name: 'none', width: 100 }     //隱藏
                ]
            },
            ajax: {
                url: "http://localhost:8080/PolyBrain/selectServlet",
                method: "POST",
                data: function (d) {
                    return {
                        value: "selectAll"
                    };
                },
                dataSrc: "" // 数据源为空，因为数据是直接数组
            },
            columns: [
                { data: 'itemNo', width: '120px' },
                {
                    data: 'itemImg', width: '130px',
                    render: function (data, type, row) {
                        // 如果是显示类型，返回包含图像的HTML
                        if (type === 'display' && data && data.length > 0) { // 添加对 data 是否存在的检查
                            var imagesHTML = '';
                            // 使用循环处理每个Base64编码的图像
                            var base64Image = data[0].itemImg;
                            imagesHTML += `<img src="${base64Image}" alt="Image"><br>`;
                            return imagesHTML;
                        }
                        // 如果是排序或其他类型，返回原始数据
                        return data;
                    }


                },
                {
                    data: 'itemClass.itemClassName', width: '120px',
                },
                {
                    data: 'itemName', width: '180px',
                     render: function (data, type, row) {
        const itemNo = row.itemNo; // 取得 itemNo 的值
        const link = `http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=${itemNo}`;
        return `<a href="${link}" target="_blank">${data}</a>`;
                    }
                },
                { data: 'itemPrice', width: '100px' },
                { data: 'itemSales', width: '100px' },
                { data: 'itemQty', width: '120px' },
                {
                    data: 'itemState', width: '150px',
                    render: function (data, type, row) {
                        switch (data) {
                            case 0:
                                return '<span class="text-success">下架</span>';
                            case 1:
                                return '<span class="text-primary">上架</span>';
                            case 2:
                                return '<span class="text-danger">售罄</span>';
                        }
                    }
                },
                {
                    data: 'itemProdDescription', "className": "none"    //加none代表為上面第五種type默認隱藏
                }, {
                    data: null, title: "操作功能", width: '150px',  // 這邊是欄位
                    render: function (data, type, row) {
                        return '<button type="button" class="btn btn-warning btn-sm btn-edit">編輯</button> ' +
                            '<button type="button" class="btn btn-danger btn-sm btn-remove">刪除</button>'
                    }
                },
            ],
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/zh-HANT.json',  //DATATABLE設定為中文
            },
            columnDefs: [
                {
                    targets: [0], // 第一欄 
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                    },
                },
                {
                    targets: [0, 1, 2, 3, 4, 5, 6,7, 9],//_all才是全部欄
                    className: 'text-center'       //置中
                }
            ],
            // 其他设置...
            createdRow: function (row, data, dataIndex) {
                // 在此回调函数中，为每个单元格设置高度
                $(row).find('td').css('height', '100px'); // 将所有列的高度设置为150像素
            }
        });
    }


    // 初始化 DataTable，首次加载 ，否則刪除與編輯無法使用
    initializeDataTable([]);


    //點擊送出新增按鈕後使用燈箱效果顯示各種輸入框
    $('#bt-add_item').click(function () {
        document.getElementById('add_lightbox').style.display = 'block';
    });

    // 點擊删除觸發燈箱及執行刪除
    $('#itemTable tbody').on('click', '.btn-remove', function () {
        const rowData = dataTable.row($(this).closest('tr')).data();
        itemNo = rowData.itemNo;

        // 使用燈箱效果顯示確認取消對話框
        Swal.fire({
            title: '確認要刪除該項商品？',
            text: "點擊確認後將刪除所有商品資料。",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '確定',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                // 若使用者確定取消，則發送刪除請求
                fetch('http://localhost:8080/PolyBrain/item/remove', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json;charset=UTF-8' },
                    body: JSON.stringify({ itemNo })
                })
                    .then(resp => resp.json())
                    .then(body => {
                        location.reload();
                    });
            }
        });
    });

    //绑定編輯按钮的點擊事件
    $('#itemTable tbody').on('click', '.btn-edit', function () {
        const rowData = dataTable.row($(this).closest('tr')).data();
        // 将行数据填充到编辑表单中
        sessionStorage.setItem('editedRowData', JSON.stringify(rowData));
        window.location.href = 'updateItem.html';
        // document.getElementById('update_lightbox').style.display = 'block';
    });

});


//插入圖片的效果
$(document).ready(function () {
	ImgUpload();
});

function ImgUpload() {
	var imgWrap = "";
	var imgArray = [];

	$('.upload_inputfile').each(function () {
		$(this).on('change', function (e) {
			imgWrap = $(this).closest('.upload_box').find('.upload_img-wrap');
			var maxLength = $(this).attr('data-max_length');

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var iterator = 0;
			filesArr.forEach(function (f, index) {

				if (!f.type.match('image.*')) {
					return;
				}

				if (imgArray.length > maxLength) {
					return false;
				} else {
					var len = 0;
					for (var i = 0; i < imgArray.length; i++) {
						if (imgArray[i] !== undefined) {
							len++;
						}
					}
					if (len > maxLength) {
						return false;
					} else {
						imgArray.push(f);

						var reader = new FileReader();
						reader.onload = function (e) {
							var html = "<div class='upload_img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload_img-close").length + "' data-file='" + f.name + "' class='img-bg add_img-bg'><div class='upload_img-close'></div></div></div>";
							imgWrap.append(html);
							iterator++;
						}
						reader.readAsDataURL(f);
					}
				}
			});
		});
	});

	$('body').on('click', ".upload_img-close", function (e) {
		var file = $(this).parent().data("file");
		for (var i = 0; i < imgArray.length; i++) {
			if (imgArray[i].name === file) {
				imgArray.splice(i, 1);
				break;
			}
		}
		$(this).parent().parent().remove();
	});
}