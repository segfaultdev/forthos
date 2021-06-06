%ifndef VGAIO_INCLUDED
%define VGAIO_INCLUDED

0xB8000 vgaio_buffer set
0 vgaio_cursor set

[] vgaio_init set

[
  dup '\n' = [
    vgaio_cursor get dup
    80 % - 80 +
    vgaio_cursor set
    drop exit
  ] test

  vgaio_cursor get dup
  dup +
  vgaio_bufer get + dup
  poke_byte
  1 +
  vgaio_color get swap
  poke_byte
  1 +
  vgaio_cursor set
] vgaio_put_chr set

[
  dup len vgaio_length set
  0 vgaio_index set

  [vgaio_index get vgaio_length get <] [
    dup
    vgaio_index get
    dup at
    vgaio_put_chr call
    1 +
    vgaio_index set
  ] while

  vgaio_length delete
  vgaio_index delete
] vgaio_put_str set

%endif
