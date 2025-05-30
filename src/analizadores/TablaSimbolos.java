package analizadores;

import java.util.*;

public class TablaSimbolos {
  private Deque<Map<String, Set<String>>> pila = new ArrayDeque<>();

  public TablaSimbolos() {
    pila.push(new HashMap<>());
  }

  // Entra en un nuevo ámbito (p.ej. al abrir una etiqueta compuesta)
  public void abrirAmbito() {
    pila.push(new HashMap<>());
  }

  // Sale de ámbito
  public void cerrarAmbito() {
    pila.pop();
  }

  // Registra un atributo válido para la etiqueta actual
  public void registrarAtributo(String etiqueta, String atributo) {
    pila.peek().computeIfAbsent(etiqueta, k -> new HashSet<>()).add(atributo);
  }

  // Comprueba semántica de un atributo en una etiqueta
  public boolean esAtributoValido(String etiqueta, String atributo) {
    for (Map<String, Set<String>> nivel : pila) {
      Set<String> attrs = nivel.get(etiqueta);
      if (attrs != null && attrs.contains(atributo)) return true;
    }
    return false;
  }
}
