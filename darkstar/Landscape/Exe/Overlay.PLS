�   seed	100
push           256
clr	0
dup
fill_n	0.85
fft	1
pop
normalize	0.0 1.0
load	..\art\mound.bmp
overlay	1 0.5
curve	0.01 6
normalize 0.0 1200.0
 