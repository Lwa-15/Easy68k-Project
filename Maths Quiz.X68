*-----------------------------------------------------------
* Title      : Maths Quiz
* Written by : Luke Aldred
* Date       : Completed 01/05/2020
* Description: A quiz of maths-related questions
*-----------------------------------------------------------
    ORG    $1000
CR: EQU $0D ;Both EQU labels represent characters which allow the messages to have a newline value on the end of the string
LF: EQU $0A 
START:                  ; first instruction of program

* Put program code here
    LEA WelcomeMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Outputs message
    BRA UserChoice ;Unconditional branch to routine

Q1:
    MOVE.L #0,A2 ;Load 0 score into register A2
    LEA Question1,A1 ;Loads message into regsiter to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Output question message
    
    MOVE.B #4,D0
    TRAP #15 ;Take user input
    CMP.L #6,D1 ;Compare user input with number 6 (correct answer)
    BEQ Q1Correct ;if the user is correct, branch to Correct
    LEA IncorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Output incorrect message
    BRA Q2 ;Unconditional branch to next question
    
Q1Correct:
    LEA CorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Output message to user
    ADDA.L #1,A2 ;Add 1 to the register which the score is stored in
    BRA Q2 ;Unconditional branch to next question
Q2:
    LEA Question2,A1
    MOVE.B #14,D0
    TRAP #15
    
    MOVE.B #4,D0
    TRAP #15
    CMP.L #1,D1
    BEQ Q2Correct
    LEA IncorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    BRA Q3
    
Q2Correct:
    LEA CorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    ADDA.L #1,A2
    BRA Q3

Q3:
    LEA Question3,A1
    MOVE.B #14,D0
    TRAP #15
    
    MOVE.B #4,D0
    TRAP #15
    CMP.L #5,D1
    BEQ Q3Correct
    LEA IncorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    BRA Q4

Q3Correct:
    LEA CorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    ADDA.L #1,A2
    BRA Q4
Q4:
    LEA Question4,A1
    MOVE.B #14,D0
    TRAP #15
    
    MOVE.B #4,D0
    TRAP #15
    CMP.L #0,D1
    BEQ Q4Correct
    LEA IncorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    BRA Q5

Q4Correct:
    LEA CorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    ADDA.L #1,A2
    BRA Q5
Q5:
    LEA Question5,A1
    MOVE.B #14,D0
    TRAP #15
    
    MOVE.B #4,D0
    TRAP #15
    CMP.L #300,D1
    BEQ Q5Correct
    LEA IncorrectMessage,A1 ;Loads message into register to be outputted
    CMP.L #4,A2
    MOVE.B #14,D0
    TRAP #15
    BRA Finish

Q5Correct:
    LEA CorrectMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15
    ADDA.L #1,A2
    BRA Finish ;Branch to the end of the quiz
        
UserChoice:
    LEA ChoiceMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Output message
    
    MOVE.B #4,D0
    TRAP #15 ;Read user input
    CMP.L #1,D1 ;Compare if the user has entered 1
    BEQ Q1 ;Branch back to question 1 if user wishes to complete the quiz again
    BRA Quit ;If the user did not enter 1, the progrma will unconditinally branch to quit the program
    
Finish:
    LEA ScoreMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;Output the message
    
    MOVE.L A2,D1 ;Move the Score value in register A2 to D1 in order to be outputted
    MOVE.B #3,D0
    TRAP #15 ;Output register value to the user
    MOVE.B #0,D0
    LEA PlayAgain,A1 ;Move message asking user if they wish to play again to register A1 to be output
    MOVE.B #14,D0
    TRAP #15 ;Output message
    
    MOVE.B #4,D0
    TRAP #15 ;Read user input
    CMP.L #1,D1 ;Compare entered data to see if the user has entered 1 or not
    BEQ Q1 ;Branch back to question 1 if the user has entered #1
    BRA Quit ;if the user has not entered #1, the program will unconditionally branch to quit the program

Quit:
    LEA ExitMessage,A1 ;Loads message into register to be outputted
    MOVE.B #14,D0
    TRAP #15 ;output message
    MOVE.B #9,D0 ;halt simulator
    TRAP #15

    SIMHALT             ; halt simulator

* Put variables and constants here
Question1 dc.b 'What is the value of x when 12x = 72?: ',0
Question2 dc.b 'What is (44/4)-10?: ',0
Question3 dc.b 'What is the value of y when 3y - 5 = 10?: ',0
Question4 dc.b 'What value is a derivative of a constant?: ',0
Question5 dc.b 'What is the numerical value of this unsigned binary number 100101100?: ',0
WelcomeMessage dc.b 'Welcome to the Maths Quiz!',CR,LF,0
CorrectMessage dc.b 'Your answer is correct! Well done!',CR,LF,0
IncorrectMessage dc.b 'Your answer is incorrect.',CR,LF,0
ChoiceMessage dc.b 'Enter 1 to start the quiz or 0 to exit: ',0
PlayAgain dc.b CR,LF,'Do you wish to complete the quiz again?: ',0
ExitMessage dc.b 'Thank you for playing!',0
ScoreMessage dc.b 'Your score at the end of the quiz is: ',0
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
