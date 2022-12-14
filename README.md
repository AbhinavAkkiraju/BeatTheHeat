# BeamX

Created for the [World Youth Coders Hackathon 2022](https://www.worldcodingclub.org/world-youth-coders-hackathon-2022/)

What is BeamX?

Our idea solves health problems. We bring innovation to the health field by creating an app
and website.

First of all, our website is designed to get more information about the application and how it
works. You can easily access this information by entering the site.
Second, we created an application. Depending on the temperature in the location of the app
users, we show whether you can go outside and for how long. Additionally, it tells you what
supplies like sunscreen are needed when you go out. Another function of the application is
to show when and how much water you should drink by looking at the temperature.
There are many applications such as Water reminders and Thermometers. However, if we
look at the market, we can see that such an application has not been created. The
application has many effects on people and the environment. Thanks to the application,
water is used as little as possible according to the norm, and you will be able to see what
your needs are. This will help you stay away from health problems. Secondly, due to the
application, excessive water consumption will be reduced and will help to reduce the water
problem.
Finally, I would like to mention that because we will make it available to everyone

## Frontend
Multiplatform mobile app built with Flutter and Dart.

* Fetches cooling center API and displays closest cooling center to user - based on their address - back out to user interface
* Fetches weather forecast API and displays temperature and humidity at users location - based on their address - back out to user interface
* Uses Qubit to store data
* Tells user information about water usage, cooling centers near them, the temperature of their city, etc.
* To Run App: 
* 1. Download Flutter SDK (git clone https://github.com/flutter/flutter.git)
* 2. Download Dart SDK (1.  brew tap dart-lang/dart         2.  brew install dart)
* 3. Install XCode
* 4. Run (sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer)
* 5. Run (sudo xcodebuild -runFirstLaunch)


## Backend
ASP.NET Core Blazor Server-Side web app with REST APIs for delivering weather and nearby cooling center into.

Organizations can register cooling centers to be seen on the app.

* Continuously deployed to [Azure App Service](https://azure.microsoft.com/en-us/services/app-service/) at: https://beattheheat.azurewebsites.net/
* Secure authentication utilizing the [Argon2](https://github.com/P-H-C/phc-winner-argon2) password hashing algorithm.
* Data is stored in a non-relational nosql [Azure Cosmos DB](https://azure.microsoft.com/en-us/services/cosmos-db/) instance.
* Geolocation is provided by [Azure Maps](https://azure.microsoft.com/en-us/services/azure-maps/)
* Weather data is supplied by [OpenWeather](openweathermap.org). Requests are generalized and responses are cached to improve api performance.
* Blazor web app for organizations to register their cooling centers.
* Cooling center api uses stepped queries to improve response times.

### Argon2id Password Hashing
The authentication implementation uses public key cryptography to secure info with the Argon2id password hashing algorithm.
* The algorithm is the winner of Password Hashing Competition ([PHC](https://www.password-hashing.net/)).

### Usage
Refer to [appsettings.json](https://github.com/AbhinavAkkiraju/BeatTheHeat/blob/main/src/BeatTheHeat.Web/appsettings.json) for relevent environmental variables.
* OpenWeather:APIKey -> https://openweathermap.org/appid
    * It can take a few hours for the api key to activate.
* CosmosDB:CONN_STR -> https://azure.microsoft.com/en-us/services/cosmos-db/#overview OR https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator?tabs=ssl-netstd21
    * Use the primary connection string.
    * Database and containers are generated automatically.
* SMTP:* -> Fill in SMTP info for email sending using StartTLS encryption.
* AzureGeolocation:APIKey -> https://azure.microsoft.com/en-us/services/azure-maps/
    * Use the shared key.
* AdminPassword -> Use with "admin" as email to login as admin.

Build/Run with [.NET 6 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0).

### Public APIs

* `/api/v1/cooling-centers`
    * `/near` [GET]
        * __Gets the nearest cooling centers.__
        * Max distance 200 km.
        * *Required query Parameters*:
            * `latitude` [-90.0 to 90.0]
            * `longitude` [-180.0 to 180.0]
        * Example: 
        ```json
        "GET https://beattheheat.azurewebsites.net/api/v1/cooling-centers/near?latitude=47.6062&longitude=-122.3321"
        EXAMPLE LOCATIONS, NOT CURRENTLY ACTIVE COOLING CENTERS
        [
            {
                "name": "Seattle City Hall",
                "longitude": -122.33006,
                "latitude": 47.60383,
                "address": "600 4th Avenue, Seattle, WA 98104, United States ",
                "description": ""
            },
            {
                "name": "Seattle center",
                "longitude": -122.34955,
                "latitude": 47.6215,
                "address": "305 Harrison Street, Seattle, WA 98109, United States ",
                "description": ""
            },
            {
                "name": "Roosevelt Station",
                "longitude": -122.31728,
                "latitude": 47.63834,
                "address": "12th Avenue East, Seattle, WA 98102, United States ",
                "description": "Link Light Rail station"
            },
            {
                "name": "Roosevelt High School",
                "longitude": -122.31337,
                "latitude": 47.67728,
                "address": "1410 Northeast 66th Street, Seattle, WA 98115, United States ",
                "description": ""
            },
            {
                "name": "SPL Ballard Branch",
                "longitude": -122.38432,
                "latitude": 47.66982,
                "address": "5614 22nd Avenue Northwest, Seattle, WA 98107, United States ",
                "description": "Seattle Public Library"
            }
        ]
        ```

    * `/near-address` [GET]
        * __Gets the nearest cooling centers.__
        * Max distance 200 km.
        * *Required query Parameters*:
            * `address`
        * Example: 
        ```json
        "GET https://localhost:7084/api/v1/cooling-centers/near-address?address=400%20Broad%20St%2C%20Seattle%2C%20WA%2098109"
        EXAMPLE LOCATIONS, NOT CURRENTLY ACTIVE COOLING CENTERS
        [
            {
                "name": "Seattle center",
                "longitude": -122.34955,
                "latitude": 47.6215,
                "address": "305 Harrison Street, Seattle, WA 98109, United States ",
                "description": ""
            },
            {
                "name": "Seattle City Hall",
                "longitude": -122.33006,
                "latitude": 47.60383,
                "address": "600 4th Avenue, Seattle, WA 98104, United States ",
                "description": ""
            },
            {
                "name": "Roosevelt Station",
                "longitude": -122.31728,
                "latitude": 47.63834,
                "address": "12th Avenue East, Seattle, WA 98102, United States ",
                "description": "Link Light Rail station"
            },
            {
                "name": "SPL Ballard Branch",
                "longitude": -122.38432,
                "latitude": 47.66982,
                "address": "5614 22nd Avenue Northwest, Seattle, WA 98107, United States ",
                "description": "Seattle Public Library"
            },
            {
                "name": "Roosevelt High School",
                "longitude": -122.31337,
                "latitude": 47.67728,
                "address": "1410 Northeast 66th Street, Seattle, WA 98115, United States ",
                "description": ""
            }
        ]
        ```

* `/api/v1/geolocation`
    * `/geocode` [GET]
        * __Gets coordinates for an address query.__
        * *Required query Parameters*:
            * `query`
        * Example: 
        ```json
        "GET https://beattheheat.azurewebsites.net/api/v1/Geolocation/geocode?query=one%20microsoft%20way%20redmond"

        [
            {
                "lat": 47.64016,
                "lon": -122.1245,
                "address": "Microsoft Way, Redmond, WA 98052, United States "
            },
            {
                "lat": 47.64351,
                "lon": -122.13056,
                "address": "157th Avenue Northeast, Redmond, WA 98052, United States "
            },
            {
                "lat": 35.14143,
                "lon": -80.91976,
                "address": "Microsoft Way, Charlotte, NC, United States "
            },
            {
                "lat": 47.67433,
                "lon": -122.12327,
                "address": "Redmond Way, Redmond, WA, United States "
            },
            {
                "lat": 35.92012,
                "lon": -78.5379,
                "address": "One World Way, Wake Forest, NC 27587, United States "
            }
        ]
        ```

* `/api/v1/weather-forecast`
    * `/current` [GET]
        * __Gets the current weather.__
        * *Required query Parameters*:
            * `latitude` [-90.0 to 90.0]
            * `longitude` [-180.0 to 180.0]
        * Example: 
        ```json
        "GET https://beattheheat.azurewebsites.net/api/v1/weather-forecast/current?latitude=47.6062&longitude=-122.3321"

        {
            "date": "2022-08-05T17:31:49.4645041Z",
            "temperatureC": 18,
            "temperatureF": 64,
            "humidity": 71,
            "summary": null,
            "city": "Seattle"
        }
        ```

    * `/current` [GET]
        * __Gets the current weather.__
        * *Required query Parameters*:
            * `address`
        * Example: 
        ```json
        "GET https://localhost:7084/api/v1/weather-forecast/current-address?address=400%20Broad%20St%2C%20Seattle%2C%20WA%2098109"

        {
            "date": "2022-08-06T00:40:02.6494856Z",
            "temperatureC": 23,
            "temperatureF": 73,
            "humidity": 57,
            "summary": null,
            "city": "Seattle"
        }
        ```
