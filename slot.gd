extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel



func setSlotData(slotData: SlotData)-> void:
	var itemData = slotData.item
	texture_rect.texture = itemData.texture
	tooltip_text = "%s\n%s" % [itemData.nombre,itemData.descripcion]
	
	if slotData.quantity >1:
		quantity_label.text = "%s" % slotData.quantity
		quantity_label.show()
