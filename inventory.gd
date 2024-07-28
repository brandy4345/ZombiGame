extends PanelContainer

const Slot = preload("res://inventory/slot.tscn")

@onready var item_grid = $MarginContainer/ItemGrid

func _ready():
	var inv_data = preload("res://inventory/InventoryPrueba.tres")
	populate_item_grid(inv_data.slots)

func setInventoryData(inventoryData: InventoryData)-> void:
	populate_item_grid(inventoryData.slots)

func populate_item_grid(slot_datas: Array[SlotData])->void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot_data in slot_datas:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		if slot_data:
			slot.setSlotData(slot_data)
