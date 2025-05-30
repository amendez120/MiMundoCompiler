### Tokens para lexer.flex

#### 🏷️ Etiquetas de apertura y cierre
- `HTML_OPEN`       → `$html#`
- `HTML_CLOSE`      → `$/html#`
- `HEAD_OPEN`       → `$head#`
- `HEAD_CLOSE`      → `$/head#`
- `TITLE_OPEN`      → `$title#`
- `TITLE_CLOSE`     → `$/title#`
- `BODY_OPEN`       → `$body#`
- `BODY_CLOSE`      → `$/body#`
- `DIV_OPEN`        → `$div ... #`
- `DIV_CLOSE`       → `$/div#`
- `P_OPEN`          → `$p#`
- `P_CLOSE`         → `$/p#`
- `IMG_SINGLE`      → `$img ... /#`

#### 🔤 Atributos comunes
- `ATTR_ALIGN_LEFT`     → `align="left"`
- `ATTR_ALIGN_RIGHT`    → `align="right"`
- `ATTR_ALIGN_CENTER`   → `align="center"`
- `ATTR_ALIGN_JUSTIFY`  → `align="justify"`
- `ATTR_ALIGN_MIDDLE`   → `align="middle"`
- `ATTR_SRC`            → `src="image.png"`
- `ATTR_ALT`            → `alt="Image"`
- `ATTR_WIDTH_100`      → `width="100"`

#### 📄 Contenido de texto
- `TEXT_CONTENT`        → Texto plano entre etiquetas

#### 📑 Declaraciones especiales
- `DOCTYPE_DECLARATION` → `$!DOCTYPE html#`
- `LANG_ATTR`           → `lang="en"`
