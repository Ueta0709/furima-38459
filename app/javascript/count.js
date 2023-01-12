function count (){
  const AddTaxPrice = document.getElementById("item-price");
  AddTaxPrice.addEventListener("keyup", () => {
    const countVal = AddTaxPrice.value;
    const charNum  = document.getElementById("add-tax-price");
    charNum.innerHTML = Math.floor(countVal*0.1);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(countVal*0.9);
  });
}
window.addEventListener('load', count);
