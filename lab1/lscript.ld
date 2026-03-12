MEMORY /* Опис ділянок памʼяті мікроконтролера */
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1M /* код і константи у Flash */
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 128K /* дані, стек і змінні у RAM */
}

__stack_start = ORIGIN(RAM) + LENGTH(RAM); /* вершина стеку: кінець області RAM */
