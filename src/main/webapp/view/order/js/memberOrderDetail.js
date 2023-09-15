window.addEventListener("load", function () {
    sendToController();
})



function sendToController() {
    fetch("http://localhost:8080/PolyBrain/findAllOrderDetail", {
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            
            // 獲取要設置圖片的容器元素
            const targetContainer = document.getElementById("targetImg");
            
            // 遍歷數據並添加圖片
            data.forEach(item => {
                // 創建新的img元素
                const img = document.createElement("img");
                
                // 設置img元素的src屬性
                img.src = item.itemImg;
                
                // 將img元素添加到容器中
                targetContainer.appendChild(img);
            });
        });
}



// function openOrderDetail(orderDetailData) {
//     console.log(orderDetailData);
//     const imgElements = document.querySelectorAll(".item-img");
//     orderDetailData.forEach(element => {
//         const orderDetail = element;
//             // 获取与当前索引对应的图像元素
//             const imgElement = imgElements;
//             imgElement.src = orderDetail.itemImg;
//             console.log(imgElement);
//     });
//     //  ( orderDetailData) {
//     //     const orderDetail = orderDetailData[i];
//     //     // 获取与当前索引对应的图像元素
//     //     const imgElement = imgElements[i];
//     //     imgElement.src = orderDetail.itemImg;
//     //     console.log(imgElement);
//     // }
// }

function openOrderDetail(orderDetailData) {
    console.log(orderDetailData);
    const imgElements = document.querySelectorAll(".item-img");

    // 使用map函数处理orderDetailData数组
    const imgSrcArray = orderDetailData.map(orderDetail => orderDetail.itemImg);

    // 将处理后的数据设置到对应的图片元素上
    imgElements.forEach((imgElement, i) => {
        imgElement.src = imgSrcArray[i];
        console.log(imgElement);
    });
}