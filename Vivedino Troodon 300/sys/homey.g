;homey.g
G91                ; relative positioning
G1 H2 Y0.5 F10000  ; energise motor to ensure it's not stalled
M400               ; wait for current moves to finish
G4 P200            ; wait 200ms
G1 H2 Z5 F6000     ; lift Z relative to current position
G1 H1 Y308 F1800   ; move quickly to Y axis endstop and stop there (first pass)
G1 Y300 F6000      ; go back a few mm
G1 H1 Y308 F360    ; move slowly to Y axis endstop once more (second pass)
G1 Z-5 F6000 H2    ; lower Z again
M400               ; wait for current moves to finish
G4 P200            ; wait 200ms
G90                ; absolute positioning
