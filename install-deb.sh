echo "Let's try installing your .deb file. :)"
echo "This should work on any linux-distro."
echo "Note! Even though this installer should work - it does not yet support running scripts from the 'DEBIAN'-folder."
echo "Important! dpkg is required. If you are running a debian-based system -> run dpkg -i package.deb"

echo "What's the full name of your deb package? (AKA, include the '.deb')"
read package
dpkg-deb -R $package working-dir

echo "Removing the 'DEBIAN'-directory."
rm -rf ./working-dir/DEBIAN

echo "Copying files...."
cp -pr ./working-dir/* /

echo "Cleaning up..."
rm -rf ./working-dir

echo "Done! Check your application menu and see if you find your application."
