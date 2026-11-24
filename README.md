# Tic-Tac-Toe in x86 Assembly

A two-player, text-based Tic-Tac-Toe game developed in x86 Assembly Language as a 5th-semester Computer Organization and Assembly Language (COAL) project.

## Project Overview
This project recreates the classic Tic-Tac-Toe game in a console environment. Two players take turns selecting positions on a 3×3 board. The program validates each move, updates the board, checks for a winner or draw, and allows the players to replay.

## Objectives
- Implement an interactive game using x86 Assembly.
- Practice registers, memory, arrays, loops, conditional jumps, and procedures.
- Validate input and prevent moves on occupied positions.
- Detect winning combinations and draws.
- Provide a replay option.

## Features
- Two-player gameplay (X and O)
- Numbered 3×3 board
- Input validation
- Prevents overwriting occupied positions
- Alternating turns
- Win detection (rows, columns, diagonals)
- Draw detection
- Replay or exit

## Technologies / Environment
- x86 Assembly Language
- MASM
- Irvine32 library
- Visual Studio 2022 (x86 configuration)

> Intended for the MASM + Irvine32 lab environment. Confirm successful build and execution on the target setup.

## Assembly Concepts Demonstrated
- Registers and data movement
- Arrays and indexed addressing
- Arithmetic and comparisons
- Loops and conditional jumps
- Procedures and stack/calling conventions
- Irvine32 console input/output routines

## How to Play
1. Run the program.
2. Choose an empty position from 1 to 9.
3. Players alternate between X and O.
4. The first player to complete a row, column, or diagonal wins.
5. If the board fills with no winning line, the game is a draw.
6. After the result, choose whether to replay or exit.

## Board Positions
```text
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
```

## Program Flow
1. Initialize the board and current player.
2. Display the board.
3. Read and validate the selected position.
4. Place the player's symbol.
5. Check for a win or draw.
6. If the game continues, switch players and repeat.
7. Show the result and offer replay.

## Project Information
- **Course:** Computer Organization and Assembly Language (COAL)
- **Semester:** 5th Semester
- **Project:** Individual
- **Author:** Manahil Shaikh
- **Roll Number:** 24K-2020
- **University:** FAST-NUCES, Karachi

## Academic Note
This project is for educational purposes and demonstrates low-level programming concepts. Disclose AI assistance, if used, according to the course's academic integrity requirements.
