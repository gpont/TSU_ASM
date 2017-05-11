chess:
	@rm -f ./binary/chess ./objects/chess.o ./objects/chess.c.o
	@nasm -g -f elf64 -o ./objects/chess.o ./sources/chess.asm
	@gcc -g -Wall -c ./tests/chess.c -o ./objects/chess.c.o
	@gcc -g -Wall -o ./binary/chess ./objects/chess.o ./objects/chess.c.o
	@./binary/chess

int:
	@rm -f ./binary/int ./objects/int.o ./objects/int.c.o
	@nasm -g -f elf64 -o ./objects/int.o ./sources/int.asm
	@gcc -g -Wall -c ./tests/int.c -o ./objects/int.c.o
	@gcc -g -Wall -o ./binary/int ./objects/int.o ./objects/int.c.o
	@./binary/int
