#!/bin/bash

for f in *.sme; do
    echo "Translating $f …"
    apertium -d .. sme-nob < "$f" > "${f%.sme}.MT"
done

echo "Creating gists.php …"
./randomise-create-phpgists.py *.MT *.nob > gists.php
