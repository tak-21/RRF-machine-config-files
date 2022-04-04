M98 P"playsound.g"   
G90                  ; absolute positioning
G1 X0 Y-3 F6000      ; go outside print area
G92 E0.0             ; reset the extrusion distance
G1 E8                ; purge bubble
G1 X80 E15 F1000     ; intro line 1
G1 X160 E12.5 F1000  ; intro line 2
G92 E0.0             ; reset the extrusion distance
M400                 ; finish all moves, clear the buffer
