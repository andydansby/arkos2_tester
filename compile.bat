cls

rasm_win64 Akg_SPECTRUM.asm -o music

@rem makesna music.sna 33155 music.bin 33153
@rem attention

copy music.bin code.bin

bin2tap -a 32768 music.bin
@rem bin2tap -a 33153 music.bin
@rem attention

bas2tap -a10 loader.bas

copy /b loader.tap + music.tap  1output.tap


rem cleanup
del loader.tap
@rem del code.tap
@rem del code.bin
@rem del music.sna
del music.tap
del music.bin
