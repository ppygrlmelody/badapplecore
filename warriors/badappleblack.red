;redcode-94
;name Bad Apple Black
;author ppygrlmel
;assert 1
;strategy Searches for white bad apple counterpart
;strategy then copies itself before the white process.
;strategy Draws the payload using the second process
;strategy to draw the odd pixels

;Set entry point
  org entry

;DATs to scan for ppgm
IDENTA  dat #112, #112
IDENTB  dat #103, #109
scanner dat LAST-scan, 0

entry scan
      ;Scan for IDENTA
      cmp.I $IDENTA, }scanner
count jmp scan, 0 ;B-field will be data for the copy
      ;Scan for IDENTB. Don't inc scanner
      cmp.I $IDENTB, *scanner

src   jmp scan, 0 ;B-field will be data for the copy
      jmp init, {scanner ;TODO: USELESS??

init
  ;Initialize copy
  ;sub.a #1, $scanner

  mov.ab #LAST-src, src
  ;mov.ab #20, dest ;TODO
  mov.ab #LAST-payload, count

copy
  mov.i <src, {scanner
  djn copy, count 

payload
  jmp 0
  dat 1, 2
  dat 3, 4
  dat 5, 6
  dat 7, 8
  dat 9, 0

LAST
  end
