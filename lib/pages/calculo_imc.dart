import 'dart:io';

String calculo_imc(weightController, heightController) {
  String text = 'Informe um valor';
  String erro = 'Informe um valor diferente de 0';

  double weight = double.parse(weightController.text);
  double height = double.parse(heightController.text) / 100;



  double imc = 0;

  imc = weight / (height * height);
    if (imc > 0 && imc < 18.6) {
    text = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
  } else if (imc >= 18.6 && imc <= 24.9) {
    text = "Peso Ideal (${imc.toStringAsPrecision(4)})";
  } else if (imc >= 24.9 && imc <= 29.9) {
    text = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
  } else if (imc >= 24.9 && imc <= 34.9) {
    text = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
  } else if (imc >= 34.9 && imc <= 39.9) {
    text = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
  } else if (imc >= 40) {
    text = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
  }

  if (height != 0 && weight != 0) {
    return text;}
    else {return erro;}
}




