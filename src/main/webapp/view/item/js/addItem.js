document.addEventListener("DOMContentLoaded", () => {
	const btn1 = document.querySelector('#addsubmit');
	const lightbox = document.querySelector('#lightbox');
	const btnCancel = document.querySelector('#cancel');
	const lightboxClose = document.querySelector('#lightbox-close');
	const lightboxMessage = document.querySelector('#lightbox-message');
	const itemPrice = document.querySelector('#itemPrice');
	const itemName = document.querySelector('#itemName');
	const itemQty = document.querySelector('#itemQty');
	const itemState = document.querySelector('#itemState');
	const inputs = document.querySelectorAll('input');
	const itemClassNoSelect = document.getElementById('itemClassNo');
	var p_file_el = document.getElementById("p_file");
	var preview_el = document.getElementById("preview");
	let categoryMap = {};//宣告categoryMap變數

	// 通過 fetch 取得遊戲類別列表
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

			// 生成選項並添加到遊戲類別的 select 元素中
			for (const category of itemClasses) {
				const option = document.createElement('option');
				option.value = category.itemClassNo;
				option.textContent = category.itemClassName;
				itemClassNoSelect.appendChild(option);
			}
		})
		.catch(error => {
			console.error("发生错误：", error);
		});


	// =========================== 拖拉圖片檔 ========================= //
	preview_el.addEventListener("dragover", function (e) {
		e.preventDefault();
		e.target.classList.add("-on");
	});
	preview_el.addEventListener("dragleave", function (e) {
		e.target.classList.remove("-on");
	});
	preview_el.addEventListener("drop", function (e) {
		e.preventDefault();

		e.target.classList.remove("-on");
		//console.log(e.dataTransfer.files); // 取得 files
		preview_img(e.dataTransfer.files[0]);
		p_file_el.value = ""; // 將 type="file" 那個清空
	});

	// =========================== 透過 File 取得預覽圖 ========================= //
	var preview_img = function (file) {

		var reader = new FileReader(); // 用來讀取檔案
		reader.readAsDataURL(file); // 讀取檔案
		reader.addEventListener("load", function () {
			//console.log(reader.result);
			/*
			let img_node = document.createElement("img"); // <img>
			img_node.setAttribute("src", reader.result); // <img src="base64">
			img_node.setAttribute("class", "preview_img"); // <img src="base64" class="preview_img">
			preview_el.innerHTML = '';
			preview_el.append(img_node);
			*/

			let img_str = '<img src="' + reader.result + '" class="preview_img">';
			preview_el.innerHTML = img_str;
		});
	};


	p_file_el.addEventListener("change", function (e) {
		if (this.files.length > 0) {
			preview_img(this.files[0]);
		} else {
			preview_el.innerHTML = '<span class="text">預覽圖</span>';
		}
	});



	//點擊送出按鈕後使用燈箱效果顯示確認取消對話框
	addsubmit.addEventListener('click', () => {
		let errorMsg = '';

		if (itemClassNo.value == 0) {
			errorMsg += '<li>請選擇遊戲類別';
		}
		if (itemName.value.length < 1 || itemName.value.length > 20) {
			errorMsg += '<li>商品名稱須介於1~20字';
		}
		if (itemPrice.value <= 99) {
			errorMsg += '<li>售價有誤請再確認';
		}
		if (itemQty.value < 1 && itemState.value == 2) {
			errorMsg += '<li>庫存量為0，不得上架';
		}
		if (minPlayers.value == 0 || maxPlayers.value == 0) {
			errorMsg += '<li>請選擇遊戲人數';
		}
		if (gameTime.value == 0) {
			errorMsg += '<li>請選擇遊戲時間';
		}
		if (errorMsg !== '') {
			const errorList = errorMsg.split('<li>').filter(item => item !== '').map((item, index) => {
				return `<li><span style="margin-right: 10px;">${index + 1}.</span>${item}</li>`;
			}).join('');

			// 使用 SweetAlert2 顯示錯誤視窗
			Swal.fire({
				icon: 'error',
				title: '新增商品失敗...',
				html: `<ul style="text-align: left; padding-left: 120px; list-style-position: inside;">${errorList}</ul>`,
			});
			return;
		}

		fetch('/PolyBrain/item/addItem', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=UTF-8',
			},
			body: JSON.stringify({
				itemClassNo: itemClassNo.value,
				itemName: itemName.value,
				itemPrice: itemPrice.value,
				itemState: itemState.value,
				itemQty: itemQty.value,
				minPlayer: minPlayers.value,
				maxPlayer: maxPlayers.value,
				gameTime: gameTime.value,
				itemProdDescription: itemProdDescription.value,
			}),
		})
			.then(resp => resp.json())
			.then(body => {
				console.log("Item Name Value:", itemName.value);
				const { success } = body;
				if (success) {
					for (let input of inputs) {
						input.disabled = true;
					}
					addsubmit.disabled = true;
					Swal.fire('新增成功').then(() => {
						window.location.href = "../item/itemConsole.html";
					});
				} else {
					Swal.fire({
						icon: 'error',
						title: '新增失敗...',
						text: '有些地方發生錯誤，請聯繫系統管理員!',
					})
				}
			});
	});

	//使用燈箱效果顯示確認取消對話框
	btnCancel.addEventListener('click', () => {
		Swal.fire({
			title: '確認要離開頁面？',
			text: "點擊確認後將不會儲存任何已輸入的資料。",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '確定',
			cancelButtonText: '取消'
		}).then((result) => {
			if (result.isConfirmed) {
				// 若使用者確定取消，則轉跳回商品後台列表
				window.location.href = "../item/itemConsole.html";
			}
		});
	});

	//點擊後關閉燈箱
	lightboxClose.addEventListener('click', () => {
		lightbox.style.display = 'none';
	});
});
