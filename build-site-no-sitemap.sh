cd templates/
stack exec html-generator -- $(find .. -type f -name "*.hs" | grep -v "./templates")
cd ..
