//img패치
const getImg = (item,myFun,code) =>{
    fetch(`/img/search?search=${item.f_nm}`)
        .then(res=> res.json())
        .then((data) =>{
            myFun(data,code,item);
        });
};
//날씨 호출
const getWeather = (myFun)=>{
    window.navigator.geolocation.getCurrentPosition((pos)=>{
        var latitude = pos.coords.latitude
        var longitude = pos.coords.longitude

        let apiKey = "f359860a151ee1a83132eab18cdcac7e"
        let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude
            + "&lon=" + longitude
            + "&appid=" + apiKey;
        fetch(weatherUrl).then(function (res){
            return res.json();
        }).then(function (data){
            console.log(data)
            myFun(data);
        }).catch((error) => {
            console.log(error)
        })
    });
}
//날씨 폰트어썸 이미지
let weatherIcon = {
    '01' : 'fas fa-sun',
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
};


//오늘날짜 가져오기 함수
const getTodayKor = () =>{
    let today = new Date();

    let year = today.getFullYear(); // 년도
    let month = today.getMonth() + 1;  // 월
    let date = today.getDate();  // 날짜
    let day = today.getDay();  // 요일
    let dayKor;
    switch (day){
        case 0:
            dayKor='월요일'
            break;
        case 1:
            dayKor='화요일'
            break;
        case 2:
            dayKor='수요일'
            break;
        case 3:
            dayKor='목요일'
            break;
        case 4:
            dayKor='금요일'
            break;
        case 5:
            dayKor='토요일'
            break;
        case 6:
            dayKor='일요일'
            break;
    }

    let todayKor = year+'년 '+month+'월 '+date+'일 '+dayKor;
    console.log(todayKor);
    return todayKor;
}
//달 받고 계절리턴
const getSeason = (month) =>{
    console.log(typeof 1);
    let season ='';
    switch(month){
        case 1: case 2: case 12:
            season = "겨울";
            break;
        case 3: case 4: case 5:
            season = "봄";
            break;
        case 6: case 7: case 8:
            season = "여름";
            break;
        case 9: case 10: case 11:
            season = "가을";
            break;
    }
    return season;
}