/// @description Insert description here
// You can write your code in this editor
for (var i = (-1*range)-1; i < range; i++)
{
    for (var j = (-1*range)-1; j < range; j++)
    {        
        //show_debug_message(y-(64*j)-64)
        instance_create_layer(x-(64*i)-64, y-(64*j)-64, "Lights", obj_Light)
    }
}