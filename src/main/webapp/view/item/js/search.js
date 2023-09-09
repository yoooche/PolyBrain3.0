
function getProduct(move, numberpage, set) {
    // 清除原有商品列表
    const itemList = document.getElementById('itemList');
    while (itemList.firstChild) {
        itemList.removeChild(itemList.firstChild);
    }

    // 清除原有頁碼列表
    const pageList = document.getElementById('pageList');
    while (pageList.firstChild) {
        pageList.removeChild(pageList.firstChild);
    }

    // 以下為翻頁邏輯

    scrollTo({
        top: 0,
        behavior: 'smooth'
    }); // 點擊頁碼後平滑移動到頁面最上方

    switch (move) {
        case "page":
            // 處理點擊頁碼的邏輯
            currentPage = numberpage;
            break;
        case "prev":
            // 處理點擊上一頁的邏輯
            currentPage--;
            if (currentPage < 1) {
                currentPage = 1;
            }
            break;
        case "next":
            // 處理點擊下一頁的邏輯
            currentPage++;
            break;

    }

    // 發送請求獲取商品數據
    fetch("http://localhost:8080/PolyBrain/selectServlet?value=selectpage&page=" + currentPage + "&set=" + set, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json;charset=UTF-8' },
    })
        .then(response => response.json()) // 解析JSON響應
        .then(data => {
            const totalPages = data.totalPages;
            const items = data.items;

            // 遍歷商品數據並渲染每個商品卡片
            items.forEach(item => {
                const cardColumn = document.createElement('div');
                cardColumn.classList.add('col', 'mb-5'); // 添加class
                cardColumn.innerHTML = `
                    <div class="card">
                        <div class="image-container">
                            <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=${item.itemNo}">
                                <img class="card-img-top" src="${item.itemImg[0].itemImg}" alt="商品圖片" itemState ="${item.itemState}">
                            </a>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">${item.itemName}</h5>
                                類別：${item.itemClass.itemClassName}類
                                <span>$${item.itemPrice}</span>
                            </div>
                            <div class="text-center">
                            遊戲人數：${item.minPlayer}人到${item.maxPlayer}人
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="#">收藏</a>
                                <a class="btn btn-outline-dark mt-auto" href="#" >加入購物車</a>
                            </div>
                        </div>
                    </div>
                `;
                itemList.appendChild(cardColumn);

                // 取得插入的 card-img-top 元素
                const cardImgTop = cardColumn.querySelector('.card-img-top');
                // 取得 itemState 属性的值
                const itemState = cardImgTop.getAttribute('itemState');

                // 如果是已售完狀態，插入 Sale 符號
                if (itemState === '2') {
                    cardImgTop.insertAdjacentHTML('beforebegin', '<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem" >已售完</div>');
                }
            });

            getPage(totalPages, currentPage);
        })
        .catch(error => {
            // 處理錯誤
            console.error('獲取數據時出現問題:', error);
        });
}


// 生成頁碼的函數
function getPage(totalPages, currentPage) {
    const pageList = document.getElementById('pageList');

    // 上一頁按鈕
    if (currentPage > 1) {
        const prevItem = document.createElement('li');
        prevItem.innerHTML = `<a href="javascript:getProduct('prev');"><</a>`;
        pageList.appendChild(prevItem, pageList.firstChild);
    }

    // 生成頁碼按鈕
    for (let i = 1; i <= totalPages; i++) {
        const listItem = document.createElement('li');
        if (i === currentPage) {
            listItem.classList.add('active');
        }
        listItem.innerHTML = `<a href="javascript:getProduct('page', ${i},set);">${i}</a>`;
        pageList.appendChild(listItem);
    }

    // 下一頁按鈕
    if (currentPage < totalPages) {
        const nextItem = document.createElement('li');
        nextItem.innerHTML = `<a href="javascript:getProduct('next');">></a>`;
        pageList.appendChild(nextItem);
    }
}

// 頁面加載完成後執行獲取第一頁商品
window.addEventListener('DOMContentLoaded', event => {
    // 動態生成各個按鈕
    set = "";   //將set初始化清空
    getProduct("page", 1, set);
});


// 串接指令區

queryParams = {};

//價格條件設定
function PriceClick(minPrice, maxPrice) {
    // 如果minPrice和maxPrice已經存在，將數值移除
    if (minPrice === 0 && queryParams.hasOwnProperty('minPrice')) {
        delete queryParams.minPrice;
    }
    if (maxPrice === 0 && queryParams.hasOwnProperty('maxPrice')) {
        delete queryParams.maxPrice;
    }

    // 设置minPrice和maxPrice属性为新的值
    if (maxPrice != 0 || minPrice != 0) {
        queryParams.minPrice = minPrice;
        queryParams.maxPrice = maxPrice;
    }
    
    searchItem(queryParams);
}

//遊戲類型條件設定
function TypeClick(ItemClassNo) {
    // 如果類型已經存在，將數值移除
    if (queryParams.hasOwnProperty('ItemClassNo')) {
        delete queryParams.ItemClassNo;
    }
    // 將ItemClassNo設置進去
    if (ItemClassNo != 0) {
        queryParams.ItemClassNo = ItemClassNo;
    }

    searchItem(queryParams);
}

//遊戲人數條件設定
function PlayerClick(playerCount) {
    // 如果類型已經存在，將數值移除
    if (queryParams.hasOwnProperty('playerCount')) {
        delete queryParams.playerCount;
    }
    // 將ItemClassNo設置進去
    if (playerCount != 0) {
        queryParams.playerCount = playerCount;
    }

    searchItem(queryParams);
}

function TimeClick(gameTime){
    if (queryParams.hasOwnProperty('gameTime')) {
        delete queryParams.gameTime;
    }
    // 將ItemClassNo設置進去
    if (gameTime != 0) {
        queryParams.gameTime = gameTime;
    }
    searchItem(queryParams);

}


//文字串接區
function searchItem(queryParams) {
    let set = '';

    // 构建售价范围条件
    if (queryParams.minPrice !== undefined && queryParams.maxPrice !== undefined) {
        set += ` AND itemPrice BETWEEN ${queryParams.minPrice} AND ${queryParams.maxPrice} `;
    }

    // 构建游戏类型条件
    if (queryParams.ItemClassNo !== undefined) {
        set += ` AND itemClassNo = ${queryParams.ItemClassNo} `;
    }

    // 构建玩家人数条件
    if (queryParams.playerCount !== undefined) {
        set += ` AND minPlayer <= ${queryParams.playerCount} AND maxPlayer >= ${queryParams.playerCount} `;
    }

    // 构建所需时间条件
    if (queryParams.gameTime !== undefined) {
        set += ` AND gameTime = ${queryParams.gameTime} `;
    }

    if (queryParams.gameName !== undefined) {
        set += ` AND itemName LIKE = %${queryParams.gameTime}% `;
    }

    console.log(set);
    // return set;
    //啟動條件搜尋 並到第一頁
    getProduct("page", 1, set);
}
