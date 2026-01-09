// Sample menu data (customize with your items)
const menu = [
    { id: 1, name: "Margherita Pizza", price: 12.99, description: "Classic cheese pizza with tomato sauce.", image: "images/pizza.jpg" },
    { id: 2, name: "Chicken Burger", price: 9.99, description: "Juicy chicken patty with lettuce and mayo.", image: "images/burger.jpg" },
    { id: 3, name: "Caesar Salad", price: 7.99, description: "Fresh greens with Caesar dressing.", image: "images/salad.jpg" },
    // Add more items as needed
];

let cart = [];

// Display menu items
const menuContainer = document.getElementById('menu-items');
menu.forEach(item => {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'menu-item';
    itemDiv.innerHTML = `
        <img src="${item.image}" alt="${item.name}">
        <div>
            <h3>${item.name}</h3>
            <p>${item.description}</p>
            <p>$${item.price}</p>
            <button onclick="addToCart(${item.id})">Add to Cart</button>
        </div>
    `;
    menuContainer.appendChild(itemDiv);
});

// Add item to cart
function addToCart(id) {
    const item = menu.find(i => i.id === id);
    cart.push(item);
    updateCart();
}

// Update cart display
function updateCart() {
    const cartContainer = document.getElementById('cart-items');
    cartContainer.innerHTML = '';
    cart.forEach((item, index) => {
        const cartItem = document.createElement('div');
        cartItem.className = 'cart-item';
        cartItem.innerHTML = `
            <span>${item.name} - $${item.price}</span>
            <button onclick="removeFromCart(${index})">Remove</button>
        `;
        cartContainer.appendChild(cartItem);
    });
}

// Remove item from cart
function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

// Order via WhatsApp
document.getElementById('order-btn').addEventListener('click', () => {
    if (cart.length === 0) {
        alert('Your cart is empty!');
        return;
    }
    const total = cart.reduce((sum, item) => sum + item.price, 0).toFixed(2);
    const orderMessage = `Hello! I'd like to order:\n${cart.map(item => `- ${item.name} ($${item.price})`).join('\n')}\nTotal: $${total}`;
    const whatsappUrl = `https://wa.me/1234567890?text=${encodeURIComponent(orderMessage)}`; // Replace 1234567890 with your WhatsApp number
    window.open(whatsappUrl, '_blank');
});