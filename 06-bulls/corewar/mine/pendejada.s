pendejada.s
.name "pendejada"
.comment "The spirit of the Santo lives in me."

entry:
	fork %:spawn

main:
	sti r1, %:live, %1

	and r1, %0, r1

live:
	live %`
	zjmp %:live

spawn:
	live %1
