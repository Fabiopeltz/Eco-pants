class Product{
    constructor(img, name, desc, price){
        this.img = img;
        this.name = name;
        this.desc = desc;
        this.price = price;
    }
}

function generateProducts() {
    let products = [];
    let p1 = new Product('./assets/img/calca9.jpg','Calça Sarja Preta','descdesc', '1234');
    products.push(p1);
    let p2 = new Product('./assets/img/calca8.jpg','Calça Sarja Bege','descdesc', '345');
    products.push(p2);
    let p3 = new Product('./assets/img/calca11.jpg','Calça Sarja Cinza','descdesc', '1567');
    products.push(p3);
    let p4 = new Product('./assets/img/calca12.jpg','Calça Jogger Azul','descdesc', '678');
    products.push(p4);
    let p5 = new Product('./assets/img/calca13.jpg','Calça Jogger Preta','descdesc', '123');
    products.push(p5);
    let p6 = new Product('./assets/img/calca14.jpg','Calça jogger Marinho','descdesc', '567');
    products.push(p6);
    let p7 = new Product('./assets/img/calca10.jpg','Calça Cargo Preta','descdesc', '789');
    products.push(p7);
    let p8 = new Product('./assets/img/calca.jpg','Calça Jeans','descdesc', '1689');
    products.push(p8);
    let p9 = new Product('./assets/img/calca8.jpg','Calça Sarja Bege','descdesc', '1689');
    products.push(p9);
    let p10 = new Product('./assets/img/calca9.jpg','Calça Sarja Preta','descdesc', '1689');
    products.push(p10);
    let p11 = new Product('./assets/img/calca12.jpg','Calça Jogger Azul','descdesc', '1689');
    products.push(p11);
    let p12 = new Product('./assets/img/calca11.jpg','Calça Sarja Cinza','descdesc', '1689');
    products.push(p12);
    let p13 = new Product('./assets/img/calca13.jpg','Calça Jogger Preta','descdesc', '1689');
    products.push(p13);
    let p14 = new Product('./assets/img/calca14.jpg','Calça Jogger Marinho','descdesc', '1689');
    products.push(p14);
    let p15 = new Product('./assets/img/calca8.jpg','Calça Sarja Bege','descdesc', '1689');
    products.push(p15);
    let p16 = new Product('./assets/img/calca9.jpg','Calça Sarja Preta','descdesc', '1689');
    products.push(p16);
    localStorage.setItem('products', JSON.stringify(products));
}

function getProducts() {
    JSON.parse(localStorage.getItem('products')).forEach((e,i) =>{
        if (i < 8) {
            document.querySelector('.section-products').insertAdjacentHTML('afterbegin', `
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="${e.img}" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${e.name}</h5>
                                <!-- Product price-->
                                R$${e.price}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-show-product" href="./app/product.html">Ver Produto</a></div>
                        </div>
                    </div>
                </div>
            `)
        } else {
            document.querySelector('.section-all-products').insertAdjacentHTML('afterbegin', `
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="${e.img}" alt="..." />
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
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-show-product" href="./app/product.html">Ver Opções</a></div>
                        </div>
                    </div>
                </div>
            `)
        }
        
    })
    
    document.querySelectorAll(".btn-show-product").forEach((e,i) => {
        e.addEventListener('click', () => {
            document.querySelectorAll('.fw-bolder').forEach((j,k) => {
                if(k == i){
                    localStorage.setItem('request', JSON.stringify(j.textContent));
                }
            })
        })
    })
}

generateProducts();
getProducts();
