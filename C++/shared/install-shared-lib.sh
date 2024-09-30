set -e
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTPATH

echo "Building standalone classifier OK"

EXPORT_PATH=${SCRIPTPATH}/libedgeimpulse
echo $EXPORT_PATH

echo "Preparing library install dirs"
sleep 1

rm -rf $EXPORT_PATH
mkdir -p $EXPORT_PATH
mkdir -p $EXPORT_PATH/include

rsync -avm --include='*.h' -f 'hide,! */' . $EXPORT_PATH/include
rsync -avm --include='*.hpp' -f 'hide,! */' . $EXPORT_PATH/include


mkdir -p $EXPORT_PATH/lib
cp ${SCRIPTPATH}/build/* $EXPORT_PATH/lib

