.syntax unified
.cpu cortex-m4
.thumb

.global lab1
.type lab1, %function

lab1:
  push {r4, r5, r6, lr} // зберігаємо робочі регістри та LR

  mov  r0, #4 // a
  mov  r1, #3 // b
  mov  r2, #5 // c

  mul  r3, r0, r1 // r3 = a * b
  cmp  r3, #10 // перевіряємо умову a * b >= 10
  blt  less_than_ten // перехід, якщо a * b < 10

  orr  r4, r0, r1 // r4 = a OR b
  mul  r0, r4, r2 // r0 = (a OR b) * c
  b    done // завершуємо обчислення

less_than_ten:
  mul  r4, r3, r2 // r4 = (a * b) * c
  mov  r0, r4 // переносимо результат у r0

done:
  pop  {r4, r5, r6, pc} // повертаємося з функції
.size lab1, .-lab1
