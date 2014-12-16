#!/bin/zsh
#
# Change the cpu governor (apply to all cores).
#
# ----------------------------------------------------------------------------
# 2014 - "THE BEER-WARE LICENSE" (Revision 42):
# Cyril Robin wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------

# TODO:  add an option to choose the freq directly
# TODO: add an option to only get info
#

# Display current state
echo '--- Current policies are:'
cpufreq-info -o

read NCPU <<< $( expr "$(cpufreq-info -o | wc -l)" - 1 )
echo $NCPU

# Modify current state
TMP=/tmp/cpu-option.tmp

echo '--- Choosing CPU governor; available CPU governor are:'

cpufreq-info -g > $TMP
cat $TMP
read NGOV <<< $(cat $TMP | wc -w)
echo $NGOV

#read GOV <<< ( $(cpufreq-info -g )
#GOV = ( "cpufreq-info -g" )
GOV=( $(cpufreq-info -g) )

printf "%s\n" "${GOV[@]}"

select CMD in "${GOV[@]}" "Quit"; do
  case "$REPLY" in
    # Governor
    [1-$NGOV]) echo "Applying the governor $CMD"; break;;
    # Exit
    $(( $NGOV + 1 )) ) echo "So let it be. Goodbye!"; exit 0;;
    *) echo "Invalid option. Try another one."; continue;;
  esac
done

for (( i=0; i < $NCPU; i++ ))
do
  echo "sudo cpufreq-set -c $i -g $CMD"
  sudo cpufreq-set -c $i -g $CMD
done

exit 0
