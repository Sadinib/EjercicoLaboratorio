.data
msg1: .asciiz "El número mayor es: "
msg2: .asciiz "\n"

.text
.globl main

main:
# Lee los tres números
li $v0, 5           # servicio 5 para leer un entero
syscall
move $t0, $v0       # guarda el primer número en $t0

li $v0, 5           # servicio 5 para leer un entero
syscall
move $t1, $v0       # guarda el segundo número en $t1

li $v0, 5           # servicio 5 para leer un entero
syscall
move $t2, $v0       # guarda el tercer número en $t2

# Encuentra el número mayor
move $t3, $t0       # asume que el primer número es el mayor
bgt $t1, $t3, greater    # si el segundo número es mayor, salta a greater
move $t3, $t1       # si no, guarda el segundo número como mayor
bgt $t2, $t3, greater    # si el tercer número es mayor, salta a greater
move $t3, $t2       # si no, guarda el tercer número como mayor
j print_result      # salta a imprimir el resultado

greater:
move $t3, $t1       # guarda el número mayor en $t3
move $a0, $t1       # guarda el segundo número en $a0
bgt $t2, $a0, greater2   # si el tercer número es mayor, salta a greater2
move $a0, $t2       # si no, guarda el tercer número en $a0
j print_result      # salta a imprimir el resultado

greater2:
move $t3, $t2       # guarda el número mayor en $t3

# Imprime el resultado
print_result:
li $v0, 4           # servicio 4 para imprimir una cadena
la $a0, msg1        # dirección de la cadena msg1
syscall

li $v0, 1           # servicio 1 para imprimir un entero
move $a0, $t3       # número mayor en $t3
syscall

li $v0, 4           # servicio 4 para imprimir una cadena
la $a0, msg2        # dirección de la cadena msg2
syscall

# Termina el programa
li $v0, 10          # servicio 10 para terminar el programa
syscall
