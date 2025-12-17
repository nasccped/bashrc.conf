#!/bin/sh

BASH_SRC=./conf/.bashrc
BASH_DEST=~/.bashrc
BASH_DIR=~/.bashrc.d
BASH_SRC_CONTENT="$(cat $BASH_SRC)"

FAIL="FAIL"
OK="OK"
WARN="WARN"

RESET="\e[0m"
RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
CYAN="\e[96m"
WHITE="\e[97m"

report() {
	local label="$1"
	local msg="$2"
	local white=$(printf "$WHITE")
	local color pad
	local reset=$(printf "$RESET")
	case "$1" in
		"$FAIL")
			color=$(printf "$RED");;
		"$OK")
			color=$(printf "$GREEN");;
		"$WARN")
			color=$(printf "$YELLOW");;
		*)
			color=$(printf "$RESET");;
	esac
	pad=$(( (4 - ${#label}) / 2 ))
	printf "%s[%s%*s%s%*s%s]%s %s\n" \
		"$white" \
		"$color" \
		"$pad" "" \
		"$label" \
		"$((4 - pad - ${#label}))" "" \
		"$white" \
		"$reset" \
		"$msg"
}

if [ ! -f $BASH_DEST ]; then
	report $WARN "Bash file doesn't exists, copying...";
	cp $BASH_SRC $BASH_DEST;
	if [ ! $? -eq 0 ]; then
		report $FAIL "Couldn't copy the file (cp command returned $?)";
		exit $?;
	fi
	report $OK "Copy done!";
elif ! grep -Fq "$BASH_SRC_CONTENT" "$BASH_DEST" ; then
	report $WARN "Local bashrc file doesn't contains the expected script, contatenating...";
 	echo "$BASH_SRC_CONTENT" >> "$BASH_DEST";
	report $OK "Done!";
else
	report $OK "Bash file exists + contains expected script";
fi

if [ ! -d "$BASH_DIR" ]; then
	mkdir "$BASH_DIR";
	if [ ! $? -eq 0 ]; then
		report $FAIL "Bash directory creation failed!";
		exit $?;
	fi
	report $OK "Bash dir created...";
fi

echo -e "\ncopying each subscript to bash dir:\n";

for f in ./conf/.bashrc.d/*.sh; do
	curr_file=$(echo "$f" | cut -d "/" -f 4);
	echo -ne "  $GREEN>$RESET $curr_file";
	if [ -f "$BASH_DIR/$curr_file" ]; then
		echo -e "$GREEN already exists$RESET";
	else
		echo -ne "$YELLOW copying$RESET:";
		cp $f "$BASH_DIR/$curr_file";
		if [ $? -eq 0 ]; then
			echo -e "$GREEN done$RESET.";
		else
			echo -e "$RED failed$RESET.";
		fi
	fi
done

echo -e "\nrun \`${CYAN}source ~/.bashrc$RESET\` to apply the changes!\n"
