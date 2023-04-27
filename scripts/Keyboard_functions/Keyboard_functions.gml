function quickSlot() {
	isQuickSlotOpen = !isQuickSlotOpen;
	isQuickSlotOpenBefore =! isQuickSlotOpenBefore;
}

function quickSlotChange() {
	global.settingQuickSlot = false;
	global.settingQuickSlotKey = false;
	global.selectedQuickSlotKey = -1;
	with (oController) {
		if (!isQuickSlotOpenBefore) isQuickSlotOpen = false;
	}
	with (oDisplay) {
		if (type == "keyboardQuickSlot") instance_destroy();
	}
	with (oButton) {
		if (type == "keyboardQuickSlot") instance_destroy();
		if (sprite_index == sKeyChangeQuickSlot) isClickable = true;
	}
}

function quickSlotCancel() {
	global.settingQuickSlot = false;
	global.settingQuickSlotKey = false;
	global.selectedQuickSlotKey = -1;
	with (oController) {
		if (!isQuickSlotOpenBefore) isQuickSlotOpen = false;
	}
	with (oDisplay) {
		if (type == "keyboardQuickSlot") instance_destroy();
	}
	with (oButton) {
		if (type == "keyboardQuickSlot") instance_destroy();
		if (sprite_index == sKeyChangeQuickSlot) isClickable = true;
	}
}
