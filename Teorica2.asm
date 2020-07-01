! Un programa en assembler ARC declara un arreglo de 20 elementos enteros signados
! y lo completa con los primeros 20 valores negativos leidos de un dispositivo de entrada
! que esta mapeado en la direccion A0010124h. Una vez completado el arreglo 
! el programa termina"

	.begin
	.org 2048
		ld	[address], %r1
		addcc	%r2, 20, %r2		! Espacio del array
		andcc	%r3, %r0, %r3		! Indice en 0
loop:		andcc	%r2, %r2, %r0		! Comparo bit a bit para seguir cargando datos o terminar si no tiene mas espacio
		be done			! Si el r2 es 0 no hay mas espacio, el programa termina
		addcc %r1, %r0, %r1
		bneg negativo
		ba loop
negativo:	st	%r1,[x+indice]		! Cargo el elemento de r1 que es negativo en la posicon del array[x+i]
		addcc	%r3, 4, %r3		! Actualizo el indice del array ya que se cargo un elemento.
		st	%r3, [indice]		! Cargo el indice actualizado.
		subcc	%r2, 1, %r2		! Actualizo el espacio que le queda al array
		ba loop			! Regreso a comprobar si queda espacio para seguir cargando datos
done:		jmpl	%r15 + 4, %r0

! -------------- DECLARACIONES --------------
address:	A0010124h			! Direccion de memoria donde se leen los 32 bits.
x:		.dwb	20			! Reservo espacio para el array
indice:		0
	.end
	
