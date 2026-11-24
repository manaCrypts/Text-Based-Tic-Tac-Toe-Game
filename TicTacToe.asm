; Text-Based Tic-Tac-Toe - COAL Project
; MASM + Irvine32 (Visual Studio 2022)
; AI assistance used in drafting: student should disclose per course policy

INCLUDE Irvine32.inc

.data
board       BYTE '1','2','3','4','5','6','7','8','9'
player      BYTE 'X'
winFlag     BYTE 0
movesCount  BYTE 0
choice      DWORD ?

welcomeMsg  BYTE "==============================",0
            BYTE " TEXT-BASED TIC-TAC-TOE",0
            BYTE "==============================",0
turnMsg     BYTE "Player ",0
chooseMsg   BYTE " - choose a cell (1-9): ",0
invalidMsg  BYTE "Invalid choice or cell already occupied. Try again.",0
winMsg     BYTE " wins!",0
drawMsg    BYTE "Game ended in a draw!",0
replayMsg  BYTE "Play another round? (1 = Yes, 0 = No): ",0
byeMsg     BYTE "Thanks for playing!",0

.code

; Checks whether three specified board cells all match the current player.
CHECKLINE MACRO firstCell, secondCell, thirdCell
    LOCAL lineDone
    mov al, board[firstCell]
    cmp al, player
    jne lineDone
    mov al, board[secondCell]
    cmp al, player
    jne lineDone
    mov al, board[thirdCell]
    cmp al, player
    jne lineDone
    mov winFlag, 1
lineDone:
ENDM

main PROC
    call Clrscr
    mov edx, OFFSET welcomeMsg
    call WriteString
    call Crlf

newGame:
    mov board[0], '1'
    mov board[1], '2'
    mov board[2], '3'
    mov board[3], '4'
    mov board[4], '5'
    mov board[5], '6'
    mov board[6], '7'
    mov board[7], '8'
    mov board[8], '9'
    mov player, 'X'
    mov winFlag, 0
    mov movesCount, 0

 gameLoop:
    call DisplayBoard
    call Crlf

    mov edx, OFFSET turnMsg
    call WriteString
    mov al, player
    call WriteChar
    mov edx, OFFSET chooseMsg
    call WriteString
    call ReadInt

    ; Validate input is in the range 1..9.
    cmp eax, 1
    jl badMove
    cmp eax, 9
    jg badMove

    ; Convert selection into zero-based array index.
    dec eax
    mov ebx, eax
    mov al, board[ebx]
    ; Empty cells still contain their original digit.
    cmp al, '1'
    jb badMove
    cmp al, '9'
    ja badMove

    ; Place the current player's symbol.
    mov al, player
    mov board[ebx], al
    inc movesCount

    call CheckWin
    cmp winFlag, 1
    je gameWon

    cmp movesCount, 9
    je gameDraw

    ; Switch player: X <-> O.
    cmp player, 'X'
    jne setX
    mov player, 'O'
    jmp gameLoop
setX:
    mov player, 'X'
    jmp gameLoop

badMove:
    mov edx, OFFSET invalidMsg
    call WriteString
    call Crlf
    jmp gameLoop

gameWon:
    call DisplayBoard
    call Crlf
    mov al, player
    call WriteChar
    mov edx, OFFSET winMsg
    call WriteString
    call Crlf
    jmp askReplay

gameDraw:
    call DisplayBoard
    call Crlf
    mov edx, OFFSET drawMsg
    call WriteString
    call Crlf

askReplay:
    mov edx, OFFSET replayMsg
    call WriteString
    call ReadInt
    cmp eax, 1
    je newGame

    mov edx, OFFSET byeMsg
    call WriteString
    call Crlf
    exit
main ENDP

DisplayBoard PROC
    ; Row 1
    mov al, board[0]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[1]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[2]
    call WriteChar
    call Crlf
    mov edx, OFFSET rowDivider
    call WriteString
    call Crlf
    ; Row 2
    mov al, board[3]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[4]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[5]
    call WriteChar
    call Crlf
    mov edx, OFFSET rowDivider
    call WriteString
    call Crlf
    ; Row 3
    mov al, board[6]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[7]
    call WriteChar
    mov edx, OFFSET separator
    call WriteString
    mov al, board[8]
    call WriteChar
    call Crlf
    ret
DisplayBoard ENDP

CheckWin PROC
    mov winFlag, 0
    ; 3 rows
    CHECKLINE 0, 1, 2
    CHECKLINE 3, 4, 5
    CHECKLINE 6, 7, 8
    ; 3 columns
    CHECKLINE 0, 3, 6
    CHECKLINE 1, 4, 7
    CHECKLINE 2, 5, 8
    ; 2 diagonals
    CHECKLINE 0, 4, 8
    CHECKLINE 2, 4, 6
    ret
CheckWin ENDP

.data
separator  BYTE " | ",0
rowDivider BYTE "---------",0

END main
