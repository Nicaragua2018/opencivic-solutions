---
name: "colmena-content"
description: "Genera el paquete completo de producción para un video del canal La Colmena OpenCivic: guion por actos, prompts de Higgsfield para Honey/Miel, descripción YouTube con SEO, hashtags y copy de thumbnail. Usar cuando el usuario quiera crear contenido para La Colmena OpenCivic, genere un guion, prepare un video, o mencione temas del canal (gobernanza, Bitcoin, soberanía, cooperativismo, voto líquido, DAOs, CCC, colmena)."
---

# colmena-content — Generador de Paquetes de Producción

## Propósito

Este skill genera en una sola operación todo lo necesario para producir un video de La Colmena OpenCivic:
guion, prompts visuales para Higgsfield, descripción de YouTube, hashtags y copy del thumbnail.

El objetivo es mantener coherencia editorial — misma voz, misma filosofía, misma estética — sin recordar manualmente los lineamientos de marca en cada video.

---

## Contexto editorial

**Filosofía CCC:** Comunidad · Colaboración · Cooperativismo. Todo el contenido parte de aquí.

**Dos lemas clave:**
- "Podemos confiar, pero siempre hay que verificar" (puente entre confianza humana y herramientas digitales)
- "Los costos se reducen y los beneficios se aumentan" (argumento económico de la autoorganización)

**No partidista, pero firme ante los derechos humanos:** el canal no hace campaña por ningún partido ni candidato, y su narrativa general es propositiva y orgánica — siempre de la naturaleza hacia la tecnología. Pero denunciar violaciones de derechos humanos documentadas no es partidismo. Cuando el tema lo exige (por ejemplo, la dictadura en Nicaragua), se nombra con claridad, siempre con *datos que matan relatos*:
- Cada afirmación fuerte va con su fuente: informes de la ONU (como el Grupo de Expertos en Derechos Humanos sobre Nicaragua), la CIDH, organismos de derechos humanos o medios independientes.
- Si una calificación (por ejemplo, «terrorista» o «narcoterrorista») no es una designación oficial con fuente, se presenta como valoración del canal y se respalda con los hechos documentados.
- Las acusaciones de delitos a personas concretas solo se hacen citando la fuente que las documenta.
- Se cuida la seguridad de quien produce el canal y de sus familias: nada de datos personales ni detalles que puedan exponerlos.

**Metáfora central:** La colmena como modelo de organización descentralizada (Thomas Seeley, danza del meneo, voto líquido, quórum crítico). Este paralelismo biológico-tecnológico debe aparecer en cada video.

**Tono:** Introspectivo pero accesible. Cinematográfico en mini-docs. Didáctico y cercano en serie formativa. Nunca condescendiente.

