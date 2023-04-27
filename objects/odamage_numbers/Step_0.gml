/// @description Float upwards and disappear

y += vsp;

if fade == true
{
	alpha -= 0.014;
}

if (alpha < 0) {
	instance_destroy();
}
