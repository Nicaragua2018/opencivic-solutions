const { chromium } = require('playwright');
(async () => {
  const [html, out] = process.argv.slice(2);
  const b = await chromium.launch(); const p = await b.newPage({ viewport:{width:1300,height:2300}, deviceScaleFactor:1 });
  await p.goto('file://' + html, { waitUntil: 'networkidle' }); await p.evaluate(() => document.fonts.ready);
  const names = {t1:'01-paquete-no-lo-toques', t2:'02-voz-clonada-no-era-el', t3:'03-tarjetas-siempre-es-estafa'};
  for (const id of Object.keys(names)) await p.locator('#'+id).screenshot({ path: `${out}/${names[id]}.png` });
  await b.close();
})();
