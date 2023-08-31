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

        //從資料庫獲取遊戲類別及對應的編號
        fetch('http://localhost:8080/PolyBrain/item/ItemClass', {
            method: 'GET'
        })
            .then(response => {
                return response.json();
            })
            .then(itemClasses => {
                categoryMap = {}; // 清空 categoryMap，重新填充数据
                itemClasses.forEach(itemClass => {
                    categoryMap[itemClass.itemClassNo] = itemClass.itemClassName;
                });
            })
            .catch(error => {
                console.error("发生错误：", error);
            });

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
                url: "http://localhost:8080/PolyBrain/selectAllServlet",
                method: "POST",
                dataSrc: "" // 数据源为空，因为数据是直接数组
            },
            columns: [
                { data: 'itemNo' },
                {
                    data: 'itemClassNo',
                    render: data => categoryMap[data]
                },
                {
                    data: 'itemName',
                    render: function (data, type, row) {
                        return '<a href="" target="_blank">' + data + '</a>' // 這邊是加連結
                    }
                },
                { data: 'itemPrice' },
                { data: 'itemQty' },
                {
                    data: 'itemState',
                    render: data => data ? '<span class="text-primary">上架</span>' : '<span class="text-danger">下架</span>'
                },
                {
                    data: 'itemProdDescription', "className": "none"    //加none代表為上面第五種type默認隱藏
                }, {
                    data: null, title: "操作功能",  // 這邊是欄位
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
                    targets: [0, 1, 2, 3, 4, 5, 7],//_all才是全部欄
                    className: 'text-center'       //置中
                }
            ],
            // 其他设置...
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
        localStorage.setItem('editedRowData', JSON.stringify(rowData));
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

