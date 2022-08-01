#!/bin/bash

cat archivo.txt | tr " " "\n" | sort | grep ^[A-Z]
