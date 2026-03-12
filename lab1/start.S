.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global reset_handler

/* Векторна таблиця: SP та Reset */
.type vtable, %object
vtable:
  .word __stack_start // початок стеку
  .word __hard_reset__+1 // адреса Reset для Thumb
.size vtable, .-vtable

__hard_reset__:
  ldr r0, =__stack_start // беремо верх стеку
  mov sp, r0 // записуємо адресу в SP
  b __hard_reset__ // зациклення
