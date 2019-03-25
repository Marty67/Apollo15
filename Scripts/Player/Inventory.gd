extends GridContainer;
const ItemClass = preload("Item.gd");
const ItemSlotClass = preload("ItemSlot.gd")


var index = 0
var id = 0
var list = 0;

const slotTexture = preload("res://Images/square.png")
const itemImages = [
	preload("res://Images/Baguette with shadows.png"),
	preload("res://Images/inventoryIcons/htankIcon.png"),
	preload("res://Images/Oxygen Tank with Shadow.png"),
	preload("res://Images/inventoryIcons/radarIcon.png"),
	preload("res://Images/inventoryIcons/boosterIcon.png"),
	preload("res://Images/inventoryIcons/fluxIcon.png"),
]

const image_dict = {
	"baguette":itemImages[0],
	"tank": itemImages[2],
	"radar": itemImages[3],
	"booster": itemImages[4],
	"flux": itemImages[5],
	"hydrogenTank": itemImages[1],
	
}

var slotList = Array()
var itemList = Array()

var holdingItem = null

func _ready():
	
	Global.Inventory = self
	
	#for item in itemDictionary:
		
		
		#var itemName = itemDictionary[item].itemName
		#var itemIcon = itemDictionary[item].itemIcon
		
		
	
		
		#itemList.append(ItemClass.new(id,itemName, itemIcon, null))
		#id+=1
		#print(str(id))
	
	for i in range(20):
		var slot = ItemSlotClass.new(i)
		slotList.append(slot)
		add_child(slot)

func addItem(name):
	
	id+=1
	
	
	for i in range(0,slotList.size()):
		
		
	
		
		if slotList[i].item == null:
			
		
			
			print(slotList[i])
			
			
			
			if name == "baguette":
				slotList[i].setItem(ItemClass.new(id,"baguette", itemImages[0], null))
				break

			elif name == "tank":
				slotList[i].setItem(ItemClass.new(id,"tank", itemImages[2], null))
				break
		
		
			elif name == "radar":
				slotList[i].setItem(ItemClass.new(id,"radar", itemImages[3], null))
				break
		
	
			elif name == "booster":
				slotList[i].setItem(ItemClass.new(id,"booster", itemImages[4], null))
				break

	
			elif name == "flux":
		 		slotList[i].setItem(ItemClass.new(id,"flux", itemImages[5], null))
			  break
				
		 
		
			elif name == "hydrogenTank":
				slotList[i].setItem(ItemClass.new(id,"hydrogenTank", itemImages[1], null))
				break
				
		
			
	 
			
			
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
			
				
			
	

func _input(event):
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot;
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position()
			var slotTexture = slot.texture;
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height()
			if isClicked:
				print("clicked" + str(slot))
				clickedSlot = slot
				
				if clickedSlot.item != null:
					if clickedSlot.item.name == "baguette":				
						clickedSlot.useItem()
						Global.Player.heal_lp(20)
					    	
					elif clickedSlot.item.name == 	"tank":
						clickedSlot.useItem()
						Global.Player.gain_o2(20)
					   	
					
					
				
				
					
				
				
				
			
				
			
					
				
				
				
	
				
		

func save_inv():
	var save_dict = {}
	for i in range(0,slotList.size()):
		if slotList[i].item != null:
			var item = {}
			item["itemId"] = slotList[i].item.itemId
			item["itemSlot"] = i
			save_dict[slotList[i].item.itemName] = item
		else:
			var item = {}
			item["itemId"] = "null"
			item["itemSlot"] = i
			save_dict["null" + String(i)] = item
	return save_dict

func load_inv(data):
	for k in data.keys():
		if k.find("null") != -1:
			slotList[data[k]["itemSlot"]].useItem()
		else:
			var item = data[k]
			slotList[item["itemSlot"]].setItem(ItemClass.new(item["itemId"],k, image_dict[k], null))