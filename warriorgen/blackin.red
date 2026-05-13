;redcode-94
;name Bad Apple Black
;author ppygrlmel
;assert 1
;strategy TODO


;;; Set entry point
  org entry



;;; Identifiers
IDENTA dat #112, #112 ;'p', 'p'
IDENTB dat #103, #109 ;'g', 'm'



;;; Scan for location 0
scanner dat LAST-scan, 0

entry scan
  cmp.I $IDENTA, }scanner
  jmp scan, 0

  cmp.I $IDENTB, *scanner
  jmp scan

  mov 0, 1

LAST
  end
