;redcode-94
;name Bad Apple Black
;author ppygrlmel
;assert 1
;strategy Searches for white bad apple counterpart
;strategy then copies itself before the white process.
;strategy Draws the payload using the second process
;strategy to draw the odd pixels

;Constants
SCREEN_WIDTH  equ 10
SCREEN_HEIGHT equ 10
PADDING       equ 11

WHITE_ENTRY   equ 2

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

  ;Split to copy
  mov scanner, src
  sub.a #(src-scanner), src
  jmp *src

payload
  ;TODO: ZERO SCREEN
  ;Start white
  sub.a #(LAST-white_main)+WHITE_ENTRY, LAST+WHITE_ENTRY

  ;Kill 1 child
  spl (LAST)
  spl (SCREEN_WIDTH+PADDING)+LAST
  spl (SCREEN_WIDTH+PADDING)*2+LAST
  spl (SCREEN_WIDTH+PADDING)*3+LAST
  spl (SCREEN_WIDTH+PADDING)*1+LAST+1
  spl (SCREEN_WIDTH+PADDING)*2+LAST+2
  dat 0

white_main
  spl (SCREEN_WIDTH+PADDING)*2+LAST+3
  jmp 0

  dat 1, 2
  dat 3, 4
  dat 5, 6
  dat 7, 8
  dat 9, 0

LAST
  end
