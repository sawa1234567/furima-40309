const price =() => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const price =parseInt(priceInput.value);
    if(price >= 300 && price < 10000000){
      addTaxDom.innerHTML = Math.floor(price * 0.1);
      ProfitDom.innerHTML = Math.floor(price - addTaxDom.innerHTML);
    } 
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);