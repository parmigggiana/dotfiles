function update -d 'Global update'
	echo "[=====]	pass 1 - Update system and packets"
	yay -Syu --noconfirm

	echo ""
	echo "[#====]	pass 2 - Update neoVim plugins"
	nvim +PlugUpgrade +PlugUpdate +q! +q!

	echo ""
	echo "[##===]	pass 3 - Update fisher and fish plugins"
	fisher self-update
	fisher

	echo ""
	echo "[###==]	pass 4 - Update ruby's gems"
	gem update

	echo ""
	echo "[####=]	pass 5 - Update entropya's files"
	rclone sync entropya:General/ /home/basile/BENEDETTO -P
	
	echo ""
	funcdel fish_greeting
	
	echo ""
	echo "[#####]	Global update completed"
end
