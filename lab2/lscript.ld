MEMORY
{
  FLASH ( rx )  : ORIGIN = 0x08000000, LENGTH = 1M   /* код програми */
  RAM   ( rxw ) : ORIGIN = 0x20000000, LENGTH = 128K /* дані та стек */
}

__stack_start = ORIGIN(RAM) + LENGTH(RAM); /* початкове значення SP (верх RAM) */
