const API_KEY = '5%2F42Tgoge4aBc7Gapc9HBPLyyI4kq1Vx2ZZXAks1fVpekEQUxJHnJpARdCqWwdIGkKZ91w8XHqS25FL42vQUmA%3D%3D'
async function getData() {
	const url = `http://apis.data.go.kr/B551011/KorService/locationBasedList?ServiceKey=5%2F42Tgoge4aBc7Gapc9HBPLyyI4kq1Vx2ZZXAks1fVpekEQUxJHnJpARdCqWwdIGkKZ91w8XHqS25FL42vQUmA%3D%3D&contentTypeId=12&mapX=127.000535&mapY=37.267809&radius=5000&listYN=Y&MobileOS=ETC&MobileApp=AppTest&arrange=A&numOfRows=12&pageNo=1&_type=json`
	const response = await fetch(url)
	const data = await response.json()
	const list = data.response.body.items.item;
	const tourlist = document.querySelector(`.tour_list_wrap`)
	var titlelist = new Array();
	var addrlist = new Array();
	var imglist = new Array();
	var xmap = new Array();
	var ymap = new Array();
	for (let i = 0; i < list.length; i++) {
		titlelist.push(list[i].title)
		addrlist.push(list[i].addr1)
		imglist.push(list[i].firstimage)
		xmap.push(list[i].mapx)
		ymap.push(list[i].mapy)
	}
	for (let i = 0; i < list.length; i++) {
		let mainwrap = document.createElement('div')
		mainwrap.setAttribute("class", "mainwrap")

		let wraper = document.createElement('div');
		wraper.setAttribute("class", "wraper")

		let div1 = document.createElement('div')
		div1.setAttribute("class", "div1")

		let img = document.createElement('img')
		img.setAttribute("class", "firstimg")

		let div2 = document.createElement('div')
		div2.setAttribute("class", "div2")

		let h3 = document.createElement('h3')
		h3.setAttribute("class", "t_title")

		let p = document.createElement('p')

		let mapbtn = document.createElement('button')
		mapbtn.classList.add('btn_open_popup', 'btn','btn-primary', 'btn10')
		mapbtn.innerText = "위치보기"

		let xinput = document.createElement('input')
		xinput.setAttribute("type", "hidden")
		xinput.setAttribute("class", "xmap")

		let yinput = document.createElement('input')
		yinput.setAttribute("type", "hidden")
		yinput.setAttribute("class", "ymap")

		p.setAttribute("class", "t_address")
		p.innerText = addrlist[i]
		if (imglist[i] == '') {
			img.src = '/images/noimg.jpg'
		}
		else {
			img.src = imglist[i]
		}

		h3.innerText = titlelist[i]
		xinput.value = xmap[i]
		yinput.value = ymap[i]
		div2.append(h3)
		div2.append(p)

		div1.append(img)
		div1.append(div2)
		div1.append(xinput)
		div1.append(yinput)
		div1.append(mapbtn)

		wraper.append(div1)

		mainwrap.append(wraper)

		tourlist.append(mainwrap)


	}

	let body = document.querySelector('body');
	let modal = document.querySelector('.modalal');
	let btnOpenPopup = document.querySelectorAll('.btn_open_popup');
	btnOpenPopup.forEach((target) => {
		target.addEventListener('click', (e) => {
			modal.classList.toggle('show');

			if (modal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			var first = (e.target.parentElement.children[3]).value
			var second = (e.target.parentElement.children[2]).value
			var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div
				mapOption = {
					center: new kakao.maps.LatLng(first, second), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var markerPosition = new kakao.maps.LatLng(first, second);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position: markerPosition
			});

			marker.setMap(map);

		});
	});

	modal.addEventListener('click', (event) => {
		if (event.target === modal) {
			modal.classList.toggle('show');

			if (!modal.classList.contains('show')) {
				body.style.overflow = 'auto';
			}
		}
	});


}

getData()


function createmap(e) {
	var first = (e.parentElement.children[3]).value
	var second = (e.parentElement.children[2]).value
	var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div
		mapOption = {
			center: new kakao.maps.LatLng(first, second), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var markerPosition = new kakao.maps.LatLng(first, second);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});

	marker.setMap(map);
}