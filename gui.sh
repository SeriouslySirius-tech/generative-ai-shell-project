#!/bin/bash

# Ask for topic
topic=$(zenity --entry --title="Quiz Creation" --text="Enter the quiz topic:")

# Check if topic is empty
if [[ -z "$topic" ]]; then
  zenity --error --title="Error" --text="Please enter a topic."
  exit 1
fi

# Ask for number of questions
questions=$(zenity --entry --title="Quiz Creation" --text="Enter the number of questions:")

# Check if number of questions is valid
if [[ ! $questions =~ ^[0-9]+$ ]]; then
  zenity --error --title="Error" --text="Please enter a valid number of questions."
  exit 1
fi

# Ask for difficulty
# difficulty=$(zenity --list --title="Quiz Creation" --text="Choose the difficulty:" \
#   --choices="Easy;Medium;Hard")
difficulty=$(zenity --list \
--title="Super Quizz" \
--text "Pick difficulty" \
--radiolist \
--column "Pick" \
--column "Answer" \
FALSE "Easy" \
FALSE "Medium" \
FALSE "Hard")

# Check if difficulty is selected
if [[ $? -ne 0 ]]; then
  zenity --error --title="Error" --text="Please select a difficulty."
  exit 1
fi

# Ask for filename
filename=$(zenity --file-selection --title="Quiz Creation" --text="Select a filename to save the quiz:")

# Check if filename is selected
if [[ $? -ne 0 ]]; then
  sh ./genaiproject.sh "$topic" $difficulty $questions 

  # exit 1
else 
  sh ./genaiproject.sh "$topic" $difficulty $questions "$filename" 
fi


# Show confirmation message
# zenity --info --title="Quiz Creation" --text="Quiz details:\nTopic: $topic\nNumber of questions: $questions\nDifficulty: $difficulty\nFilename: $filename"
