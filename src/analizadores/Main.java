package analizadores;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java_cup.runtime.Symbol;

public class Main {
  public static void main(String[] args) {
    try {
      // 1) Preparamos el scanner y parser sobre entrada.txt
      FileReader fr = new FileReader("entrada.txt");
      Lexico scanner   = new Lexico(fr);
      Sintactico parser = new Sintactico(scanner);

      // 2) Lanzamos el parseo; nuestras acciones de CUP llenarán Sintactico.salida
      parser.parse();

      // 3) Obtenemos el HTML “crudo” generado
      String htmlSalida = Sintactico.salida.toString();

      // 4) Escribimos el HTML sin cifrar
      try (FileWriter fw = new FileWriter("salida.html")) {
        fw.write(htmlSalida);
      }

      // 5) Ciframos con A1Z26 y guardamos
      String htmlCifrado = Encriptador.cifrar(htmlSalida);
      try (FileWriter fw2 = new FileWriter("salida_cifrada.html")) {
        fw2.write(htmlCifrado);
      }

      // 6) Desencriptamos el resultado cifrado y lo mostramos
      String htmlDesencriptado = Encriptador.desencriptar(htmlCifrado);
      System.out.println("=== Texto desencriptado ===");
      System.out.println(htmlDesencriptado);

      System.out.println("¡Proceso completado! Revisa salida.html y salida_cifrada.html.");

    } catch (IOException e) {
      System.err.println("Error de E/S: " + e.getMessage());
      e.printStackTrace();
    } catch (Exception e) {
      System.err.println("Error durante el parseo o cifrado: " + e.getMessage());
      e.printStackTrace();
    }
  }
}
