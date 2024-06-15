extends Node2D

const WARM_VALUE = 1

func _on_firebot_websocket_on_warm_egg() -> void:
	$TemperatureBar.value += WARM_VALUE
	#$TemperatureBar.color
	pass # Replace with function body.


func _on_firebot_websocket_on_cool_egg() -> void:
	$TemperatureBar.value -= WARM_VALUE
	pass # Replace with function body.
