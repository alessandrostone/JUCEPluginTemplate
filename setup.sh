#!/bin/bash

plugin_name=$1
repo_name=$2

if [ -z "$2" ]; then
    repo_name=$plugin_name
fi

echo "Creating repo ${repo_name}..."
echo "Creating plugin ${plugin_name}"

echo "Setting up repo files..."
sed -i "s/TempPlugin/${repo_name}/g" README.md

echo "Copying source files..."
mv src/TempPlugin.h src/${plugin_name}.h
mv src/TempPlugin.cpp src/${plugin_name}.cpp

echo "Setting up source files..."
declare -a source_files=("validate.sh" "win_builds.sh" "CMakeLists.txt" "src/CMakeLists.txt" "src/${plugin_name}.h" "src/${plugin_name}.cpp")
for file in "${source_files[@]}"; do
    sed -i "s/TempPlugin/${plugin_name}/g" $file
done