;redcode-94
;name Copy
;author sgb
;strategy Block copy code: traditional assy style

;Macro
OFFSET  equ 20

;Variables (data is arbitrary)
src   dat #1
dest  dat #2
count dat #3

;Initialize variables
start
  mov.ab  #last-src,            src
  mov.ab  #(last+OFFSET)-dest,  dest
  mov.ab  #last-src,            count

;Perform the copy
loop
  mov.i <src, <dest
  djn loop, count

;Jump to run the new copy
  jmp start+OFFSET

last  end start
