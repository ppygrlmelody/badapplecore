;redcode-94
;name Bad Apple White
;author ppygrlmel
;assert 1
;strategy Sits at location 0 and waits to be
;strategy hijacked by another process.
;strategy Calculates some numbers too
;TODO: Calculate some numbers too

;DATs to get scanned
IDENTA  dat #112, #112
IDENTB  dat #103, #109

;Set entry point
  org entry

entry
  jmp 0
  end
