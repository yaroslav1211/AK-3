.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global __hard_reset__

.type vtable, %object
.type __hard_reset__, %function

vtable:
  .word __stack_start // початкове значення SP
  .word __hard_reset__+1 // адреса обробника Reset у Thumb
.size vtable, .-vtable

__hard_reset__:
  ldr r0, =__stack_start // зчитуємо верхню межу стеку
  mov sp, r0 // ініціалізуємо SP

  bl lab1 // викликаємо обчислення

hang:
  b hang // нескінченне очікування
.size __hard_reset__, .-__hard_reset__
