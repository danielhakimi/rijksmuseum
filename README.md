# Rijksmuseum

To run the project add a .env file to the root of the folder.

Then add this line: 
    
API_TOKEN={YOUR_API_KEY}

YOUR_API_KEY should be the API for https://data.rijksmuseum.nl/object-metadata/api/

Next, run:
 flutter clean
 
 flutter pub get
 
 flutter packages pub run build_runner build --delete-conflicting-outputs

no problems should be showing and you should be able to run the app on a device or emulator

