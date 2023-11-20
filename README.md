# GithubUser
## Technical Assessment - Datek
This project is a part of a technical challenge to create a mobile app using SwiftUI that displays a collection of users fetched from a remote JSON source. The app allows users to favorite any displayed user, enabling offline viewing of the favorited ones. Additionally, there's an option to switch between showing all users and only the favorited ones.

## Features

- Displays a collection of users fetched from a remote JSON source.
- Allows users to mark favorite users for offline viewing.
- Provides an option to toggle between displaying all users and only the favorited ones.

## User Details Displayed

- User avatar
- Login name
- User type
- Is favorited

## Technical Details

- SwiftUI 
- URLSession
- Combine
- RealM

## API Documentation

- Documentation: [GitHub REST API Documentation](https://docs.github.com/en/rest/users?apiVersion=2022-11-28)
- API Endpoint: [GitHub Users API](https://api.github.com/users)

## Solution

![Alt text](/Screenshots/architecture.png?raw=true "architecture diagram")
###### Below are the items that are covered in this project
- SwiftUI Basic UI displaying Github user list and favorite list
- MVVM Architecture 
- Repository Pattern to handle server and local data
- Services for server and local data
- URLSession Network Layer
- Realm Database

### Project Structure
- GithubUser 
  - GithubUser
  - Core
    - Core contains all the base protocols for network and database layers
  - CoreImpl
    - CoreImpt contains all the implementations for network and database layers
  - Extensions
    - All extensions are placed with proper file name of the extension type are placed in this folder
  - Constants
    - All constants including Strings, and other constants that are being used in the application are placed in this folder
  - Components
    - Some reuseable SwiftUI views
  - Configurations
    - Envoirnments are configured in this folder and descision will be taken on runing schemes
  - Modules
    - Project is divided into smallers modules based on their bussiness logic placed inside this folder.
      - Views
        - All views in a modules are placed in this folder
      - ViewModel
        - Every views view model is placed in here and is responsible of interacting with Repository
      - Data
        - Models
          - Models of that module are placed in here   
        - Endpoint
          - API endpoints   
        - Repository
          - Repository is responsible of comminucating with Service and Database and response back to View Model
        - API Service
          - Service is responsible of communicating with the remote server and returned mapped data back
        - Database Service
          - Database Service is responsible of communicating with local database and returned response back to repo  
## Proud Achievements
  Implementation of SOLID princple and seperation of concern so we can replace any network or database packages without changing the massing UI or business logic, we just need to impmentation of new packges from the provided protocols of core.
## Screenshot
|   |   |
|--------|-----|
|![Alt text](/Screenshots/1.png?raw=true "Screenshot 1") | ![Alt text](/Screenshots/2.png?raw=true "Screenshot 2") |
|![Alt text](/Screenshots/3.png?raw=true "Screenshot 3") | ![Alt text](/Screenshots/4.png?raw=true "Screenshot 4") |
