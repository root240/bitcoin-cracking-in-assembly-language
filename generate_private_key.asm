section .data
    private_key resb 32

section .text
    global generate_private_key
generate_private_key:
    ; Generate 32 random bytes using the x86 RDRAND instruction
    mov ecx, 32
    mov rsi, private_key
loop_start:
    rdrand rax
    mov [rsi], rax
    add rsi, 8
    loop loop_start
    ret
