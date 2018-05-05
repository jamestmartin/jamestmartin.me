cd templates/
stack exec html-generator -- --sitemap $(find .. -type f -name "*.hs" | grep -v "./templates")
cd ..
