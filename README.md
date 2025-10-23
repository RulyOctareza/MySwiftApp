# RestaurantApp

## Overview
RestaurantApp is a simple iOS application that showcases a list of items, each with an image and detailed information. The app includes a main page for displaying the items, a detail page for viewing more information about a selected item, and an about page that provides user identity information.

## Features
- Main Page: Displays a list of at least 10 different items with images and titles.
- Detail Page: Shows detailed information about the selected item, including a description and additional images.
- About Page: Contains user identity information, including name and photo.

## Project Structure
```
RestaurantApp
├── RestaurantApp
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── ViewController.swift
│   ├── DetailViewController.swift
│   ├── AboutViewController.swift
│   ├── Models
│   │   └── Item.swift
│   ├── Views
│   │   └── ItemCell.swift
│   └── Assets.xcassets
│       └── Contents.json
├── RestaurantApp.xcodeproj
│   └── project.pbxproj
├── Info.plist
└── README.md
```

## Setup Instructions
1. Clone the repository or download the project files.
2. Open `RestaurantApp.xcodeproj` in Xcode.
3. Build and run the project on a simulator or a physical device.

## Requirements
- Xcode 12 or later
- iOS 14.0 or later

## Usage
- Launch the app to view the list of items.
- Tap on an item to navigate to the detail page.
- Access the about page from the main view controller to view user information.

## License
This project is licensed under the MIT License.