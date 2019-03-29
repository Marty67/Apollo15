extends TextureRect

var itemIcon
var itemName
var itemSlot
var itemId
var picked = false

func _init(itemId,itemName, itemTexture, itemSlot):
	name = itemName
	self.itemName = itemName
	texture = itemTexture
	hint_tooltip = "Name: %s\n\nitemId: %d" % [itemName, itemId];
	self.itemSlot = itemSlot
	self.itemId = itemId
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	
func useItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	picked = true
	
func putItem():
	rect_global_position = Vector2(0, 0)
	mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false
	