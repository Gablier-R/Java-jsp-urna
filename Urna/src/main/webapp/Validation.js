// Obtém a data atual
var dataAtual = new Date().toISOString().split('T')[0];

// Obtém o campo de input da data
var campoData = document.getElementById("nascimento");

// Define o evento de validação quando o campo perde o foco
campoData.addEventListener("blur", function() {


  // Verifica se a data inserida é maior que a data atual
  if (inputData > dataAtual) {
    alert("A data não pode ser maior que a data atual.");

  }
});
