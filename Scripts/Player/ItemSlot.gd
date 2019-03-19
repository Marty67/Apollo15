extends TextureRect

var slotIndex;
var item = null;
#var itemId = 0

func _init(slotIndex):
	self.slotIndex = slotIndex;
	name = "ItemSlot_%d" % slotIndex
	
	texture = preload("res://Images/square.png");
	mouse_filter = Control.MOUSE_FILTER_PASS;
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;
	
func setItem(newItem):
	
	#print(str(has))

	add_child(newItem);
	item = newItem
	item.itemSlot = self;
	print(str(item))

func useItem():
	remove_child(item)
	item = null;
