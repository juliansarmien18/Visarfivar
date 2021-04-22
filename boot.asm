; boot.asm
        mov     ax, 0x07c0
        mov     ds, ax

        mov     si, msg
        cld     ;Borra el indicador DF en el registro EFLAGS
                ;Cuando el indicador DF se establece en 0,
                ;las operaciones de cadena incrementan
                ;los registros de índice (Este caso es SI)
ch_loop:
        lodsb   ;Carga un byte de SI a AL
                ;(Ya que estamos funcionando a 16 bits)
        or      al, al  ; str es 0?    
        jz      hang    ; salimos
        mov     ah, 0x0E
        mov     bh, 0
        int     0x10
        jmp     ch_loop

        hang:
        jmp     hang

        msg     db 'Bienvenido a VisarfiVar', 13, 10, 0
        times   510-($-$$) db 0
        db      0x55
        db      0xAA