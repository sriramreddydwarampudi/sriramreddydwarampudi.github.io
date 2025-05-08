```
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

; A simple sine wave table
giwave ftgen 1, 0, 4096, 10, 1

; Instrument 1: Ārohana (Ascending glide)
instr 1
  kamp = 0.5
  kfreq expseg 300, 2, 800  ; Glide from 300Hz to 800Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 2: Avarohana (Descending glide)
instr 2
  kamp = 0.5
  kfreq expseg 800, 2, 300  ; Glide from 800Hz to 300Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 3: Dhirgha (Slow vibrato)
instr 3
  kamp = 0.5
  kcps = 440
  kvib oscili 20, 2, giwave  ; Slow vibrato (2Hz, ±20Hz)
  asig oscili kamp, kcps + kvib, giwave
  out asig
endin

; Instrument 4: Sphurita (Quick jump)
instr 4
  kamp linseg 0, 0.05, 0.5, 0.1, 0
  kfreq linseg 500, 0.05, 700  ; Quick jump 500→700Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 5: Kampita (Regular vibrato)
instr 5
  kamp = 0.5
  kcps = 440
  kvib oscili 10, 6, giwave  ; 6Hz vibrato (±10Hz)
  asig oscili kamp, kcps + kvib, giwave
  out asig
endin

; Instrument 6: Āhata (Struck from below)
instr 6
  kamp linseg 0, 0.1, 0.5, 0.5, 0
  kfreq expseg 300, 0.1, 500  ; Quick rise 300→500Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 7: Pratyāhata (Struck from above)
instr 7
  kamp linseg 0, 0.1, 0.5, 0.5, 0
  kfreq expseg 700, 0.1, 400  ; Quick fall 700→400Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 8: Tripuṭa (3-note oscillation)
instr 8
  kamp = 0.5
  kfreq linseg 440, 0.1, 660, 0.1, 440, 0.1, 660, 0.1, 440
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 9: Āndolita (Slow swing)
instr 9
  kamp = 0.5
  kswing oscili 100, 1, giwave  ; ±100Hz swing at 1Hz
  asig oscili kamp, 440 + kswing, giwave
  out asig
endin

; Instrument 10: Mūrchana (Glissando)
instr 10
  kamp = 0.5
  kfreq expseg 300, 1, 500, 1, 700, 1, 900  ; Multi-note glide
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 11: Plāvita (Gentle glide)
instr 11
  kamp = 0.5
  kfreq linseg 400, 3, 600  ; Slow glide 400→600Hz
  asig oscili kamp, kfreq, giwave
  out asig
endin

; Instrument 12: Misrita (Mixed gamaka)
instr 12
  kamp = 0.5
  kvib oscili 15, 5, giwave  ; Vibrato
  kbend linseg 0, 1, 100, 1, 0  ; Pitch bend
  asig oscili kamp, 440 + kvib + kbend, giwave
  out asig
endin

; Instrument 13: Ullāsita (Fast oscillation)
instr 13
  kamp = 0.5
  kjoy oscili 50, 8, giwave  ; Fast, wide vibrato
  asig oscili kamp, 440 + kjoy, giwave
  out asig
endin

; Instrument 14: Namita (Subtle vibrato)
instr 14
  kamp = 0.5
  ksoft oscili 2, 3, giwave  ; Very subtle vibrato (±2Hz)
  asig oscili kamp, 440 + ksoft, giwave
  out asig
endin

; Instrument 15: Mudrita (Hidden variation)
instr 15
  kamp = 0.5
  khidden randh 1, 0.5  ; Random microtonal variation
  asig oscili kamp, 440 + khidden, giwave
  out asig
endin

</CsInstruments>
<CsScore>
; Play each gamaka one after another
i 1 0 2    ; Ārohana
i 2 3 2    ; Avarohana
i 3 6 3    ; Dhirgha
i 4 10 0.2 ; Sphurita
i 5 11 2   ; Kampita
i 6 14 1   ; Āhata
i 7 16 1   ; Pratyāhata
i 8 18 0.5 ; Tripuṭa
i 9 19 3   ; Āndolita
i 10 23 3  ; Mūrchana
i 11 27 3  ; Plāvita
i 12 31 2  ; Misrita
i 13 34 2 ; Ullāsita
i 14 37 3 ; Namita
i 15 41 3 ; Mudrita
</CsScore>
</CsoundSynthesizer>

```