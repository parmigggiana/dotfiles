function update -d 'update stuff'
	echo "[#====]	1/5"
	yay -Syu
	echo "[##===]	2/5"
	nvim +PlugUpgrade +PlugUpdate +q! +q!
	echo "[###==]	3/5"
	fisher self-update
	echo "[####=]	4/5"
	fisher
	echo "[#####]	5/5"
	gem update

	funcdel fish_greeting
	
	echo "UPDATE COMPLETE!"
end
