addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
  //  console.log(inputValue);
  })

  const addFee = document.getElementById("add-tax-price");

  priceInput.addEventListener("input", function(){
    const price = this.value
    const fee = Math.floor(price * 0.1)
    addFee.innerHTML = fee.toLocaleString();
    // console.log(salesFee);
  })

  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", function(){
    const price = this.value
    const fee = Math.floor(price * 0.1)
    const profitAmount = price - fee
    profit.innerHTML = profitAmount.toLocaleString();
    // console.log(addFee);
  })
})

  
// addEventListener('load', function(){

//   const sell = document.getElementById("item-price")
//   const tax = document.getElementById("add-tax-price")
// //   const profit = document.getElementById("profit")

//   sell.addEventListener('input', function(){
//     const price = this.value
//     const taxPrice = Math.floor(price * 0.1 )
//     // const profitPrice = Math.floor(price - taxPrice )
//     tax.innerHTML = taxPrice.toLocaleString();
// //     profit.innerHTML = profitPrice.toLocaleString();
//   })
// })
