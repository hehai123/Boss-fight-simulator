function mapSpriteChange(phase){
	var sprite_id;
	var originX = 880;
	var originY = 450;
	
	switch (phase) {
		case "Noon":
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_4CF80EE6");
			layer_sprite_x(sprite_id, 448);
			layer_sprite_y(sprite_id, 789);
			layer_sprite_change(sprite_id, BG_left);
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_250B7C55");
			layer_sprite_x(sprite_id, 1364);
			layer_sprite_y(sprite_id, 787);
			layer_sprite_change(sprite_id, BG_right);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_51CD4BF6");
			layer_sprite_x(sprite_id, 163);
			layer_sprite_y(sprite_id, 865);
			layer_sprite_change(sprite_id, BG_etc_2);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_76E740E9");
			layer_sprite_x(sprite_id, 1507);
			layer_sprite_y(sprite_id, 857);
			layer_sprite_change(sprite_id, BG_etc_2);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3EF9F77D");
			layer_sprite_x(sprite_id, 602);
			layer_sprite_y(sprite_id, 770);
			layer_sprite_change(sprite_id, BG_etc_3);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3ED13EDC");
			layer_sprite_x(sprite_id, 1206);
			layer_sprite_y(sprite_id, 778);
			layer_sprite_change(sprite_id, BG_etc_4);
			
			
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_1D18515B");
			layer_sprite_y(sprite_id, 211); //63?
			layer_sprite_change(sprite_id, BG_back_8);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3C8DDD5B");
			layer_sprite_change(sprite_id, BG_back_9);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3A49D79F");
			layer_sprite_change(sprite_id, BG_back_10);
			
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_57D45760");
			layer_sprite_x(sprite_id, 486);
			layer_sprite_y(sprite_id, 183);
			layer_sprite_change(sprite_id, BG_back_17);
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_73C090A7");
			layer_sprite_x(sprite_id, 1237);
			layer_sprite_y(sprite_id, 277);
			layer_sprite_change(sprite_id, BG_back_18);
			
			sprite_id = layer_sprite_get_id("BG_Island", "graphic_42F57865");
			layer_sprite_x(sprite_id, 772);
			layer_sprite_y(sprite_id, 397);
			layer_sprite_change(sprite_id, BG_back_13);
			
			sprite_id = layer_sprite_get_id("BG_Color_2", "graphic_46BF2ADA");
			layer_sprite_y(sprite_id, 590);
			layer_sprite_change(sprite_id, sBgBackendWorld11);
			
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_2895DE5C");
			layer_sprite_x(sprite_id, 1594);
			layer_sprite_y(sprite_id, 123);
			layer_sprite_change(sprite_id, BG_back_0);
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_6E3525CA");
			layer_sprite_x(sprite_id, 1560);
			layer_sprite_y(sprite_id, 125);
			layer_sprite_change(sprite_id, BG_back_1);
			sprite_id = layer_sprite_get_id("BG_Cloud_2", "graphic_34317358");
			layer_sprite_change(sprite_id, BG_back_2);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_4C0349F1");
			layer_sprite_change(sprite_id, BG_back_3);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_5338EFDD");
			layer_sprite_change(sprite_id, BG_back_4);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_7D157C9C");
			layer_sprite_change(sprite_id, BG_back_5);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_5CBABBB8");
			layer_sprite_x(sprite_id, 1577);
			layer_sprite_y(sprite_id, 465);
			layer_sprite_change(sprite_id, BG_back_5);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_7F8A2ADF");
			layer_sprite_x(sprite_id, 1373);
			layer_sprite_change(sprite_id, BG_back_6);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_769773C0");
			layer_sprite_x(sprite_id, 520);
			layer_sprite_change(sprite_id, BG_back_6);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_5B511C4F");
			layer_sprite_x(sprite_id, 133);
			layer_sprite_y(sprite_id, 370);
			layer_sprite_change(sprite_id, BG_back_14);
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_780C86A9");
			layer_sprite_x(sprite_id, 1609);
			layer_sprite_y(sprite_id, 354);
			layer_sprite_change(sprite_id, BG_back_15);
			
			sprite_id = layer_sprite_get_id("BG_Color_3", "graphic_5CE61F5A");
			layer_sprite_change(sprite_id, BG_back_7);
			
			sprite_id = layer_sprite_get_id("BG_Moon_2", "graphic_1716B56");
			layer_sprite_x(sprite_id, 854);
			layer_sprite_y(sprite_id, -2);
			layer_sprite_change(sprite_id, BG_back_18);
			
			sprite_id = layer_sprite_get_id("BG_Color_4", "graphic_2B217560");
			layer_sprite_change(sprite_id, BG_back_12);
			break;
		case "Sunset":
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_4CF80EE6");
			layer_sprite_x(sprite_id, 448);
			layer_sprite_y(sprite_id, 789);
			layer_sprite_change(sprite_id, sBgObjEndworld10);
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_250B7C55");
			layer_sprite_x(sprite_id, 1364);
			layer_sprite_y(sprite_id, 787);
			layer_sprite_change(sprite_id, sBgObjEndworld11);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_51CD4BF6");
			layer_sprite_x(sprite_id, 163);
			layer_sprite_y(sprite_id, 863);
			layer_sprite_change(sprite_id, sBgObjEndworld12);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_76E740E9");
			layer_sprite_x(sprite_id, 1506);
			layer_sprite_y(sprite_id, 857);
			layer_sprite_change(sprite_id, sBgObjEndworld12);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3EF9F77D");
			layer_sprite_x(sprite_id, 601);
			layer_sprite_y(sprite_id, 769);
			layer_sprite_change(sprite_id, sBgObjEndworld13);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3ED13EDC");
			layer_sprite_x(sprite_id, 1204);
			layer_sprite_y(sprite_id, 776);
			layer_sprite_change(sprite_id, sBgObjEndworld14);
			
			
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_1D18515B");
			layer_sprite_y(sprite_id, 63);
			layer_sprite_change(sprite_id, sBgBackendWorld48);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3C8DDD5B");
			layer_sprite_change(sprite_id, sBgBackendWorld49);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3A49D79F");
			layer_sprite_change(sprite_id, sBgBackendWorld50);
			
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_57D45760");
			layer_sprite_x(sprite_id, 490);
			layer_sprite_y(sprite_id, 193);
			layer_sprite_change(sprite_id, sBgBackendWorld57);
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_73C090A7");
			layer_sprite_x(sprite_id, 1234);
			layer_sprite_y(sprite_id, 282);
			layer_sprite_change(sprite_id, sBgBackendWorld58);
			
			sprite_id = layer_sprite_get_id("BG_Island", "graphic_42F57865");
			layer_sprite_x(sprite_id, 771);
			layer_sprite_y(sprite_id, 399);
			layer_sprite_change(sprite_id, sBgBackendWorld53);
			
			sprite_id = layer_sprite_get_id("BG_Color_2", "graphic_46BF2ADA");
			layer_sprite_y(sprite_id, 590);
			layer_sprite_change(sprite_id, sBgBackendWorld11);
			
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_2895DE5C");
			layer_sprite_change(sprite_id, sBgBackendWorld40);
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_6E3525CA");
			layer_sprite_x(sprite_id, 1560);
			layer_sprite_y(sprite_id, 127);
			layer_sprite_change(sprite_id, sBgBackendWorld41);
			sprite_id = layer_sprite_get_id("BG_Cloud_2", "graphic_34317358");
			layer_sprite_change(sprite_id, sBgBackendWorld42);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_4C0349F1");
			layer_sprite_change(sprite_id, sBgBackendWorld43);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_5338EFDD");
			layer_sprite_change(sprite_id, sBgBackendWorld44);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_7D157C9C");
			layer_sprite_change(sprite_id, sBgBackendWorld45);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_5CBABBB8");
			layer_sprite_x(sprite_id, 1573);
			layer_sprite_y(sprite_id, 464);
			layer_sprite_change(sprite_id, sBgBackendWorld45);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_7F8A2ADF");
			layer_sprite_x(sprite_id, 1373);
			layer_sprite_change(sprite_id, sBgBackendWorld46);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_769773C0");
			layer_sprite_x(sprite_id, 520);
			layer_sprite_change(sprite_id, sBgBackendWorld46);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_5B511C4F");
			layer_sprite_y(sprite_id, 362);
			layer_sprite_change(sprite_id, sBgBackendWorld54);
			
			sprite_id = layer_sprite_get_id("BG_Color_3", "graphic_5CE61F5A");
			layer_sprite_change(sprite_id, sBgBackendWorld47);
			
			sprite_id = layer_sprite_get_id("BG_Moon_2", "graphic_1716B56");
			layer_sprite_x(sprite_id, 850);
			layer_sprite_y(sprite_id, 3);
			layer_sprite_change(sprite_id, sBgBackendWorld58);
			
			sprite_id = layer_sprite_get_id("BG_Color_4", "graphic_2B217560");
			layer_sprite_change(sprite_id, sBgBackendWorld52);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_780C86A9");
			layer_sprite_x(sprite_id, 1614);
			layer_sprite_y(sprite_id, 349);
			layer_sprite_change(sprite_id, sBgBackendWorld55);
			break;
		case "Midnight":
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_4CF80EE6");
			layer_sprite_x(sprite_id, 448);
			layer_sprite_y(sprite_id, 789);
			layer_sprite_change(sprite_id, sBgObjEndworld15);
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_250B7C55");
			layer_sprite_x(sprite_id, 1364);
			layer_sprite_y(sprite_id, 787);
			layer_sprite_change(sprite_id, sBgObjEndworld16);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_51CD4BF6");
			layer_sprite_x(sprite_id, 163);
			layer_sprite_y(sprite_id, 865);
			layer_sprite_change(sprite_id, sBgObjEndworld17);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_76E740E9");
			layer_sprite_x(sprite_id, 1507);
			layer_sprite_y(sprite_id, 858);
			layer_sprite_change(sprite_id, sBgObjEndworld17);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3EF9F77D");
			layer_sprite_x(sprite_id, 600);
			layer_sprite_y(sprite_id, 770);
			layer_sprite_change(sprite_id, sBgObjEndworld18);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3ED13EDC");
			layer_sprite_x(sprite_id, 1204);
			layer_sprite_y(sprite_id, 776);
			layer_sprite_change(sprite_id, sBgObjEndworld19);
			
			
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_1D18515B");
			layer_sprite_y(sprite_id, 63);
			layer_sprite_change(sprite_id, sBgBackendWorld68);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3C8DDD5B");
			layer_sprite_change(sprite_id, BG_back_9);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3A49D79F");
			layer_sprite_change(sprite_id, BG_back_10);
			
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_57D45760");
			layer_sprite_x(sprite_id, 486);
			layer_sprite_y(sprite_id, 185);
			layer_sprite_change(sprite_id, sBgBackendWorld77);
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_73C090A7");
			layer_sprite_x(sprite_id, 1217);
			layer_sprite_y(sprite_id, 265);
			layer_sprite_change(sprite_id, sBgBackendWorld78);
			
			sprite_id = layer_sprite_get_id("BG_Island", "graphic_42F57865");
			layer_sprite_x(sprite_id, 772);
			layer_sprite_y(sprite_id, 397);
			layer_sprite_change(sprite_id, sBgBackendWorld73);
			
			sprite_id = layer_sprite_get_id("BG_Color_2", "graphic_46BF2ADA");
			layer_sprite_y(sprite_id, 578);
			layer_sprite_change(sprite_id, sBgBackendWorld71);
			
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_2895DE5C");
			layer_sprite_change(sprite_id, sBgBackendWorld60);
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_6E3525CA");
			layer_sprite_x(sprite_id, 1560);
			layer_sprite_y(sprite_id, 125);
			layer_sprite_change(sprite_id, sBgBackendWorld61);
			sprite_id = layer_sprite_get_id("BG_Cloud_2", "graphic_34317358");
			layer_sprite_change(sprite_id, sBgBackendWorld62);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_4C0349F1");
			layer_sprite_change(sprite_id, sBgBackendWorld63);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_5338EFDD");
			layer_sprite_change(sprite_id, sBgBackendWorld64);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_7D157C9C");
			layer_sprite_change(sprite_id, sBgBackendWorld65);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_5CBABBB8");
			layer_sprite_x(sprite_id, 1577);
			layer_sprite_y(sprite_id, 465);
			layer_sprite_change(sprite_id, sBgBackendWorld65);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_7F8A2ADF");
			layer_sprite_x(sprite_id, 1373);
			layer_sprite_change(sprite_id, sBgBackendWorld66);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_769773C0");
			layer_sprite_x(sprite_id, 520);
			layer_sprite_change(sprite_id, sBgBackendWorld66);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_5B511C4F");
			layer_sprite_y(sprite_id, 361);
			layer_sprite_change(sprite_id, sBgBackendWorld74);
			
			sprite_id = layer_sprite_get_id("BG_Color_3", "graphic_5CE61F5A");
			layer_sprite_change(sprite_id, BG_back_7);
			
			sprite_id = layer_sprite_get_id("BG_Moon_2", "graphic_1716B56");
			layer_sprite_x(sprite_id, 833);
			layer_sprite_y(sprite_id, -15);
			layer_sprite_change(sprite_id, sBgBackendWorld78);
			
			sprite_id = layer_sprite_get_id("BG_Color_4", "graphic_2B217560");
			layer_sprite_change(sprite_id, BG_back_12);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_780C86A9");
			layer_sprite_x(sprite_id, 1613);
			layer_sprite_y(sprite_id, 349);
			layer_sprite_change(sprite_id, sBgBackendWorld75);
			break;
		case "Dawn":
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_4CF80EE6");
			layer_sprite_x(sprite_id, -432 + originX);
			layer_sprite_y(sprite_id, 339 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld5);
			sprite_id = layer_sprite_get_id("BG_Ground", "graphic_250B7C55");
			layer_sprite_x(sprite_id, 483 + originX);
			layer_sprite_y(sprite_id, 337 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld6);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_51CD4BF6");
			layer_sprite_x(sprite_id, -717 + originX);
			layer_sprite_y(sprite_id, 412 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld7);
			sprite_id = layer_sprite_get_id("FG_Etc_2", "graphic_76E740E9");
			layer_sprite_x(sprite_id, 627 + originX);
			layer_sprite_y(sprite_id, 406 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld7);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3EF9F77D");
			layer_sprite_x(sprite_id, -279 + originX);
			layer_sprite_y(sprite_id, 319 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld8);
			sprite_id = layer_sprite_get_id("FG_Etc_1", "graphic_3ED13EDC");
			layer_sprite_x(sprite_id, 324 + originX);
			layer_sprite_y(sprite_id, 326 + originY);
			layer_sprite_change(sprite_id, sBgObjEndworld9);
			
			
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_1D18515B");
			layer_sprite_y(sprite_id, 127);
			layer_sprite_change(sprite_id, sBgBackendWorld28);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3C8DDD5B");
			layer_sprite_change(sprite_id, sBgBackendWorld29);
			sprite_id = layer_sprite_get_id("BG_Color_1", "graphic_3A49D79F");
			layer_sprite_change(sprite_id, sBgBackendWorld30);
			
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_57D45760");
			layer_sprite_x(sprite_id, 490);
			layer_sprite_y(sprite_id, 188);
			layer_sprite_change(sprite_id, sBgBackendWorld37);
			sprite_id = layer_sprite_get_id("BG_Moon", "graphic_73C090A7");
			layer_sprite_x(sprite_id, 1229);
			layer_sprite_y(sprite_id, 275);
			layer_sprite_change(sprite_id, sBgBackendWorld38);
			
			sprite_id = layer_sprite_get_id("BG_Island", "graphic_42F57865");
			layer_sprite_x(sprite_id, -108 + originX);
			layer_sprite_y(sprite_id, -53 + originY);
			layer_sprite_change(sprite_id, sBgBackendWorld33);
			
			sprite_id = layer_sprite_get_id("BG_Color_2", "graphic_46BF2ADA");
			layer_sprite_y(sprite_id, 590);
			layer_sprite_change(sprite_id, sBgBackendWorld31);
			
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_2895DE5C");
			layer_sprite_change(sprite_id, sBgBackendWorld20);
			sprite_id = layer_sprite_get_id("BG_Cloud_1", "graphic_6E3525CA");
			layer_sprite_x(sprite_id, 1562);
			layer_sprite_y(sprite_id, 168);
			layer_sprite_change(sprite_id, sBgBackendWorld21);
			sprite_id = layer_sprite_get_id("BG_Cloud_2", "graphic_34317358");
			layer_sprite_change(sprite_id, sBgBackendWorld22);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_4C0349F1");
			layer_sprite_change(sprite_id, sBgBackendWorld23);
			sprite_id = layer_sprite_get_id("BG_Cloud_3", "graphic_5338EFDD");
			layer_sprite_change(sprite_id, sBgBackendWorld24);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_7D157C9C");
			layer_sprite_change(sprite_id, sBgBackendWorld25);
			sprite_id = layer_sprite_get_id("BG_Cloud_4", "graphic_5CBABBB8");
			layer_sprite_x(sprite_id, 697 + originX);
			layer_sprite_y(sprite_id, 15 + originY);
			layer_sprite_change(sprite_id, sBgBackendWorld25);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_7F8A2ADF");
			layer_sprite_x(sprite_id, 1380);
			layer_sprite_change(sprite_id, sBgBackendWorld26);
			sprite_id = layer_sprite_get_id("BG_Cloud_5", "graphic_769773C0");
			layer_sprite_x(sprite_id, 527);
			layer_sprite_change(sprite_id, sBgBackendWorld26);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_5B511C4F");
			layer_sprite_y(sprite_id, 362);
			layer_sprite_change(sprite_id, sBgBackendWorld34);
			
			sprite_id = layer_sprite_get_id("BG_Color_3", "graphic_5CE61F5A");
			layer_sprite_change(sprite_id, sBgBackendWorld27);
			
			sprite_id = layer_sprite_get_id("BG_Moon_2", "graphic_1716B56");
			layer_sprite_x(sprite_id, 846);
			layer_sprite_y(sprite_id, -5);
			layer_sprite_change(sprite_id, sBgBackendWorld38);
			
			sprite_id = layer_sprite_get_id("BG_Color_4", "graphic_2B217560");
			layer_sprite_change(sprite_id, sBgBackendWorld32);
			
			sprite_id = layer_sprite_get_id("BG_Mountain", "graphic_780C86A9");
			layer_sprite_x(sprite_id, 1615);
			layer_sprite_y(sprite_id, 350);
			layer_sprite_change(sprite_id, sBgBackendWorld35);
			break;
	}
}