package analizadores;

import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        // 1. Ruta al archivo de entrada que quieres procesar
        String nombreArchivo = "entrada.txt";

        FileReader fr = null;
        try {
            // 2. Crear FileReader (o Reader) para leer el archivo
            fr = new FileReader(nombreArchivo);

            // 3. Instanciar tu scanner (lexer) generado por JFlex
            //    "Lexico" es la clase que usas para tokenizar; asegúrate de que el constructor acepte un java.io.Reader
            Lexico scanner = new Lexico(fr);

            // (Opcional) Mostrar tokens crudos antes de analizar sintácticamente
            System.out.println("=== Tokens del Analizador Léxico ===");
            Symbol tokenLexer;
            do {
                tokenLexer = scanner.next_token();
                System.out.printf("Token: %-20s  Lexema: %s%n",
                        sym.terminalNames[tokenLexer.sym],
                        tokenLexer.value
                );
            } while (tokenLexer.sym != sym.EOF);

            System.out.println("Analizador Léxico terminado.\n");

            // 4. Reemplazamos el FileReader, para reenviar desde cero al parser
            fr.close();
            fr = new FileReader(nombreArchivo);
            scanner = new Lexico(fr);

            // 5. Invocar al parser sintáctico generado por Java CUP (clase "parser")
            //    Ajusta el nombre de la clase si tu parser se llama distinto
            Sintactico parser = new Sintactico(scanner);

            // 6. Llamar al método parse() para verificar que la entrada sea válida según la gramática
            Symbol resultado = parser.parse();

            // 7. Si no hubo error, el parseo fue exitoso.
            System.out.println("=== Análisis Sintáctico Exitoso ===");

            // Analisis Semantico
            // Encriptacion

        } catch (IOException e) {
            System.err.println("Error de E/S: " + e.getMessage());
        } catch (Exception e) {
            // Si ocurre un error durante el parseo, lo capturamos aquí:
            System.err.println("Error durante el análisis sintáctico: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 8. Asegurarse de cerrar el FileReader
            if (fr != null) {
                try {
                    fr.close();
                } catch (IOException ignored) {}
            }
        }
    }
}
