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
      "https://home.treasury.gov/news/press-releases/sm662",
      "https://home.treasury.gov/news/press-releases/sm1149",
      "https://home.treasury.gov/news/press-releases/jy0552",
      "https://en.wikipedia.org/wiki/Bryan%E2%80%93Chamorro_Treaty",
      "https://en.wikipedia.org/wiki/United_States_occupation_of_Nicaragua",
      "https://en.wikipedia.org/wiki/DBCP",
      "https://en.wikipedia.org/wiki/1972_Nicaragua_earthquake",
      "https://en.wikipedia.org/wiki/2018_Nicaraguan_protests",
      "https://en.wikipedia.org/wiki/Nicaragua_Canal",
      "https://en.wikipedia.org/wiki/Free_trade_agreements_of_China",
      "https://confidencial.digital/english/nicaragua-fraudulent-management-of-venezuelan-aid/",
      "https://confidencial.digital/english/the-right-to-know-about-albanisa/",
      "https://confidencial.digital/politica/espana-ofrece-la-nacionalidad-a-los-222-excarcelados-politicos-desterrados-por-ortega/",
      "https://confidencial.digital/principal/espana-dara-la-nacionalidad-a-todos-los-nicaraguenses-declarados-apatridas-por-ortega/",
      "https://confidencial.digital/politica/espana-supera-la-nacionalizacion-de-un-centenar-de-nicaraguenses-perseguidos-por-el-regimen/",
      "https://confidencial.digital/politica/espana-ofrece-nacionalidad-a-desterrados-de-nicaragua/",
      "https://es.wikipedia.org/wiki/Gioconda_Belli",
      "https://es.wikipedia.org/wiki/La_Prensa_(Nicaragua"
    )
    preguntas = @(
      "Haz una cronología de cómo Nicaragua ha cedido soberanía, recursos o dinero público desde 1909 hasta hoy. Cita las fuentes.",
      "¿Qué está documentado con fuente oficial y qué son acusaciones periodísticas? Separa ambas cosas con citas."
    )
  },
  @{
    titulo = "Investigación 02 - Democracia, justicia y cooperación"
    fuentes = @(
      "https://es.wikipedia.org/wiki/Clístenes_de_Atenas",
      "https://en.wikipedia.org/wiki/Indictment_and_arrest_of_Augusto_Pinochet",
      "https://es.wikipedia.org/wiki/Efraín_Ríos_Montt",
      "https://en.wikipedia.org/wiki/Alberto_Fujimori",
      "https://en.wikipedia.org/wiki/Citizens%27_Assembly_(Ireland",
      "https://en.wikipedia.org/wiki/Bowling_Alone",
      "https://www.latinobarometro.org/documents/informe-latinobarometro-2026.pdf",
      "https://en.wikipedia.org/wiki/2021_Salvadoran_political_crisis",
      "https://en.wikipedia.org/wiki/Leviathan_(Hobbes_book",
      "https://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.01.0046:chapter=22",
      "https://en.wikipedia.org/wiki/Rochdale_Principles",
      "https://en.wikipedia.org/wiki/Mondragon_Corporation"
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
      "https://www.migrationpolicy.org/system/files/2026-10/mpi-deportations-fact-sheet-2026-final.pdf",
      "https://www.migrationpolicy.org/news/new-era-enforcement-trump-2",
      "https://pmc.ncbi.nlm.nih.gov/articles/PMC7768760",
      "https://www.cato.org/sites/cato.org/files/2026-03/BP%20198.pdf",
      "https://itep.org/undocumented-immigrants-taxes-2024/",
      "https://nap.nationalacademies.org/catalog/23550",
      "https://www.govinfo.gov/content/pkg/FR-2025-07-08/html/2025-12621.htm",
      "https://forumtogether.org/wp-content/uploads/2026/10/Current-Status-of-DACA_Explainer_October2026.pdf",
      "https://tracreports.org/whatsnew/email.251118.html",
      "https://en.wikipedia.org/wiki/Mexican_Repatriation",
      "https://en.wikipedia.org/wiki/Operation_Wetback",
      "https://en.wikipedia.org/wiki/Temporary_protected_status"
    )
    preguntas = @(
      "¿Qué dicen los estudios sobre inmigración y delito, impuestos y salarios? Da cifras con su fuente.",
      "Compara las deportaciones de 1930, 1954 y las actuales con cifras y fuentes."
    )
  },
  @{
    titulo = "Investigación 04 - Sísifo y Miguel Ángel"
    fuentes = @(
      "https://www.theoi.com/Text/HomerOdyssey11.html",
      "https://atlas.perseus.tufts.edu/nodes/urn:cts:greekLit:tlg0012.tlg002.perseus-grc2:11.593/",
      "https://www.theoi.com/Text/Apollodorus1.html",
      "https://www.universalis.fr/encyclopedie/albert-camus/2-de-l-absurde-a-la-revolte/",
      "https://en.wikipedia.org/wiki/The_Myth_of_Sisyphus",
      "https://www.biblegateway.com/passage/?search=Eclesiast%C3%A9s+1%3A2-3&version=RVR1960",
      "https://www.theoi.com/Text/Pausanias2A.html",
      "https://en.wikipedia.org/wiki/The_Creation_of_Adam",
      "https://en.wikipedia.org/wiki/Sistine_Chapel_ceiling",
      "https://gutenberg.org/files/73109/73109-h/73109-h.htm",
      "https://www.margini.unibas.ch/web/rivista/numero_14/saggi/articolo3/barbero.pdf",
      "https://pubmed.ncbi.nlm.nih.gov/2205727/",
      "https://knowyourmeme.com/memes/one-must-imagine-sisyphus-happy"
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
