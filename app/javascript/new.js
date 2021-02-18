function feeCalc () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price")
    addTax.innerHTML = Math.floor(inputValue * 0.1)
    const subtraction = document.getElementById("profit")
    subtraction.innerHTML = inputValue - Math.floor(inputValue * 0.1)
  });
};
window.addEventListener('load', feeCalc );