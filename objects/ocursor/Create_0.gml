window_set_cursor(cr_none); //remove windows default cursor

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// for keyboard settings
x_offset = -660/2;
y_offset = -520/2;

x_final = gui_width/2 + x_offset;
y_final = gui_height/2 + y_offset;

row_1 = 88;
row_2 = 126;
row_3 = 159;
row_4 = 192;
row_5 = 225;
row_6 = 258;

keyboard_width = 620;
keyboard_height = 231;
keyboard_ui_x = 20;
keyboard_ui_y = 67;

//cursor_sprite = s_cursor;

selected_slot = 0;
pickup_item = -1;
m_slotx = 0;
m_sloty = 0;

mouse_hold = false;
mouse_hold_item = 0; 
mouse_hold_item_index = 0;
mouse_index = 0;

button_check = 0;

state = mstate.normal;