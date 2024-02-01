#!/bin/bash

# only continue when a valid file was passed as input argument
[ -f "$1" ] || exit 1

base=`basename $1 .yml`

# count how many attachment there are in the YAML file
num=$(yq eval --no-colors '.bugzilla.bug.attachment | length' $1)

if [ $num -eq 0 ] ; then
echo nothing to be done for $1

else

if $(yq eval --no-colors '.bugzilla.bug.attachment[0] == null' $1) ; then

echo removing attachment from $1
echo processing attachment

yq eval ".bugzilla.bug.attachment" $1 > ${base}-attachment1.yml
yq -i ".bugzilla.bug.attachment.data = \"REMOVED\"" $1

else
echo removing attachments from $1

for i in `seq 1 $num` ; do
echo processing attachment $i
# the indexing in the YAML list runs from 0 to N-1, not from 1..N
j=$(expr $i - 1)
yq eval ".bugzilla.bug.attachment[$j]" $1 > ${base}-attachment${i}.yml
yq -i ".bugzilla.bug.attachment[$j].data = \"REMOVED\"" $1
done

fi
fi
