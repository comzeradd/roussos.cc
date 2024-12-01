#!/bin/bash
# This alters markup on photos pages to match markup and css

# Add body class
find public/photos/ -type f -name "*.html" -exec sed -i 's/<body>/<body class="photos">/' {} \;

# Change title
find public/photos/ -type f -name "*.html" -exec sed -i 's/<h1><a href="index.html">photos<\/a><\/h1>/<h1 class="title">Nikos Roussos<\/h1>/' {} \;

# Get and set album title
cd public/photos
for f in *.html; do
  if [ "$f" == "index.html" ]; then
    sed -i s/'<div id="albums">/<div id="albums"><h3>\&nbsp;<\/h3>/' $f
    continue
  fi
  title=$(grep "<title>" "$f")
  album=$(echo "$title" | sed 's/<title>.* - //' | sed 's/<\/title>//')
  sed -i s/'<div id="albums">/<div class="album-title"><h3>'"${album}"'<\/h3>/' $f
done
cd ../../

# Replace breadcrumbs
find public/photos/ -type f -name "*.html" -exec sed -i s/'<nav class="breadcrumbs">/<ul class="nav-links">/' {} \;
find public/photos/ -type f -name "*.html" -exec sed -i s/'<a class="breadcrumb-item".*/<li><a href="\/">about<\/a><\/li><li><a href="\/blog\/" class="blog">blog<\/a><\/li><li><a href="\/photos\/" class="photos">photos<\/a><\/li><li><a href="\/projects\/" class="projects">projects<\/a><\/li><li><a href="\/music\/" class="music">music<\/a><\/li><li><a href="\/places\/" class="places">places<\/a><\/li><li><a href="\/readings\/" class="readings">readings<\/a><\/li><li><a href="\/contact\/" class="contact">contact<\/a><\/li>/' {} \;
find public/photos/ -type f -name "*.html" -exec sed -i s/'<\/nav>/<\/ul>/' {} \;

# Copy static files
cp -r public/static/fonts/ public/photos/
cp favicon.ico public/photos/
