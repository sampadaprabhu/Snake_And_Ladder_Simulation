#!/bin/bash -x
echo "Welcome To Snake And Ladder Game"
#Declaring Dictionary
declare -A currentPositionDict
#Constant Variable
NO_PLAY=0
LADDER=1
SNAKE=2
#Variables
playerCurrentPosition=0
countOfDice=0
player=1
#Function For Deciding Turn Of Player
playersTurn()
{
	if (($1 == 1))
	then
		player=2
	else
		player=1
	fi
}
#Create A Function To Roll The Dice
rollingDice()
{
	dice=$(( 1 + $((RANDOM%6)) ))
	echo "The number on Dice After Rolling the Dice is : $dice"
}
#Create A Function To Check Options Like No Play, Ladder, Snake
checkForOptions()
{
	options=$((RANDOM%3))
	echo "Option : $options"
	case $options in
			$NO_PLAY)
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				;;
			$LADDER)
				playerCurrentPosition=$(( $playerCurrentPosition + $dice ))
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				echo $playerCurrentPosition
				;;
			$SNAKE)
				playerCurrentPosition=$(( $playerCurrentPosition - $dice ))
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				echo $playerCurrentPosition
				if (( $playerCurrentPosition < 0 ))
				then
					playerCurrentPosition=$PLAYER_POSITION
					currentPositionDict[$countOfDice]=$playerCurrentPosition
				fi
				;;
	esac
	echo "Position Of Player On $countOfDice Roll Dice:currentPositionDict[$countOfDice]"
}
tillWinningPosition()
{
	playerCurrentPosition=${currentPositionDict[$countOfDice]}
	while [[ $playerCurrentPosition -le 100 ]]
	do
		((countOfDice++))
		rollingDice
		if (( $playerCurrentPosition == 100 ))
		then
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				echo "TOtal Count Of Dice is : $countOfDice"
				echo "Cogratulations Player $player You Won!!"
				break
		elif (( $(( $playerCurrentPosition + $dice)) > 100 ))
		then
				currentPositionDict[$countOfDice]=${currentPositionDict[$(($countOfDice - 1))]}
		else
				checkForOptions
		fi
		playersTurn $player
	done
}
currentPositionDict=([0]=0)
tillWinningPosition
