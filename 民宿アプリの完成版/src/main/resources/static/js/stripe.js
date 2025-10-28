const stripe = Stripe('pk_test_51SHKqTFIalcLGkA6iZrxLQto32HmqKEWSLPkbhNjvX6ly7b3bEwnfCxaDhjiJrUudYb9Szelq0Aw7J7qhGPJ7i8H009HLC8TXZ');
const paymentButton = document.querySelector('#paymentButton');

paymentButton.addEventListener('click', () => {
 stripe.redirectToCheckout({
   sessionId: sessionId
 })
});