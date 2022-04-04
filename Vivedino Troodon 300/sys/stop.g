; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
;
G10 P0 S-274 R-274  ; turn off extruder
M140 S0 R0          ; set bed temperature to 0C
M140 S-274          ; set bed temperature to 0K to turn it off
M107                ; turn off fan
