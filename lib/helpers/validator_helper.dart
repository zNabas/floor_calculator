const kRequiredField = 'Campo obrigatório';

class ValidatorHelper {
  static String validarDados(String text) {
     if (text.isEmpty) return 'Campo obrigatório';
    if (double.parse(text.replaceAll(',', '.')) <= 0) return 'Número não pode ser 0 ou negativo';
    return null;
  }
}