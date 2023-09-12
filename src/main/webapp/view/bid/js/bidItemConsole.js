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
                url: "http://localhost:8080/PolyBrain/BidItemList",
                method: "POST",
                data: function (d) {
                    return {
                        value: "selectAllBidItem"
                    };
                },
                dataSrc: "" 
            },
            columns: [
                { data: 'bidItemVo.bidItemNo', width: '120px' },
                {
                    data: 'bidItemPic', width: '130px',
                    render: function (data, type, row) {

                        if (type === 'display' && data && data.length > 0) { // 檢查data是否存在
                            var imagesHTML = '';
                            var base64Image = data[0];
                            // console.log(base64Image);
                            // var b = arrayBufferToBase64(base64Image);
                            imagesHTML += `<img src="data:image/jpeg;base64,${base64Image}" alt="Image"><br>`;
                            return imagesHTML;
                        }
                        return data;
                    }


                },
                {
                    data: 'bidItemVo.itemClass.itemClassName', width: '120px',
                },
                {
                    data: 'bidItemVo.bidItemName', width: '180px',
                    render: function (data, type, row) {
                        return '<a href="" target="_blank" style="text-decoration: none;">' + data + '</a>' // 這邊是加連結
                    }
                },
                {
                    data: 'bidItemVo.bidItemDescribe', "className": "none"    //加none代表為上面第五種type默認隱藏
                }, {
                    data: null, title: "操作功能", width: '150px',  // 這邊是欄位
                    render: function (data, type, row) {
                        return '<button type="button" class="btn btn-primary btn-sm btn-edit">編輯</button> ' +
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
        let bidItemName = $('#bidItemName').val();
        let bidItemDescribe = $('#bidItemDescribe').val();
        let gamePublisher = $('#gamePublisher').val();
        let itemClassNo = $('#itemClassNo').val();

        let data = {
            bidItemVo: {
                bidItemName: bidItemName,
                bidItemDescribe: bidItemDescribe,
                gamePublisher: gamePublisher,
                itemClassNo: itemClassNo

            },
            bidItemPic: bidItemPic
        }

        console.log(data);
        console.log(bidItemPic);
        fetch("http://localhost:8080/PolyBrain/BidItemAdd", {
            method: 'POST',
            headers: {'content-type': 'application/json;charset=UTF-8'},
            body: JSON.stringify(data)
        })
        .then(resp => resp.json())
        .then(data => {
            console.log(data.message);
        })
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

    ImgUpload();
    selectClass();

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
        sessionStorage.setItem('editedRowData', JSON.stringify(rowData));
        window.location.href = "../item/updateItem.html";

        //$('#editModal').modal('show');
    });

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
function selectClass(){ //下拉式選單動態生成

    fetch('/PolyBrain/general/bidding',{
        method: 'POST',
        headers: {
            'content-type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            message: 'selectClass'
        })
    })
    .then(resp => resp.json())
    .then(data => {
        // console.log('yyy')
        for(let itemClass of data){
            let option = document.createElement('option');
            option.value = itemClass.itemClassNo;
            option.textContent = itemClass.itemClassName;
            // console.log(option.value);
            // console.log(option.textContent);
            let itemClassSelect = document.getElementById('itemClassNo');
            itemClassSelect.appendChild(option);
        }
    })
    .catch(error => {
        console.log("error", error);
    });
}



