set -e
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Building standalone classifier"

cd $SCRIPTPATH

if [ "$#" -eq  "0" ]
then
    echo "Running MAKE in single-threaded mode"
    sleep 1
    make
else
    if ! [[ $1 =~ ^[0-9]+$ ]]
    then
        echo "Provided argument is not a number. Running MAKE in single-threaded mode"
        sleep 1
        make
    else
        echo "Running MAKE with $1 threads"
        sleep 1
        make -j $1
    fi
fi

echo "Building standalone classifier OK"
