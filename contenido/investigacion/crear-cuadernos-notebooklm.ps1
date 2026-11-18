# Crea en tu NotebookLM un cuaderno por bloque de ideas, carga sus fuentes
# y guarda las respuestas a las preguntas clave en el Escritorio.
#
# Uso (en PowerShell, con notebooklm-py ya instalado y "notebooklm login" hecho):
#   powershell -ExecutionPolicy Bypass -File .\crear-cuadernos-notebooklm.ps1
#
# Si una fuente falla (página que bloquea a NotebookLM), el script sigue con la siguiente.

$salida = Join-Path $HOME "Desktop\Cuadernos-NotebookLM"
New-Item -ItemType Directory -Force -Path $salida | Out-Null

$cuadernos = @(
  @{
    titulo = "Investigación 01 - Nicaragua, la hacienda en liquidación"
    fuentes = @(
      "https://es.wikipedia.org/wiki/Tratado_Chamorro-Bryan",
      "https://history.state.gov/historicaldocuments/frus1913/ch95",
      "https://home.treasury.gov/news/press-releases/sm662",
      "https://home.treasury.gov/news/press-releases/sm1149",
      "https://home.treasury.gov/news/press-releases/jy0552",
      "https://en.wikipedia.org/wiki/2018_Nicaraguan_protests",
      "https://en.wikipedia.org/wiki/1972_Nicaragua_earthquake",
      "https://www.hrw.org/es/world-report/2025/country-chapters/nicaragua",
      "https://cpj.org/es/2021/08/la-policia-nicaraguense-allana-la-sede-del-diario-la-prensa-y-detiene-a-su-gerente-general-juan-lorenzo-holmann/",
      "https://gijn.org/es/articulos/perfil-confidencial-nicaragua/",
      "https://www.jurist.org/news/2026/02/french-appeals-court-rejects-award-for-nicaraguan-banana-workers/"
    )
    preguntas = @(
      "Haz una cronología de cómo Nicaragua ha cedido soberanía, recursos o dinero público desde 1909 hasta hoy. Cita las fuentes.",
      "¿Qué está documentado con fuente oficial y qué son acusaciones periodísticas? Separa ambas cosas con citas."
    )
  },
  @{
    titulo = "Investigación 02 - Democracia, justicia y cooperación"
    fuentes = @(
      "https://es.wikipedia.org/wiki/Cl%C3%ADstenes",
      "https://en.wikipedia.org/wiki/Arrest_and_trial_of_Augusto_Pinochet",
      "https://es.wikipedia.org/wiki/Efra%C3%ADn_R%C3%ADos_Montt",
      "https://es.wikipedia.org/wiki/Alberto_Fujimori",
      "https://en.wikipedia.org/wiki/Citizens%27_Assembly_(Ireland)",
      "https://en.wikipedia.org/wiki/Bowling_Alone",
      "https://www.latinobarometro.org",
      "https://www.marxists.org/espanol/rousseau/rousseau_cs.htm",
      "https://www.gutenberg.org/files/3207/3207-h/3207-h.htm",
      "https://www.gutenberg.org/ebooks/1497",
      "https://www.ica.coop/es/cooperativas/identidad-cooperativa"
    )
    preguntas = @(
      "¿Qué tienen en común las democracias que se debilitan y las que se recuperan? Usa ejemplos de las fuentes con citas.",
      "¿Qué dirían Rousseau, Hobbes y Platón de una república organizada como una cooperativa? Cita los pasajes."
    )
  },
  @{
    titulo = "Investigación 03 - Migración y deportaciones"
    fuentes = @(
      "https://ice.gov/doclib/eoy/iceAnnualReportFY2024.pdf",
      "https://www.migrationpolicy.org/news/new-era-enforcement-trump-2",
      "https://pmc.ncbi.nlm.nih.gov/articles/PMC7768760",
      "https://itep.org/undocumented-immigrants-taxes-2024/",
      "https://nap.nationalacademies.org/catalog/23550",
      "https://www.govinfo.gov/content/pkg/FR-2025-07-08/html/2025-12621.htm",
      "https://tracreports.org/whatsnew/email.251118.html",
      "https://www.history.com/articles/operation-wetback-eisenhower-1954-deportation"
    )
    preguntas = @(
      "¿Qué dicen los estudios sobre inmigración y delito, impuestos y salarios? Da cifras con su fuente.",
      "Compara las deportaciones de 1930, 1954 y las actuales con cifras y fuentes."
    )
  },
  @{
    titulo = "Investigación 04 - Sísifo y Miguel Ángel"
    fuentes = @(
      "https://en.wikipedia.org/wiki/Sisyphus",
      "https://es.wikipedia.org/wiki/El_mito_de_S%C3%ADsifo",
      "https://www.theoi.com/Text/HomerOdyssey11.html",
      "https://www.biblegateway.com/passage/?search=Eclesiast%C3%A9s+1&version=RVR1960",
      "https://knowyourmeme.com/memes/one-must-imagine-sisyphus-happy",
      "https://www.worldhistory.org/article/1607/michelangelos-sistine-chapel-ceiling/",
      "https://pubmed.ncbi.nlm.nih.gov/2205727/"
    )
    preguntas = @(
      "¿Por qué fue castigado Sísifo según cada fuente antigua, y qué conclusión saca Camus? Cita las fuentes.",
      "¿Hay pruebas de que Miguel Ángel escondiera una protesta contra el papa en la Capilla Sixtina? Separa hechos de interpretaciones."
    )
  }
)

$n = 0
foreach ($c in $cuadernos) {
  $n++
  Write-Host "`n=== $($c.titulo) ===" -ForegroundColor Yellow
  notebooklm create $c.titulo --use
  foreach ($u in $c.fuentes) {
    Write-Host "Añadiendo: $u"
    notebooklm source add $u
    if ($LASTEXITCODE -ne 0) { Write-Host "  (no se pudo añadir, sigo)" -ForegroundColor DarkYellow }
  }
  $archivo = Join-Path $salida ("{0:D2}-respuestas.txt" -f $n)
  "# $($c.titulo)`n" | Out-File -FilePath $archivo -Encoding utf8
  $primera = $true
  foreach ($q in $c.preguntas) {
    Write-Host "Preguntando: $q"
    if ($primera) { $r = ("y" | notebooklm ask --new $q) ; $primera = $false } else { $r = notebooklm ask $q }
    "## $q`n$($r -join "`n")`n" | Out-File -FilePath $archivo -Encoding utf8 -Append
  }
  Write-Host "Respuestas guardadas en $archivo" -ForegroundColor Green
}
Write-Host "`nListo. Revisa la carpeta $salida y tus cuadernos en notebooklm.google.com" -ForegroundColor Green
