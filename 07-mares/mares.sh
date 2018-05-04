#!bin/sh

./manger &

# just wait until all the process are executed so you can kill them
sleep 15

kill -s KILL $(pgrep crap lampon ruins xanthos yes)

# ps aux wasnt working correctly so i changed to top - roomate's idea lol
kill -s KILL $(top -l 1 | grep manger | awk '{print $1}')

rm -rf *.poo

