echo "What's the name of your image? (include '.appimage') "
read image

chmod a+x $image

echo "What do you want to call your application?"
read name
touch ${name}.desktop

echo "Creating .desktop file..."

echo "[Desktop Entry]" > ${name}.desktop
echo "Name=${name}" >> ${name}.desktop

echo "Add a description:"
read desc
echo "Comment=${desc}" >> ${name}.desktop

echo "Exec=/usr/share/applicationimages/$name/$image" >> ${name}.desktop
echo "Type=Application" >> ${name}.desktop

echo "Want to add categories? Seperated with semicolons, ';'."
read cats
echo "Categories=${cats}" >> ${name}.desktop

mkdir /usr/share/applicationimages
mkdir /usr/share/applicationimages/$name
cp -rp $image /usr/share/applicationimages/$name
cp -rp ${name}.desktop /usr/share/applications

rm -rf $image
rm -rf ${name}.desktop
echo Done!

read -r -p "Do you want to open ${name}? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo Okay, starting...
	/usr/share/applicationimages/$name
        ;;
    *)
        echo Okay... 
        ;;
esac
