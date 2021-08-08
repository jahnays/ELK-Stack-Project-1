#!/bin/bash
grep '08:00:00 AM' 0310_Dealer_schedule | awk -F'\t' '{print $1, $3}'

