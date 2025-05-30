package analizadores;

public class Encriptador {
  // Cifra una cadena con A1Z26
  public static String cifrar(String texto) {
    StringBuilder sb = new StringBuilder();
    for (char c : texto.toCharArray()) {
      if (Character.isLetter(c)) {
        int base = Character.isUpperCase(c) ? 'A' : 'a';
        sb.append(c - base + 1).append(" ");
      } else {
        sb.append(c);
      }
    }
    return sb.toString().trim();
  }

  // Desencripta una cadena cifrada A1Z26
  public static String desencriptar(String textoCifrado) {
    StringBuilder sb = new StringBuilder();
    // Separa por espacios para extraer los números
    String[] tokens = textoCifrado.split(" ");
    for (String token : tokens) {
      if (token.matches("\\d+")) {
        int val = Integer.parseInt(token);
        // Solo valores entre 1 y 26 son letras
        if (val >= 1 && val <= 26) {
          char c = (char)('A' + val - 1);
          sb.append(c);
        } else {
          // Si está fuera de rango, lo dejamos literal
          sb.append(token);
        }
      } else {
        // No es número: puntuación, espacios, etc.
        sb.append(token);
      }
      sb.append(' '); // mantener separación
    }
    return sb.toString().trim();
  }
}
