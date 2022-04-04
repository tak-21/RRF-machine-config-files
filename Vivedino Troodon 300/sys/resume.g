; resume.g
; called before a print from SD card is resumed
;
M42 P1 S1.0           ; R-
M42 P2 S0.0           ; G-
M42 P3 S0.0           ; B-
G1 R1 X0 Y0 Z5 F2000  ; go to 5mm above position of the last print move
G1 R1 X0 Y0           ; go back to the last print move
M83                   ; relative extruder moves
M121                  ; recover the last state pushed onto the stack
