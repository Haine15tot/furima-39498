// 販売手数料と販売利益の計算を行う関数
function calculatePrice(price) {
  const taxRate = 0.1; // 10%の販売手数料
  const tax = Math.floor(price * taxRate); // 販売手数料を計算
  const profit = price - tax; // 販売利益を計算

  return { tax, profit }; // 計算結果をオブジェクトで返す
}

// Turboフレームのloadイベントが発火したときの処理
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price"); // 金額を入力するinput要素
  const taxDom = document.getElementById("add-tax-price"); // 販売手数料を表示する要素
  const profitDom = document.getElementById("profit"); // 販売利益を表示する要素

  // 金額を入力するたびにイベント発火
  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value, 10); // 入力した金額を数値に変換
    const { tax, profit } = calculatePrice(price); // 計算関数を呼び出し、結果を取得

    taxDom.textContent = tax.toLocaleString(); // 販売手数料を表示
    profitDom.textContent = profit.toLocaleString(); // 販売利益を表示
  });
});