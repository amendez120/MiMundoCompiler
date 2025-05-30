//----------------------------------------------------
// The following code fue adaptado para tokens HTML
//----------------------------------------------------

package analizadores;

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int EOF = 0;
  public static final int ERROR = 1;

  public static final int PTCOMA = 2;
  public static final int PARIZQ = 3;
  public static final int PARDER = 4;
  public static final int CORIZQ = 5;
  public static final int CORDER = 6;
  public static final int MAS = 7;
  public static final int MENOS = 8;
  public static final int POR = 9;
  public static final int DIVIDIDO = 10;
  public static final int ENTERO = 11;
  public static final int DECIMAL = 12;
  public static final int UMENOS = 13;
  public static final int REVALUAR = 14;

  // Nuevos tokens para HTML "estilo $...#"
  public static final int DOCTYPE_DECLARATION = 15;
  public static final int HTML_OPEN = 16;
  public static final int HTML_CLOSE = 17;
  public static final int HEAD_OPEN = 18;
  public static final int HEAD_CLOSE = 19;
  public static final int TITLE_OPEN = 20;
  public static final int TITLE_CLOSE = 21;
  public static final int BODY_OPEN = 22;
  public static final int BODY_CLOSE = 23;

  public static final int DIV_ALIGN_LEFT = 24;
  public static final int DIV_ALIGN_RIGHT = 25;
  public static final int DIV_ALIGN_CENTER = 26;
  public static final int DIV_ALIGN_JUSTIFY = 27;
  public static final int DIV_CLOSE = 28;

  public static final int IMG_ALIGN_MIDDLE = 29;
  public static final int IMG_WIDTH_100 = 30;

  public static final int P_OPEN = 31;
  public static final int P_CLOSE = 32;

  public static final int LANG_ATTR = 33;
  public static final int TEXT_CONTENT = 34;

  public static final String[] terminalNames = new String[] {
          "EOF",
          "ERROR",
          "PTCOMA",
          "PARIZQ",
          "PARDER",
          "CORIZQ",
          "CORDER",
          "MAS",
          "MENOS",
          "POR",
          "DIVIDIDO",
          "ENTERO",
          "DECIMAL",
          "UMENOS",
          "REVALUAR",
          "DOCTYPE_DECLARATION",
          "HTML_OPEN",
          "HTML_CLOSE",
          "HEAD_OPEN",
          "HEAD_CLOSE",
          "TITLE_OPEN",
          "TITLE_CLOSE",
          "BODY_OPEN",
          "BODY_CLOSE",
          "DIV_ALIGN_LEFT",
          "DIV_ALIGN_RIGHT",
          "DIV_ALIGN_CENTER",
          "DIV_ALIGN_JUSTIFY",
          "DIV_CLOSE",
          "IMG_ALIGN_MIDDLE",
          "IMG_WIDTH_100",
          "P_OPEN",
          "P_CLOSE",
          "LANG_ATTR",
          "TEXT_CONTENT"
  };
}
