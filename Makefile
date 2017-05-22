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

progression:
	@rm -f ./binary/progression ./objects/progression.o ./objects/progression.c.o
	@nasm -g -f elf64 -o ./objects/progression.o ./sources/progression.asm
	@gcc -g -Wall -c ./tests/progression.c -o ./objects/progression.c.o
	@gcc -g -Wall -o ./binary/progression ./objects/progression.o ./objects/progression.c.o
	@./binary/progression

square:
	@rm -f ./binary/square ./objects/square.o ./objects/square.c.o
	@nasm -g -f elf64 -o ./objects/square.o ./sources/square.asm
	@gcc -g -Wall -c ./tests/square.c -o ./objects/square.c.o
	@gcc -g -Wall -o ./binary/square ./objects/square.o ./objects/square.c.o
	@./binary/square

invert:
	@rm -f ./binary/invert ./objects/invert.o ./objects/invert.c.o
	@nasm -g -f elf64 -o ./objects/invert.o ./sources/invert.asm
	@gcc -g -Wall -c ./tests/invert.c -o ./objects/invert.c.o
	@gcc -g -Wall -o ./binary/invert ./objects/invert.o ./objects/invert.c.o
	@./binary/invert
