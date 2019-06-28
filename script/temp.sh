#!/bin/bash
sensors | grep "Core 0" | grep -o -E '([[:digit:]]{1,3}\.[[:digit:]])' | head -n 1
