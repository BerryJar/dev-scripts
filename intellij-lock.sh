#!/bin/bash

cd /home/z00d/.var/app/com.jetbrains.IntelliJ-IDEA-Community/config/JetBrains/IdeaIC2024.2

rm .lock

folder="/home/z00d/.var/app/com.jetbrains.IntelliJ-IDEA-Community/config/JetBrains/IdeaIC2024.2"
file=".lock"

if [ -f "$folder/$file" ]; then
    echo "Delete failed."
else
    echo "Delete succeeded."
fi

