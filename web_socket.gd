extends Node

# The URL we will connect to.
@export var websocket_url = "ws://localhost:9253" # Replace with actual server address and port
var socket := WebSocketPeer.new()

signal on_warm_egg
signal on_cool_egg

func _ready():
	if socket.connect_to_url(websocket_url) != OK:
		print("Could not connect.")
		set_process(false)
	else:
		print('Connected!')

func _process(_delta):
	socket.poll()
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var message = socket.get_packet().get_string_from_ascii()
			if(message == 'WARM_EGG'):
				on_warm_egg.emit()
			elif(message == 'COOL_EGG'):
				on_cool_egg.emit()

func _exit_tree():
	socket.close()
