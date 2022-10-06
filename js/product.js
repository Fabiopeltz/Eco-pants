function getProduct() {
    JSON.parse(localStorage.getItem('products')).forEach((e,i) =>{
        if(JSON.parse(localStorage.getItem('request')) == e.name){
                document.querySelector('.product-img').innerHTML = `<img id="main-image" src="../${e.img}" width="250"/>`;
                document.querySelector('.product-name').innerHTML = `${e.name}`;
                document.querySelector('.product-price').innerHTML = `R$${e.price}`;
                document.querySelector('.product-desc').innerHTML = `${e.desc}`;
        }
    })
}

function getProducts() {
    JSON.parse(localStorage.getItem('products')).forEach((e,i) =>{
        if(i < 8) {
            document.querySelector('.section-products').insertAdjacentHTML('afterbegin', `
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="../${e.img}" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${e.name}</h5>
                                <!-- Product price-->
                                $ ${e.price}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-product" href="./product.html">View product</a></div>
                        </div>
                    </div>
                </div>
            `)
        }
    })


    document.querySelector('.add-to-cart').addEventListener('click', () => {
        JSON.parse(localStorage.getItem('products')).forEach((e) => {
            if (document.querySelector('.product-name').textContent == e.name) {
                if (!localStorage.getItem('shopping-cart')) {
                    let products = [];
                    products.push(e);
                    localStorage.setItem('shopping-cart', JSON.stringify(products));
                } else {
                    let jsonCart = JSON.parse(localStorage.getItem('shopping-cart'));
                    jsonCart.push(e)
                    localStorage.setItem('shopping-cart', JSON.stringify(jsonCart));
                }
            }
        })
    })

    document.querySelectorAll(".btn-product").forEach((e,i) => {
        e.addEventListener('click', () => {
            document.querySelectorAll('.fw-bolder').forEach((j,k) => {
                if(k == i){
                    localStorage.setItem('request', JSON.stringify(j.textContent));
                }
            })
        })
    })
}

getProducts();

getProduct()
