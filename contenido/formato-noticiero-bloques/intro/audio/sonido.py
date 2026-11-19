"""Música de fondo y efectos sintetizados (originales) para la intro de Renacer.
Uso: python3 sonido.py <intro|vertical|stinger> <salida.wav>"""
import sys, wave, numpy as np
SR=48000; rng=np.random.default_rng(7)
def env(n,a=.005,r=.2):
    t=np.arange(n)/SR; e=np.minimum(1,t/max(a,1e-4))*np.exp(-t/r); return e
def tone(f,d,a=.005,r=.25,kind='pluck'):
    n=int(d*SR); t=np.arange(n)/SR
    if kind=='pluck': w=np.sin(2*np.pi*f*t)+.4*np.sin(4*np.pi*f*t)+.15*np.sin(6*np.pi*f*t)
    elif kind=='pad': w=sum(np.sin(2*np.pi*f*k*t+k)/k for k in (1,2,3))
    else: w=np.sin(2*np.pi*f*t)
    return w*env(n,a,r)
def lp(x,k):  # paso bajo simple
    y=np.convolve(x,np.ones(k)/k,mode='same'); return y
def noise(d): return rng.standard_normal(int(d*SR))
def whoosh(d=.55,up=True):
    n=int(d*SR); x=noise(d); out=np.zeros(n); seg=512
    for i in range(0,n,seg):
        p=i/n; k=int(4+ (110*(1-p) if up else 110*p)); out[i:i+seg]=lp(x[i:i+seg+k],k)[:len(out[i:i+seg])]
    e=np.sin(np.pi*np.linspace(0,1,n))**1.5; return out*e*.9
def pop(f=900): n=int(.09*SR); t=np.arange(n)/SR; fr=f*np.exp(-t*25); return np.sin(2*np.pi*np.cumsum(fr)/SR)*env(n,.001,.03)
def thud(): n=int(.25*SR); t=np.arange(n)/SR; fr=120*np.exp(-t*12)+45; return np.sin(2*np.pi*np.cumsum(fr)/SR)*env(n,.002,.09)*1.2
def chime(): return sum(tone(f,1.6,.003,.5,'sine')*g for f,g in ((1046.5,.5),(1318.5,.35),(1568,.3),(2093,.15)))
def tick(): return pop(2400)*.5
def bed(dur,bpm=112):
    n=int(dur*SR); m=np.zeros(n); beat=60/bpm
    prog=[(261.63,329.63,392.0),(196.0,246.94,293.66),(220.0,261.63,329.63),(174.61,220.0,261.63)]  # C G Am F
    bass=[130.81,98.0,110.0,87.31]; b=0; t=0.0
    while t<dur:
        bar=int(t/(beat*4))%4; s=int(t*SR)
        def add(x,at,g):
            a=int(at*SR); e=min(n,a+len(x)); 
            if a<n: m[a:e]+=x[:e-a]*g
        add(thud()*.9,t,.55)                       # bombo
        add(lp(noise(.05),3)*env(int(.05*SR),.001,.015),t+beat/2,.18)  # charles
        add(tone(bass[bar],beat*.9,.005,.25),t,.30)
        ch=prog[bar]; add(tone(ch[b%3]*2,beat*.5,.003,.12),t,.16); add(tone(ch[(b+1)%3]*2,beat*.5,.003,.12),t+beat/2,.13)
        if b%4==0: 
            for f in ch: add(tone(f,beat*4,.2,1.2,'pad'),t,.035)
        b+=1; t+=beat
    fade=np.ones(n); fo=int(.8*SR); fade[-fo:]=np.linspace(1,0,fo); fi=int(.15*SR); fade[:fi]=np.linspace(0,1,fi)
    return m*fade
EV={
 'intro':dict(dur=10,ev=[('pops',.65,7,.045),('pops',1.0,18,.045),('whoosh',2.35),('thud',2.9),('swoosh',3.2),('whoosh',4.25),('thud',4.8),('whoosh',5.45),('thud',6.0),('pop',6.45),('tick',6.7),('whoosh',7.35),('thud',7.9),('pops',8.35,7,.045),('pops',8.7,18,.045),('swoosh',8.9),('chime',9.1)]),
 'vertical':dict(dur=10,ev=[('pops',.65,7,.045),('pops',1.0,18,.045),('whoosh',2.35),('thud',2.9),('swoosh',3.4),('tick',3.5),('tick',5.4),('whoosh',7.35),('thud',7.9),('pops',8.35,7,.045),('pops',8.7,18,.045),('swoosh',8.9),('chime',9.1)]),
 'stinger':dict(dur=2.2,ev=[('whoosh',0.0),('thud',.6),('pops',1.05,7,.04),('chime',1.25),('whoosh',1.55)])}
def build(mode):
    c=EV[mode]; n=int(c['dur']*SR); out=np.zeros(n)
    def add(x,at,g):
        a=int(at*SR); e=min(n,a+len(x))
        if 0<=a<n: out[a:e]+=x[:e-a]*g
    if mode!='stinger': out+=bed(c['dur'])*.55
    for e in c['ev']:
        k,at=e[0],e[1]
        if k=='pops':
            for i in range(e[2]): add(pop(700+i*35),at+i*e[3],.22)
        elif k=='whoosh': add(whoosh(.55),at,.6)
        elif k=='swoosh': add(whoosh(.35,False),at,.3)
        elif k=='thud': add(thud(),at,.5)
        elif k=='pop': add(pop(600),at,.4)
        elif k=='tick': add(tick(),at,.35)
        elif k=='chime': add(chime(),at,.22)
    out=out/np.max(np.abs(out))*.85
    return out
if __name__=='__main__':
    mode,dst=sys.argv[1],sys.argv[2]; a=build(mode); st=np.stack([a,a],1)
    with wave.open(dst,'wb') as w: w.setnchannels(2);w.setsampwidth(2);w.setframerate(SR);w.writeframes((st*32767).astype('<i2').tobytes())
