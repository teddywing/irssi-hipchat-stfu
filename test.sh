#!/usr/bin/env sh

sub=$(pcregrep -M '^sub prettify_hipchat {.*(\n|.)*?^}' hipchat-stfu.pl)

cat > prettify_hipchat.pl <<EOF
use strict;

$sub

1;
EOF

./test.pl

rm prettify_hipchat.pl
