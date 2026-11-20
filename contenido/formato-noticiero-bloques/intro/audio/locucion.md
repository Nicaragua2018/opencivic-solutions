# Locución de la intro — Renacer, El Podcast Animado

Dos voces de ElevenLabs:
- **Él:** la voz «Faraón» (buscarla por nombre en la biblioteca de voces de la cuenta).
- **Ella:** una voz femenina en español latino, cálida y clara.

La música y los efectos ya están dentro de `intro.mp4`, `vertical.mp4` y `stinger.mp4` (generados con `sonido.py`). La locución se mezcla encima, con la música bajada unos 8 dB mientras se habla.

## Versión provisional (ya mezclada)
Mientras no haya voces de ElevenLabs, `intro.mp4` y `vertical.mp4` llevan voces gratuitas de Microsoft Edge (`edge-tts`):
- Él: `es-MX-JorgeNeural` (velocidad −8 %, tono −6 Hz), en lugar de Faraón.
- Ella: `es-MX-DaliaNeural`.
Las frases están en `voz/` y la mezcla en `intro-mezcla.wav` y `vertical-mezcla.wav` (música bajada automáticamente cuando hablan).
Para cambiar a Faraón: sustituir los WAV de `voz/` por los de ElevenLabs con el mismo nombre y repetir la mezcla.

## Intro horizontal y vertical (10 s)

| Tiempo | Voz | Texto | Qué se ve |
|---|---|---|---|
| 0,3–2,2 s | Él | «Renacer. El podcast animado.» | El logo cae en bloques |
| 2,9–4,2 s | Ella | «Desde el estudio…» | Estudio con los dos presentadores |
| 4,3–5,8 s | Él | «…y desde el lugar de los hechos.» | Se abre la plaza a la derecha |
| 6,0–7,6 s | Ella | **Gancho del episodio** (p. ej. «¿Por qué subió a ese avión?») | La plaza con la franja negra |
| 8,0–9,6 s | Él | «Esto es Renacer.» | Logo y faldón «EPISODIO» |

La línea de las 6,0 s cambia en cada episodio; el resto es fijo.

## Cortinilla (2,2 s)
Sin voz: solo el barrido y la campanita.

## Ajustes sugeridos en ElevenLabs
- Estabilidad media (≈ 50 %), similitud alta (≈ 75 %), estilo bajo.
- Exportar cada frase por separado en MP3 o WAV, para poder colocarlas en su segundo exacto.
