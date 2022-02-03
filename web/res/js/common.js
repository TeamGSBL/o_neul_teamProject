//img패치
const getImg = (searchKeyword,foodImgElem) =>{
    fetch(`/img/search?search=${searchKeyword}`)
        .then(res=> res.json())
        .then((data) =>{
            console.log(data);
            foodImgElem.src = data.result;
        });
};
