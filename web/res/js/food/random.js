let foodCheckFrmElem = document.querySelector('#foodCheckFrm');
if(foodCheckFrmElem){
    foodCheckFrmElem.addEventListener('submit',(e)=>{
        e.preventDefault();

        let resultIcook = document.querySelectorAll('input[name="icook"]:checked');
        let resultDining = document.querySelectorAll('input[name="dining"]:checked');
        let resultIgd = document.querySelectorAll('input[name="igd"]:checked');
        let resultAlone = document.querySelector('input[name="alone"]:checked');

        let icook = getCheckValue(resultIcook);
        let dining = getCheckValue(resultDining);
        let igd = getCheckValue(resultIgd);
        let alone = resultAlone!=null?resultAlone.value:0;

        const param = {icook,dining,igd,alone};

        fetch('/food/random',{
            'method': 'post',
            'headers': { 'Content-Type': 'application/json' },
            'body': JSON.stringify({icook,dining,igd,alone})
        }).then(res=>res.json())
            .then((data) => {
                console.log(data);
            });

    });
    const getCheckValue = (checkElem) =>{
        let returnArr=new Array();
        checkElem.forEach((item)=>{
            returnArr.push(item.value);
        });
        return returnArr;
    }
}