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
                        return '<a href="" target="_blank">' + data + '</a>' // 這邊是加連結
                    }
                },
                { data: 'itemPrice', width: '100px' },
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
                    targets: [0, 1, 2, 3, 4, 5, 6, 8],//_all才是全部欄
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
    //點擊新增商品
    const addButton = document.getElementById('bt-add_item');
    addButton.addEventListener('click', () => {
        window.location.href = "addItem.html";
    });


    //燈箱效果
    const lightboxClose = document.querySelector('#lightbox-close');
    lightboxClose.addEventListener('click', () => {
        lightbox.style.display = 'none';
    });

    // 初始化 DataTable，首次加载
    initializeDataTable([]);
});


$(document).ready(function () {
    // 绑定删除按钮的點擊事件
    $('#itemTable tbody').on('click', '.btn-remove', function () {
        const rowData = dataTable.row($(this).closest('tr')).data();
        onRemoveClick(rowData.itemNo);
    });

    // 删除操作
    function onRemoveClick(itemNo) {
        if (!confirm('確定刪除?')) {
            return;
        }
        fetch('http://localhost:8080/PolyBrain/item/remove', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json;charset=UTF-8' },
            body: JSON.stringify({ itemNo })
        })
            .then(resp => resp.json())
            .then(body => {
                if (body.success) {
                    location.reload();  // 成功后刷新页面
                }
            });
    }

    //绑定編輯按钮的點擊事件
    $('#itemTable tbody').on('click', '.btn-edit', function () {
        const rowData = dataTable.row($(this).closest('tr')).data();
        // 将行数据填充到编辑表单中
        sessionStorage.setItem('editedRowData', JSON.stringify(rowData));
        // 轉跳到 updateItem.html 頁面
        window.location.href = "../item/updateItem.html";


        // 打开编辑模态框或弹出式窗口
        // 例如：$('#editModal').modal('show');
    });

    //     // 点击編輯按钮后执行的函数
    // function addNewItem() {
    //     // 在这里构建一个包含需要传递的数据的对象
    //     var data = {
    //         // 数据属性...
    //     };

    //     // 将数据保存在本地存储中
    //     localStorage.setItem("newItemData", JSON.stringify(data));

    //     // 跳转到 addItem.html 页面
    //     window.location.href = "addItem.html";
    // }

});

