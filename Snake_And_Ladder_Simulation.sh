#!/bin/bash -x
echo "Welcome To Snake And Ladder Game"

#Constant Variable
PLAYER_POSITION=0

#Create A Function To Roll The Dice
rollingDice()
{
	dice=$(( 1 + $((RANDOM%6)) ))
	((countOfDice++))
	echo "The number on Dice After Rolling the Dice is : $dice"
}
rollingDice