**Personaje Honey/Miel:** Abejita 3D navy (#2C4A70) y dorado (#FFB800), ojos grandes expresivos, alas translúcidas, pin hexagonal en el pecho. Guía visual de todos los videos. No habla — sus acciones refuerzan el mensaje.

**Paleta:** Fondo #121212 (negro grafito), #2C4A70 (azul ciberespacial), #FFB800 (ámbar dorado).

---

## Tres líneas de contenido

Identifica a cuál pertenece el video antes de generar:

**Línea 1 — Ensayo / Minidocumental** (ancla del canal)
- Narrativa profunda, cinematográfica, 5–10 min
- 3 actos: problema → solución natural → puente tecnológico
- Ejemplos: diáspora tibetana, Thomas Seeley, vTaiwan, Bitcoin comunitario

**Línea 2 — Serie "Podemos confiar, pero siempre hay que verificar"**
- Didáctico y cercano, 3–5 min
- 4 partes: gancho → principio humano → principio tecnológico → guía práctica
- Honey como instructora

**Línea 3 — Serie "Los costos se reducen y los beneficios se aumentan"**
- Argumento empírico, 3–5 min
- Estructura: problema de coordinación → costo de intermediarios → alternativa cooperativa → cálculo práctico

---

## Formato de salida — 5 secciones en orden

### 1. GUION

Estructura por actos con:
- **Narración** (texto exacto a locutar, entrecomillado — leer en voz alta mentalmente para que fluya natural)
- **Honey action** (qué hace Honey: pose, gesto, dirección de mirada)
- **Visual / Animación** (qué aparece en pantalla)
- **SFX / Música** (efectos o mood musical)
- **Duración estimada** del acto

Al final, tabla de mapeo de assets:

| Acto | Duración | Asset recomendado | Honey action |
|------|----------|-------------------|--------------|

**Assets disponibles** en `~/Desktop/OpenCivic Solutions/Marca/`:
- `Animaciones/opencivic-anim-1-intro-sonido.mp4` — intro del logo
- `Animaciones/opencivic-anim-2-abeja-dibuja.mp4` — Honey dibujando/señalando
- `Animaciones/opencivic-anim-2-icono-bucle.mp4` — loop de hexágono
- `Animaciones/opencivic-anim-3-colmena-16x9.mp4` — colmena 16:9 para cierre
- `HONEY/HoneyEscribiendo.mp4` — Honey escribiendo (guías prácticas)

---

### 2. PROMPTS HIGGSFIELD

Un prompt por cada escena que necesite un clip nuevo de Honey no cubierto por los assets existentes.

**Formato:**
```
ESCENA: [nombre]
DURACIÓN: [segundos estimados]
PROMPT:
"Honey, a friendly 3D plush bee mascot character, navy blue (#2C4A70) and amber gold (#FFB800),
rounded chibi proportions, large expressive black eyes with white highlight, translucent light
blue wings with visible venation, hexagonal gold pin on chest, navy striped abdomen,
[ACCIÓN ESPECÍFICA DE HONEY],
dark space background #0b0f19, cinematic amber accent lighting,
professional 3D animation quality, clean motion graphics style"

MOOD: [dinámico / suave / reflexivo / celebratorio]
```

Si los clips pueden cubrirse con assets existentes, indicarlo y no generar prompts innecesarios.

**Acciones de Honey más comunes:**
- Bienvenida: `standing facing camera, arms slightly open in welcoming gesture, warm smile, antennas perked up`
- Señalando: `pointing with right arm toward a glowing diagram element, engaged expression, antennas forward`
- Danza meneo: `performing waggle dance motion, body shaking side to side, wings slightly spread, drawing figure-eight path with trail effect`
- Escribiendo: `sitting at small desk writing with tiny pencil, tongue slightly out in concentration`
- Incredulidad: `arms crossed over chest, skeptical eyebrow raised, head shaking slowly, antennas drooping`
- Cierre/guiño: `facing camera directly, winking right eye, one arm pointing downward, big smile`
- Celebración: `jumping with arms raised, wings flapping energetically, golden sparkles around`

---

### 3. DESCRIPCIÓN YOUTUBE

- **Párrafo de apertura** (2-3 oraciones, engancha en el primer scroll, incluir palabras clave naturalmente)
- **¿De qué trata este video?** (3-4 oraciones)
- **Lo que vas a aprender / descubrir**
- **Timestamps** (estimados según la estructura del guion)
- **Más videos relacionados:** (sugerencias temáticas)
- **Sobre La Colmena OpenCivic** (siempre al final):

> La Colmena OpenCivic es un canal dedicado a la ingeniería cívica, la autoorganización local y la alfabetización tecnológica para la soberanía individual. Aprende a organizarte por ti mismo. 🐝

---

### 4. HASHTAGS

Exactamente 15: 5 alta competencia (trending), 5 nicho medio, 5 long tail específicos del tema.

Incluir siempre al menos 3 del canal base:
`#LaColmenaOpenCivic #SoberaníaDigital #VotoLíquido #Gobernanza #Descentralización`

---

### 5. THUMBNAIL COPY

3 opciones, cada una con:
- **Texto principal** (máximo 4 palabras, fuente grande — legible en miniatura móvil)
- **Texto secundario** (máximo 6 palabras)
- **Visual** (qué imagen de Honey usar, fondo, acento de color)

---

## Principios de escritura (para que los guiones suenen humanos)

1. **De lo biológico a lo tecnológico, nunca al revés.** Empezar en la naturaleza, llegar a la tecnología.
2. **El problema es estructural, no humano.** No culpar a la gente común. La excepción son los responsables de violaciones de derechos humanos documentadas, que se nombran con su fuente.
3. **Propositivo, no reactivo.** Siempre terminar con una alternativa concreta.
4. **El vecino como unidad de análisis.** La escala correcta es el barrio, el gremio, la cooperativa — no el Estado ni el individuo aislado.

**Frases de apertura que funcionan:**
- "Imagina que [escenario concreto que el oyente puede visualizar]..."
- "[Dato sorprendente]. [Pregunta que genera tensión]."
- "Hay un experimento que se repite en la naturaleza desde hace millones de años..."

**Frase de cierre canónica:**
> "La colmena ya está en marcha. La pregunta es: ¿te atreves a formar parte del enjambre?"

---

## Instrucciones de uso

- Si el usuario da solo un tema amplio, generar directamente en la línea más apropiada — no preguntar a menos que sea genuinamente ambiguo.
- Si el usuario quiere solo una sección (ej. "solo los prompts de Higgsfield"), generar solo esa.
- Los guiones deben sonar naturales en voz alta. Revisar mentalmente el ritmo antes de finalizar.
- En la descripción de YouTube, incluir palabras clave en el primer párrafo de forma natural (no spam).

