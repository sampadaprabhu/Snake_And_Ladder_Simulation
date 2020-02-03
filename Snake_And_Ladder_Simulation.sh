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
}
#Create A Function To Check Options Like No Play, Ladder, Snake
checkForOptions()
{
	options=$((RANDOM%3))
	case $options in
			$NO_PLAY)
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				;;
			$LADDER)
				playerCurrentPosition=$(( $playerCurrentPosition + $dice ))
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				;;
			$SNAKE)
				playerCurrentPosition=$(( $playerCurrentPosition - $dice ))
				currentPositionDict[$countOfDice]=$playerCurrentPosition
				if (( $playerCurrentPosition < 0 ))
				then
					playerCurrentPosition=$PLAYER_POSITION
					currentPositionDict[$countOfDice]=$playerCurrentPosition
				fi
				;;
	esac
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
				echo -e "Total Count Of Dice is : $countOfDice \nCogratulations Player $player You Won!!"
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
tillWinningPosition
