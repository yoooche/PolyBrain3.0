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
    // 定义 DataTable 变量
    let dataTable = null;

    // 初始化 DataTable
    function initializeDataTable(data) {
        if (dataTable) {
            dataTable.destroy(); // 销毁当前的 DataTables 实例
        }

        dataTable = $('#itemTable').DataTable({
            "searching": false,
            "data": data, // 传递数据给 DataTable
            "columns": [
                { "data": "itemNo" },
                {
                    "data": "itemImg",
                    "render": function (data, type, row) {
                        // 如果是显示类型，返回包含图像的HTML
                        if (type === 'display' && data && data.length > 0) {
                            var imagesHTML = '';
                            imagesHTML += `<img src="${data}" alt="Image"><br>`;
                            return imagesHTML;
                        }
                        // 如果是排序或其他类型，返回原始数据
                        return data;
                    }
                },
                {
                    data: 'itemName', width: '180px',
                    render: function (data, type, row) {
                        const itemNo = row.itemNo; // 取得 itemNo 的值
                        const link = `http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=${itemNo}`;
                        return `<a href="${link}" target="_blank">${data}</a>`;
                    }
                },
                { "data": "itemPrice" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return '<button type="button" class="btn btn-danger btn-sm btn-remove">取消追蹤</button>'
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
                    targets: [0, 1, 2, 3, 4],//_all才是全部欄
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

    // 使用 fetch 获取数据
    fetch('http://localhost:8080/PolyBrain/loginRequired/Trace', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8',
        },
    })
        .then(resp => resp.json())
        .then(data => {
            console.log(data); // 在控制台查看获取的数据
            // 将数据传递给 DataTable 初始化函数
            initializeDataTable(data);
        })
        .catch(error => {
            console.error(error);
        });

    // 初始化 DataTable，首次加载 ，否則刪除與編輯無法使用
    initializeDataTable([]);

      // 點擊删除觸發燈箱及執行刪除
      $('#itemTable tbody').on('click', '.btn-remove', function () {
        const rowData = dataTable.row($(this).closest('tr')).data();
        itemNo = rowData.itemNo;

        // 使用燈箱效果顯示確認取消對話框
        Swal.fire({
            title: '確認要取消追蹤該項商品？',
            text: "點擊確認後將取消追蹤商品資料。",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '確定',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                // 若使用者確定取消，則發送刪除請求
                fetch('http://localhost:8080/PolyBrain/loginRequired/DeleteTrace', {
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

});
