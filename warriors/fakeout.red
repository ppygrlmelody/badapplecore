;redcode-94
;name Fakeout
;author ppygrlmel
;assert 1
;strategy Nothing useful, just a hazard

;DATs to get scanned
IDENTA  dat #112, #112
IDENTA  dat #112, #112

IDENTB  dat #104, #109
IDENTB  dat #103, #109

IDENTA  dat #112, #112
IDENTB  dat #103, #109

;Set entry point
  org entry

entry
  jmp 0
  end
