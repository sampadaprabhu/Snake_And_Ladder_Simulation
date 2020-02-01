#!/bin/bash -x
echo "Welcome To Snake And Ladder Game"

#Constant Variable
PLAYER_POSITION=0

#Variables
playerCurrentPosition=$PLAYER_POSITION

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
			0)
				playerCurrentPosition=$playerCurrentPosition
				;;
			1)
				ladder=$(( $playerCurrentPosition + $dice ))
				playerCurrentPosition=$ladder
				echo $ladder
				;;
			2)
				snake=$(( $playerCurrentPosition - $dice ))
				playerCurrentPosition=$snake
				echo $snake
				if (( $snake < 0 ))
				then
					playerCurrentPosition=$PLAYER_POSITION
				fi
				;;
			*)
				echo "No Matches Found!!"
				;;
	esac
}
tillWinningPosition()
{
	while (( $playerCurrentPosition <= 100 ))
	do
		rollingDice
		if (( $playerCurrentPosition == 100 ))
		then
				echo "Congratulations...You Won!!"
				break
		elif (( $(( $playerCurrentPosition + $dice)) > 100 ))
		then
				playerCurrentPosition=$playerCurrentPosition
		else
		checkForOptions
		fi
		echo
		echo
	done
}
tillWinningPosition
