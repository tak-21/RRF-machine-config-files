; bed.g
; called to perform automatic bed compensation via G32
; discussion: https://forum.duet3d.com/topic/17872/automatic-bed-leveling-with-conditional-gcode-iterations
;
M561                                              ; clear any bed transform
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28                                             ; home all axis without mesh bed level
;
M558 F400 A3 S-1                                  ; z-probe, perform 3 probes and yield the average
G90                                               ; absolute positioning
while iterations <=2                              ; perform 2 passes
  G30 P0 X10 Y21 H0 Z-99999                       ; --- probe the bed at point 1 ---
  G30 P1 X10 Y291 H0 Z-99999                      ; --- probe the bed at point 2 ---
  G30 P2 X292 Y291 H0 Z-99999                     ; --- probe the bed at point 3 ---
  G30 P3 X292 Y21 H0 Z-99999 S4                   ; --- probe the bed at point 4 ---
  G1 X150 Y150 F10000	                            ; Move to center of bed
  G30                                             ; probe the bed
  M400                                            ; finish all moves, clear the buffer
;
M558 F400 A3 S-1                                  ; z-probe, perform 3 probes and yield the average
while move.calibration.initial.deviation >= 0.05  ; perform additional leveling if previous deviation was over 0.05mm
   if iterations = 5                              ; perform 5 addition checks, if needed
      M300 S3000 P500                             ; sound alert, the required deviation could not be achieved
      M558 F200 A1                                ; set normal z-probe speed
      abort "!!! ABORTED !!! Failed to achieve < 0.05 deviation. Current deviation is " ^ move.calibration.initial.deviation ^ "mm."
      G30 P0 X10 Y21 H0 Z-99999                   ; --- probe the bed at point 1 ---
      G30 P1 X10 Y291 H0 Z-99999                  ; --- probe the bed at point 2 ---
      G30 P2 X292 Y291 H0 Z-99999                 ; --- probe the bed at point 3 ---
      G30 P3 X292 Y21 H0 Z-99999 S4               ; --- probe the bed at point 4 ---
   G1 X150 Y150 F10000	                          ; Move to center of bed
   G30                                            ; probe the bed
   M400                                           ; finish all moves, clear the buffer
;
M558 F400 T8000 A1 S0.03                          ; for BL-Touch
;
echo "Gantry deviation of " ^ move.calibration.initial.deviation ^ "mm obtained."
;
G1 Z8                                             ; raise nozzle 8mm to ensure it is above the z probe trigger height
