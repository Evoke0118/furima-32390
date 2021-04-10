window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price")
  
  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value;
    console.log(inputValue);
    const Tax = document.getElementById("add-tax-price");
    Tax.innerHTML = Math.floor(inputValue / 10);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = (inputValue - Tax.innerHTML);
    })
});





  

