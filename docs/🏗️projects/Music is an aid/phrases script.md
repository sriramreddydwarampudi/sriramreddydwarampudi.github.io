replace Phrases section with following raag


```python 

import mido
from mido import Message, MidiFile, MidiTrack

# Map swaras to MIDI notes (C4=60, Sa = C)
swara_to_midi = {
    "Sa": 60, "Ri": 62, "Ga": 63, "Ma": 65,  # Ma is F# (tivra)
    "Pa": 67, "Da": 69, "Ni": 70
}

# Define phrases (using swaras)
phrases = {
    "Natabhiravi Nyasa_Tana": ["Ma", "Ga", "Ri", "Sa"],          # Ma Ga Re Sa
    "Natabhiravi Upanta_Tana": ["Sa", "Ri", "Ma", "Pa", "Ma"],  # Sa Re Ma Pa Ma
    "Natabhiravi Puraka_Tana_1": ["Sa", "Pa", "Da", "Pa"],      # Sa Pa Da Pa
    "Natabhiravi Puraka_Tana_2": ["Ga", "Pa", "Da", "Pa"],      # Ga Pa Da Pa
    "Natabhiravi Puraka_Tana_3": ["Da", "Ma", "Ga", "Ri", "Sa"] # Da Ma Ga Re Sa
}

# Generate one MIDI file per phrase
for phrase_name, swaras in phrases.items():
    mid = MidiFile()
    track = MidiTrack()
    mid.tracks.append(track)
    
    # Add notes (quarter notes, 480 ticks per beat)
    for swara in swaras:
        note = swara_to_midi[swara]
        track.append(Message("note_on", note=note, velocity=64, time=0))
        track.append(Message("note_off", note=note, velocity=64, time=480))
    
    # Save to MIDI file
    mid.save(f"{phrase_name}.mid")

print("Generated MIDI files: Nyasa_Tana.mid, Upanta_Tana.mid, etc.")

```
Here’s a list of important raagas that are enough for you to become a solid composer—whether you're working in Carnatic, Hindustani, or fusion styles. These are foundational raagas used in countless compositions.


---

Carnatic Raagas – Must-Know Set (~30 raagas)

Melakarta Raagas (Parent raagas)

1. Mayamalavagowla – Basic for beginners (used to teach swaras)
2. Kalyani – Bright, majestic
3. Harikambhoji – Parent of many light ragas
4. Shankarabharanam – Like major scale
5. Kharaharapriya – Emotional and rich
6. Todi – Heavy, intense
7. Bhairavi – Devotional and soulful
8. Hanumatodi – Same as Todi, full version
9. Natabhairavi – Minor scale feel
10. Charukesi – Emotional and film-like



Janya Raagas (Derived ragas)

11. Mohanam – Pentatonic, sweet
12. Hamsadhwani – Bright, beginner-friendly
13. Abheri – Sad/romantic
14. Reetigowla – Gamaka-rich
15. Kambhoji – Majestic
16. Saveri – Peaceful, traditional
17. Suddha Dhanyasi – Soulful pentatonic
18. Devagandhari – Temple-feel
19. Yamunakalyani – Romantic, flowing
20. Bilahari – Happy, bright
21. Anandabhairavi – Gentle and feminine
22. Ranjani – Colorful, film-friendly
23. Sankarabharanam – Western C major equivalent
24. Arabhi – Energetic and vibrant
25. Kaanada – Deep and graceful
26. Pantuvarali – Intense and meditative
27. Begada – Royal and graceful
28. Madhyamavati – Peaceful, used at the end of concerts
29. Sri Raagam – Serious and devotional
30. Nattai – Grand opening raga




---

Hindustani Raagas – Must-Know Set (~20 ragas)

1. Yaman – Romantic, serene 
2. Bhairav – Spiritual, grave
3. Bhairavi – Devotional and flexible
4. Durga – Heroic, uplifting
5. Malkauns – Meditative, deep
6. Desh – Monsoon feel, light and lyrical
7. Bageshree – Romantic, gentle
8. Kafi – Sweet, folkish
9. Hamsadhwani – Carnatic import, bright
10. Marwa – Dusk-time, haunting
11. Todi – Serious and complex
12. Darbari Kanada – Heavy, majestic
13. Khamaj – Romantic, playful
14. Kedar – Calm, soothing
15. Miyan ki Malhar – Rainy, dramatic
16. Hindol – Morning, meditative
17. Jog – Semi-classical, soulful
18. Shivranjani – Emotional, popular in film
19. Megh – Monsoon mood
20. Ahir Bhairav – Blend of peace and devotion




---

Want a smaller essential list?

Here are 10 universal raagas (common to both systems or used in fusion):

Mohanam / Bhoop
Kalyani / Yaman
Shankarabharanam / Bilawal
Todi
Bhairavi
Kharaharapriya / Kafi
Hindolam / Malkauns
Hamsadhwani
Durga / Shuddha Saveri
Desh



---




# Mayamalavagowla




# Natabhiravi 

```python 
phrases = {
    "Natabhiravi Nyasa_Tana": ["Ma", "Ga", "Ri", "Sa"],          # Ma Ga Re Sa
    "Natabhiravi Upanta_Tana": ["Sa", "Ri", "Ma", "Pa", "Ma"],  # Sa Re Ma Pa Ma
    "Natabhiravi Puraka_Tana_1": ["Sa", "Pa", "Da", "Pa"],      # Sa Pa Da Pa
    "Natabhiravi Puraka_Tana_2": ["Ga", "Pa", "Da", "Pa"],      # Ga Pa Da Pa
    "Natabhiravi Puraka_Tana_3": ["Da", "Ma", "Ga", "Ri", "Sa"] # Da Ma Ga Re Sa
}

```



