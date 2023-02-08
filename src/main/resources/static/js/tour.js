const API_KEY = '5%2F42Tgoge4aBc7Gapc9HBPLyyI4kq1Vx2ZZXAks1fVpekEQUxJHnJpARdCqWwdIGkKZ91w8XHqS25FL42vQUmA%3D%3D'
async function getData(){
    const url = `http://apis.data.go.kr/B551011/KorService/locationBasedList?ServiceKey=5%2F42Tgoge4aBc7Gapc9HBPLyyI4kq1Vx2ZZXAks1fVpekEQUxJHnJpARdCqWwdIGkKZ91w8XHqS25FL42vQUmA%3D%3D&contentTypeId=12&mapX=127.000535&mapY=37.267809&radius=5000&listYN=Y&MobileOS=ETC&MobileApp=AppTest&arrange=A&numOfRows=48&pageNo=1&_type=json`
    const response = await fetch(url)
    const data = await response.json()
    const list = data.response.body.items.item;
    const tourlist = document.querySelector(`.tour_list_wrap`)
    var titlelist = new Array();
    var addrlist = new Array();
    var imglist = new Array();
    for(let i=0; i<list.length; i++){
        titlelist.push(list[i].title)
        addrlist.push(list[i].addr1)
        imglist.push(list[i].firstimage)
    }
    for(let i = 0; i<list.length; i++){
        let wraper = document.createElement('div');
        wraper.setAttribute("class","wraper")
        let div1 = document.createElement('div')
        div1.setAttribute("class","div1")
        let img = document.createElement('img')
        img.setAttribute("class","img")
        let div2 = document.createElement('div')
        div2.setAttribute("class","div2")
        let h3 = document.createElement('h3')
        h3.setAttribute("class","t_title")
        let p = document.createElement('p')
        p.setAttribute("class","t_address")
        p.innerText=addrlist[i]
        if(imglist[i]==''){
            img.src = '/images/noimg.jpg'
        }
        else{
            img.src = imglist[i]
        }

        h3.innerText = titlelist[i]
        div2.append(h3)
        div2.append(p)
        div1.append(img)
        div1.append(div2)
        wraper.append(div1)
        tourlist.append(wraper)
    }


}

getData()