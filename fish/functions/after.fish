# Defined in /tmp/fish.nYCNWQ/after.fish @ line 2
function after
	set state 0
	argparse 'E-help' 'h/hours=' 'm/mins=' 's/secs=' -- $argv
	if test "$_flag_help"
		echo "after is a fish utility to execute a command after waiting for an amount of time. you can use -h/--hours, -m/--mins, -s/--secs each followed by a number to specify a precise timing. You can use all of them or combine them in any way. If none is used, -s will be assumed. Everything following will be executed as a command"
		echo ""
		echo "Syntax: after [NUMBER] [COMMAND]"
		echo "Example: after 10 echo foo"
		echo ""
		echo "Note: you can't use values smaller than 0 and can't run 'after' without specifying a command; if you just need to idle use 'sleep' instead"
	else
		set time 0
		if test "$_flag_h"
			if test "$_flag_h" -ge 0
				set time (math $time + 3600 \* $_flag_h)
			else
				echo "Negative values are not accepted."
				set state 1
			end
		end
		if test "$_flag_m"
			if test "$_flag_m" -ge 0
				set time (math $time + 60 \* $_flag_m)
			else
				echo "Negative values are not accepted."
				set state 1
			end
		end
		if test "$_flag_s"
			if test "$_flag_s" -ge 0
				set time (math $time + $_flag_s)
			else
				echo "Negative values are not accepted."
				set state 1
			end
		else if test -z "$_flag_m" -a -z "$_flag_h"
			if test "$argv[1]" -ge 0
				set time $argv[1]
				set argv $argv[2..-1]
			else
				echo "Negative values are not accepted."
				set state 1
			end
		end
		
		if test -z $argv[1]
			echo "'after' can't be ran without a command; use sleep or run after --help"
			set state 1
		end

		if test "$state" -eq 0
			echo "Waiting $time seconds before executing..."
			sleep $time; echo "Now executing $argv"; eval $argv
		end
	end
	return $state
end
