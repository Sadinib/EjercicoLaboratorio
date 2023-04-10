.data
msg:
    .asciiz "Fin del programa\n"
max:
    .word 20  # variable que contiene el número máximo de elementos de la serie

.text
    .globl main

main:
    # inicializar los primeros dos números de la serie
    li $t0, 0
    li $t1, 1
    
    # imprimir los primeros dos números
    move $a0, $t0
    li $v0, 1  # cargar el código de la llamada al sistema para imprimir enteros
    syscall
    
    move $a0, $t1
    syscall
    
    # calcular y almacenar los demás números de la serie
    lw $t3, max  # cargar el valor de max en $t3
    li $t2, 2  # comenzar a calcular a partir del tercer número
    
.fibonacci_loop:
    # calcular el siguiente número de la serie
    add $t4, $t0, $t1  # sumar los dos últimos números
    sw $t4, 0($sp)  # almacenar el nuevo número en la pila
    
    # imprimir el número
    move $a0, $t4
    li $v0, 1  # cargar el código de la llamada al sistema para imprimir enteros
    syscall
    
    # actualizar los valores de los dos últimos números
    move $t0, $t1
    move $t1, $t4
    
    # incrementar el contador de iteraciones
    addi $t2, $t2, 1
    
    # repetir mientras no se hayan calculado todos los números
    bne $t2, $t3, .fibonacci_loop
    
    # salir del programa
    la $a0, msg
    li $v0, 4  # cargar el código de la llamada al sistema para imprimir cadenas
    syscall
    
    li $v0, 10  # cargar el código de la llamada al sistema para salir del programa
    syscall
