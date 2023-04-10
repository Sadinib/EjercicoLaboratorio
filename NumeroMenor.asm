.data
msg1: .asciiz "Ingrese el primer número: "
msg2: .asciiz "Ingrese el segundo número: "
msg3: .asciiz "Ingrese el tercer número: "
msg4: .asciiz "El número menor es: "
.text
.globl main
main:
    # Imprimir msg1 y leer el primer número
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $s0, $v0 # Guardar el primer número en $s0

    # Imprimir msg2 y leer el segundo número
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $s1, $v0 # Guardar el segundo número en $s1

    # Imprimir msg3 y leer el tercer número
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $s2, $v0 # Guardar el tercer número en $s2

    # Comparar $s0 con $s1
    slt $t0, $s0, $s1
    beq $t0, 1, menor1
    move $t1, $s1 # Si $s1 es menor, almacenarlo en $t1
    j menor2

menor1:
    move $t1, $s0 # Si $s0 es menor, almacenarlo en $t1

menor2:
    # Comparar $t1 con $s2
    slt $t0, $t1, $s2
    beq $t0, 1, print
    move $t2, $s2 # Si $s2 es menor, almacenarlo en $t2
    j print_end

print:
    move $t2, $t1 # Si $t1 es menor, almacenarlo en $t2

print_end:
    # Imprimir msg4 y el número menor
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Salir del programa
    li $v0, 10
    syscall
