#!/bin/bash

echo "
My command is '$0'
There were $# arguments on the command line
The first arguments was '$1'
The second arguments was '$2'
The third arguments was '$3'
The fourth arguments was '$4'
"

echo "Shifting..."
shift

echo "
My command is '$0'
There were $# arguments on the command line
The first arguments was '$1'
The second arguments was '$2'
The third arguments was '$3'
The fourth arguments was '$4'
"

echo "Shifting..."
shift

echo "
My command is '$0'
There were $# arguments on the command line
The first arguments was '$1'
The second arguments was '$2'
The third arguments was '$3'
The fourth arguments was '$4'
"
