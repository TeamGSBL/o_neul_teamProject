let foodCheckFrmElem = document.querySelector('#foodCheckFrm');
let foodImgElem = document.querySelector('#foodImg');
let foodInfoElem = document.querySelector('#foodInfo');

let foodNm = foodInfoElem.dataset.fnm;
console.log(foodInfoElem.dataset.fnm);

//배열node를 받아 배열값을 뽑아줌
const getCheckValue = (checkElem) =>{
    let returnArr=new Array();
    checkElem.forEach((item)=>{
        returnArr.push(item.value);
    });
    return returnArr;
}
//배열을 받고 foodCheckFrm과 비교해 체크값 넣어주기
const setCheckValue = (checkArr,name) =>{
    document.querySelectorAll(`input[name=${name}]`).forEach(function (item){
        checkArr.forEach((mainItem)=>{
            if(mainItem==item.value){
                item.checked = true;
            }
        });
    });
}

{
    //메인에서 가져온 조건
    let mainCookery = getCheckValue(document.querySelectorAll('.mainCookery'));
    let mainWorld = getCheckValue(document.querySelectorAll('.mainWorld'));
    let mainIgd = getCheckValue(document.querySelectorAll('.mainIgd'));
    let mainAlone = document.querySelector('.mainAlone').value;

    setCheckValue(mainCookery,'f_cookery');
    setCheckValue(mainWorld,'f_worlddiv');
    setCheckValue(mainIgd,'igd');
    if(mainAlone==1){
        document.querySelector('input[name="alone"]').checked = true;
    }
}


if(foodCheckFrmElem){
    //결과값 전송
    foodCheckFrmElem.addEventListener('submit',(e)=>{
        e.preventDefault();

        let resultAlone = document.querySelector('input[name="alone"]:checked');

        let f_cookery = getCheckValue(document.querySelectorAll('input[name="f_cookery"]:checked'));
        let f_worlddiv = getCheckValue(document.querySelectorAll('input[name="f_worlddiv"]:checked'));
        let igd = getCheckValue(document.querySelectorAll('input[name="igd"]:checked'));
        let alone = resultAlone!=null?resultAlone.value:0;


        fetch('/food/random',{
            'method': 'post',
            'headers': { 'Content-Type': 'application/json' },
            'body': JSON.stringify({f_cookery,f_worlddiv,igd,alone})
        }).then(res=>res.json())
            .then((data) => {
                console.log(data.f_nm);
                foodInfoElem.innerHTML = `
                    ${data.f_nm}
                `;
                getMapCurAddrKeyWord(data.f_nm);
                getImgByFdnm(data.f_nm);
            });

    });
}
//음식이름으로 이미지 가져오기
function getImgByFdnm(fdNm){
    fetch(`/img/search?search=${fdNm}`)
        .then(res=> res.json())
        .then((data) =>{
            console.log(data);
            foodImgElem.remove();
            for (var i = 0;i<4;i++){
                let imgElem = document.createElement('img');
                imgElem.className = 'circular--size200';
                imgElem.src = data.result[i]!=null?data.result[i].link:'/res/img/defualtFoodImg.jpg';
                foodInfoElem.append(imgElem);
            }
        });
}

//페이지 로딩시 먼저 실행하는 함수

getImgByFdnm(foodNm);
getMapCurAddrKeyWord(foodNm);
