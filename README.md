{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\f0\fs24 \cf0 # News Reader App\
\
## Description\
This is a simple news reader application developed for iOS that fetches news articles from the News API. Users can browse a list of articles, read full content, bookmark articles, and filter news by category.\
\
## Technical Stack\
- **Language**: Swift\
- **UI Framework**: SwiftUI\
- **Architecture**: MVVM (Model-View-ViewModel)\
- **Networking**: URLSession\
- **Persistence**: Core Data (for bookmarking)\
- **Dependency Management**: Swift Package Manager (if needed)\
\
## Features\
- Browse articles with titles and summaries.\
- Read full articles by tapping on them.\
- Bookmark articles for later reading.\
\
## News Read API Details
1. https://newsapi.org/ I have used this news API portal to read public news.
2. This is the newsread API key: 395613b97e4145f58664b501a7fb4cd7
3. As this is the demo and public portal, there is a limitation that this API key is valid for 2 days only.
4. Sometimes if you see that API key is not valid or expired, then you have to generate it again with a tempemail address from the above portal.

## Setup Instructions\
1. Clone the repository.\
2. Open the project in Xcode.\
3. Replace `YOUR_API_KEY` in `NetworkManager.swift` with your actual News API key.\
4. Run the app on a simulator or device.\
\
## Testing\
Unit tests are included for the `NetworkManager` and `NewsViewModel` to ensure functionality.\
\
## Future Improvements\
- Implement search functionality for articles.\
- Add user authentication for personalized bookmarks.\
- Enhance UI with animations and better design elements.}

  ## Screen shots
  
<p align="center"><img src="Simulator Screenshot - iPhone 16 - 2024-11-26 at 23.40.53.png" width="1000"></p>
<p align="center"><img src="Simulator Screenshot - iPhone 16 - 2024-11-26 at 23.40.49.png" width="1000"></p>
