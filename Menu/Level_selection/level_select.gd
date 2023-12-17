extends Control
class_name LevelSelect

@onready var current_level: LevelIcon = $LevelIcon
var current_index: int = 0
var move_tween: Tween
var clickeffect = ClickEffect

func _ready():
	$PlayerIcon.global_position = current_level.global_position
	
func _input(event):
	if move_tween and move_tween.is_running():
		return
		
	if event.is_action_pressed("ui_left") and current_level.next_level_left:
		current_level = current_level.next_level_left
		current_index = int(current_level.level_name)
		tween_icon()
	if event.is_action_pressed("ui_right") and current_level.next_level_right:
		current_level = current_level.next_level_right
		current_index = int(current_level.level_name)
		tween_icon()
	if event.is_action_pressed("ui_up") and current_level.next_level_up:
		current_level = current_level.next_level_up
		current_index = int(current_level.level_name)
		tween_icon()
	if event.is_action_pressed("ui_down") and current_level.next_level_down:
		current_level = current_level.next_level_down
		current_index = int(current_level.level_name)
		tween_icon()

	if event.is_action_pressed("ui_accept"):
		if current_level.next_scene_path and Game.progress >= current_index :
			get_tree().change_scene_to_file(current_level.next_scene_path)
			Game.save_scene(current_level.next_scene_path)
		else:
			return
			
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
			
func tween_icon():
	move_tween = get_tree().create_tween()
	move_tween.tween_property($PlayerIcon, "global_position", current_level.global_position, 0.6).set_trans(Tween.TRANS_SINE)

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	clickeffect.play()
