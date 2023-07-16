#!/usr/bin/bash

free_space=$(df -h $1 | awk '/\// {print $4}')
printf $free_space


