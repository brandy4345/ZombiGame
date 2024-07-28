extends Resource
class_name SlotData

const MAX_STACK_SIZE: int = 10

@export var item: Item
@export_range (1,MAX_STACK_SIZE) var quantity: int = 1: set = setQuantity

func setQuantity(value:int )->void:
	quantity = value
	if quantity>1 and not item.stackeabel:
		quantity = 1
		push_error("%s is not stackeable, setting quantity to 1" % item.nombre)
