package analizadores;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java_cup.runtime.Symbol;

public class Main {
  public static void main(String[] args) throws IOException {
    //try {
      // 1) Preparamos el scanner y parser sobre entrada.txt
      FileReader fr = new FileReader("entrada.txt");
      Lexico scanner = new Lexico(fr);
      System.out.println(scanner);
      System.out.println(scanner.next_token());
      Symbol token;
      do {
          token = scanner.next_token();
          // token.sym es el código del token (int), token.value es el lexema u objeto asociado
          System.out.printf("Token: %-15s  Lexema: %s%n",
                  sym.terminalNames[token.sym],   // nombre legible del token
                  token.value                     // valor (lexema)
          );
      } while (token.sym != sym.EOF);

      fr.close();
      // Aqui ya tokenizamos la entrada
      // Ahora hay que reconocer el orden de la entrada y encriptarlo al mismo tiempo
      System.out.println("Analizador Lexico Terminado");
      // iniciamos el prceso de encriptado
      Sintactico parser = new Sintactico(scanner);
      //

    }
  }