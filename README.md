# DCS/PLT Lab – Tank Level Control (MATLAB)

## Ziel
Dieses Repo dokumentiert ein kleines, aber realistisches PLT/DCS-Lernprojekt:
Ein Tank-Level (Strecke) wird mit einem PI/PID-Regler geführt, inkl. typischer
DCS-Beobachtungen (Trend, Stellgröße, Tuning-Entscheidungen).

## Was ist enthalten?
- MATLAB-Simulation: `src/tank_pid.m`
- Level-Regelkreis (PT1-Modell) + Reglerausgang u(t)
- Setpoint-Sprung (r(t)) zur Bewertung von Dynamik und Stabilität

## Wie ausführen?
1. MATLAB öffnen
2. Datei `src/tank_pid.m` starten (Run)
3. Zwei Plots prüfen:
   - Level vs. Sollwert
   - Reglerausgang (Stellgröße)

## Modell (vereinfacht)
Tank-Level als PT1-Strecke:
h_dot = (K*u - h) / tau

## Aktueller stabiler Tuning-Stand (Baseline)
- Kp = 4.0
- Ki = 0.05
- Kd = 0.0

## Protokoll (Entscheidungslog)
### Versuch 1 – Aggressives Tuning (zu unruhig)
- Parameter: Kp=8, Ki=0.4
- Beobachtung: Überschwingen + „zappelige“ Stellgröße
- Entscheidung: Ki deutlich reduzieren, da Integralanteil Pumpen verursacht

### Versuch 2 – Baseline (ruhig/stabil)
- Parameter: Kp=4, Ki=0.05
- Beobachtung: ruhiger Reglerausgang, stabiler Verlauf
- Entscheidung: Baseline als Referenz behalten

## Nächste Schritte
- Störung einbauen (z.B. zusätzlicher Abfluss ab t=150s)
- MAN/AUTO Umschaltung wie im DCS-Faceplate
- Alarme (HH/H/L/LL) + einfache Alarm-Logik
