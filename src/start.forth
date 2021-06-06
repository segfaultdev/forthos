%include "vgaio.forth"

[
  vgaio_init call
  "Hey, this is FORTHOS!\n" vgaio_put_str call

  [1] [] while
] start set
