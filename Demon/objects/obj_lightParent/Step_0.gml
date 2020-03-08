/// @description Insert description here
// You can write your code in this editor
var lowerRange = -1-range


if range != -1
{
	for (var i = lowerRange; i < range; i++)
	{
	    for (var j = lowerRange; j < range; j++)
	    {        
	        instance_create_layer(x-(64*i)-64, y-(64*j)-64, "Lights", obj_Light)
	    }
	}
}