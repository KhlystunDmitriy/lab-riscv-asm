.data
N:
.word 3
M:
.word 4
znachenie:
.word 7
matrix:
.word 1, 6, 7
.word 5, 2, 3
.word 17, 77, 0
.word 4, 9, -6
.text

main:
addi sp,sp,-16
lw a2, N
sw a2,0(sp)
lw a2, M
sw a2,4(sp)
la a2, matrix
sw a2,8(sp)
lw a2, znachenie
sw a2,12(sp)
call process
addi a0,x0,1
lw a1,0(sp)
ecall
addi a0,x0,11
addi a1,x0,32
ecall
addi a0,x0,1
lw a1,4(sp)
ecall
addi sp,sp,24
call exit
exit:
addi a0, x0, 10
ecall
process:
lw t1,0(sp)#считываем из стека кол-во столбцов 
lw t2,4(sp)#считываем из стека кол-во строк
lw t3, 8(sp) #считываем из стека адрес начала матрицы
lw t4,12(sp)#считываем из стека значение, позицию которого надо найти
addi sp,sp, -8 #сдвинул стекпоинтер для адреса искомого элемента 
addi t5, x0, 0 # индекс по строке
init:
addi t6, x0, 0 #индекс по столбцу
cycle:
lw t0, 0(t3)  #занес элемент матрицы
bne t0,t4,m1
sw t5,0(sp)
sw t6,4(sp)
ret
m1:
addi t3, t3, 4 # increment array pointer
addi t6, t6, 1
blt t6, t1, cycle
addi t5, t5, 1
blt t5, t2, init
ret