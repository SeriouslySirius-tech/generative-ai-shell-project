# Generating Questions using Bard's Gemini Pro text model on a certain topic
Creates questions on a certain topic and of a certain difficulty by querying Bard's Gemini Pro text model to create a text document of the required number of questions. 

# Usage
Syntax: <br>
`./genaiproject.sh <topic> <difficulty> [<no. of questions> <file>]`<br>
By default the no. of questions = 1 and the file will be generated under the name `<topic>-questions.txt` if they are not specified.<br>
Example: <br>
`./genaiproject.sh "Graph Theory" "College" 10 questions.txt`
<br>
You can also convert the given file to a word document with `.docx` extension if required (the program will prompt you regarding this). 

