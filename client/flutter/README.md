# twaslna_delivery

A Delivery App for Clients.

To make this project work on your Platform 

##Lets Getting Started

First of all what we need to make this project work on our platforms

##Requirements

1- Android Studio 4.2+
2- Android sdk 
3- Flutter sdk 2.2 ~ 2.3 (If your flutter sdk is above 2.3 you may need to migrate the project to your preference by following this link (https://flutter.dev/docs/development/androidx-migration)

##Flutter Setup

After install all the kit in the requirements make sure to download flutter and dart plugins
In your IDE terminal write flutter doctor to check your sdk's status

##Before Run Projects  

##(For Android only)
PLease check of your build config in the dir : Project/android/app/build.gradle 

    buildTypes {
        release {

            // make sure to set signingConfigs to debug if you don't have release key
            
            signingConfig signingConfigs.debug

        }
    }

##FireBase Config (For Android And IOS)

Make sure to setup firebase project to create an android app with ios app and follow thier instruction

##Finnaly 

In Andoird studio menu tools -> Flutter -> Flutter Pub Get

Wait.... 

#Note : if shows you some error check your internet connection and if you are in forbidden country make sure to turn vpn on

And Build run 

