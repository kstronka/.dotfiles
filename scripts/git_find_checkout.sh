#!/bin/bash
name=$(git branch | grep $1)
git checkout $name
