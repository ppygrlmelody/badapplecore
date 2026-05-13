;redcode-94
;name Bad Apple White
;author ppygrlmel
;assert 1
;strategy Waits to get hijacked by black by idling after two
;strategy identifier DATs.
;strategy Serves as secondary color to generated image and addr 0



; Set entrypoint
org  entry


; Identifiers
IDENTA dat #112, #112
IDENTB dat #103, #109



; Idle indefinitely
entry
  jmp 0
  end
