x += hsp;

if collision_rectangle(oSerene.x-80, oSerene.y-408, oSerene.x+75, oSerene.y+15, oKnife1, false, false) // changed self to oKnife1
{
	alarm[0] = -1;
	
	// Check if knife has travelled to centre
	if collision_line(oSerene.x, oSerene.y-408, oSerene.x, oSerene.y+100, oKnife1, false, false) 
	{
		instance_create_layer(1,1,"Instances_1",oDamage);
		instance_destroy();
	}
}

