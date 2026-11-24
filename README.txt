COAL PROJECT: TEXT-BASED TIC-TAC-TOE
====================================

Files
-----
TicTacToe.asm - MASM assembly source code.

Environment
-----------
This source uses the Irvine32 library and is intended for the Visual Studio 2022
MASM setup used in many COAL labs. It is NOT a DOS BIOS-interrupt program.

How to run in Visual Studio 2022
--------------------------------
1. Open Visual Studio 2022 and create a new Empty Project.
2. Select the project type/platform required by your lab (commonly x86).
3. Add TicTacToe.asm to the project (Add > Existing Item).
4. Make sure MASM is enabled: Project > Build Dependencies > Build Customizations
   and tick masm (.targets, .props), if available.
5. Configure the Irvine32 include/library paths as your lab setup specifies.
   The source includes Irvine32.inc and calls Irvine32 procedures.
6. Build, then run the program (Ctrl+F5).

Gameplay
-------
Two players share the keyboard. X goes first. Choose cells by entering 1-9:

  1 | 2 | 3
  ---------
  4 | 5 | 6
  ---------
  7 | 8 | 9

The program rejects invalid numbers and occupied cells, checks rows/columns/
diagonals for a win, checks for a draw, and offers replay.

Important
---------
The exact Irvine32 setup paths vary by lab computer. If Visual Studio reports
"cannot open Irvine32.inc" or "unresolved external", the Irvine32 library paths
or project configuration need to be set up. Ask the instructor/TA for the lab's
provided Irvine32 folder. AI assistance was used to draft this code; follow your
course's disclosure rules and understand every procedure and instruction before
viva.
