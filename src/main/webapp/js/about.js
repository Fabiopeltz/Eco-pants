document.querySelector("#contactForm").addEventListener("submit", (e) => {
    e.preventDefault();

    let name = document.querySelector("#name").value;
    let email = document.querySelector("#email").value;
    let message = document.querySelector("#message").value;

    if(name == "" || email == "" || message == "") {
        window.alert("Preencha todos os Campos!");
    }else {
        console.log(`Nome: ${name}`);
        console.log(`Email: ${email}`);
        console.log(`Message: ${message}`);
        window.alert("Formulário enviado com sucesso!");
        location.reload()
    }
})