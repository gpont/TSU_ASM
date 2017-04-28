chess:
	@rm ./binary/chess
	@nasm -f elf64 -o ./binary/chess ./sources/chess.asm
	@./binary/chess