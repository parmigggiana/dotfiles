function funcdel --description 'Deletes a fish function'
	if not set -q argv[1]
echo "Expected at least one function to remove"
end

set -l retval 0
for funcname in $argv
set -l funcfile $__fish_config_dir/functions/$funcname.fish

functions --query $funcname
if test $status -eq 1
echo "Function $funcname not found."
set -l retval 1
else
functions --erase $funcname
rm $funcfile
if test -e $funcfile
echo "Couldn't delete function $argv"
set -l retval 1
else 
echo "Function $argv succesfully deleted!"
end
end
end 

return $retval
end
