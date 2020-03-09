/// @description Insert description here
// You can write your code in this editor

ini_open("Score.ini")

_score = ini_read_real("scores", "total", 0)

ini_close()

if _score == 0
{
	instance_destroy()	
}

content = "Total Score: "+string(_score)