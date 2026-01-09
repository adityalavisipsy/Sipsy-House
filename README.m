<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIPSY HOUSE - Menu & Order Online</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #ff6b6b;
            color: white;
            text-align: center;
            padding: 20px;
        }

        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        #menu {
            margin-bottom: 40px;
        }

        .menu-item {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .menu-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
        }

        .menu-item div {
            flex: 1;
            margin-left: 15px;
        }

        button {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        #cart {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        #cart-items {
            margin-bottom: 20px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
        }

        @media (max-width: 768px) {
            .menu-item {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>SIPSY HOUSE</h1>
        <p>Welcome to SIPSY HOUSE! Check our menu and order delicious food via WhatsApp.</p>
    </header>
    
    <main>
        <section id="menu">
            <h2>Our Menu</h2>
            <div id="menu-items"></div>
        </section>
        
        <section id="cart">
            <h2>Your Order</h2>
            <div id="cart-items"></div>
            <button id="order-btn">Order via WhatsApp</button>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 SIPSY HOUSE. All rights reserved.</p>
    </footer>
    
    <script>
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
    </script>
</body>
</html>
