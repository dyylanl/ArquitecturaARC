! Suma de los elementos de un vector.
! %r1 : Longuitud del vector.
! %r2 : Direccion de comienzo del vector.
! %r3 : Suma parcial.
! %r4 : Puntero al vector.
! %r5 : Elemento actual del vector
	.begin
	.org 2048
v_start	.equ	3000 		! Direccion de memoria donde comienza el vector.
	ld	[lenght], %r1
	ld	[adress], %r2
	andcc	%r3, %r0, %r0	! Cargo el registro r3 con cero.
loop:	andcc	%r1, %r1, %r0	! Comparo bit a bit el r1 consigo mismo para comprobar que tiene espacio.
	be done			! Finaliza en caso que lenght = 0
	addcc	%r1, -4, %r1	! Decremento el indice del puntero al elemento actual del vector.
	addcc	%r1, %r2, %r4	! Direccion del proximo elemento
	ld	%r4, %r5	! Guardo el dato al que esta apuntando la direccion de memoria r4 en el registro r5
	addcc %r3, %r5, %r3
	ba	loop

done:	jmpl %r15 + 4, %r0
! -------------- DECLARACIONES -------------- 
lenght:		20		! El vector contiene 5 numeros ( 20 bytes)
adress:		v_start
	.org	v_start
v:		25
		-25
		-50
		50
		87
	.end
