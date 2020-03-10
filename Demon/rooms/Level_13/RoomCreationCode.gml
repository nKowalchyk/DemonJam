func_init();

totalScore = floor(global.healthScore+global.oilScore+global.saneScore)

ini_open("Score.ini")
	
	totalScore += ini_read_real("scores", "total", totalScore)
	
	ini_write_real("scores", "total", totalScore)

ini_close()