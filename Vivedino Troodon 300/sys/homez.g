; homwz.g
M98 P"homex.g"      ; call homex.g
M98 P"homey.g"      ; call homey.g
G91                 ; relative positioning
G1 H2 Z0.5 F10000   ; energise motor to ensure it's not stalled
M400                ; wait for current moves to finish
G4 P200             ; wait 200ms
G90                 ; absolute positioning
M280 P0 S160        ; BLTouch, alarm release
G4 P100             ; BLTouch, delay for the release command
G1 X150 Y150 F3600  ; go to center of the bed
G30                 ; home Z by probing the bed
G1 Z1.15 F100       ; move Z to origin and 1.15mm above bed
M400                ; wait for current moves to finish
G4 P200             ; wait 200ms
