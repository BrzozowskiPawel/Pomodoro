# Pomodoro 🍅
Swift app that can help to stay focussed. In this project I have added UserDefaults to story setting for each Pomodoro. </br>
It uses a timer to break work into intervals, traditionally 25 minutes in length, separated by short breaks. Each interval is known as a pomodoro, from the Italian word for 'tomato', after the tomato-shaped kitchen timer Cirillo used as a university student.

## Table of Contents

- [Demo](#demo)

- [Descripition](#description)

- [Techonogies](#techonogies)

- [UI description](#ui-description)

- [Improvements](#improvements)

## Demo


<img src="WorldHolidays/readme_files/DEMO.gif" alt="demo_gif" width="372"/> 

## Description

This app is my version of Pomodoro. </br>
It was inspired by the android Pomodoro app and implemented by me in IOS. </br>
You can use one of three Pomodoros and change the time for each Pomodoro. </br>
After the time is up there is an alarm to remind you about the break. </br>



## Techonogies

It is a native application that has been made using Swift with Storyboard. </br>
Also, I have implemented background video and alarm sound thanks to the `AVFoundation`. </br>



## UI description
This app contains 2 screens: 
- First screen is when the user can choose Pomodoro which she/he could use. 
- Second screen when currently chosen Pomodoro is displayed. 
Besides that users can use the gear icon to change the time for the current Pomodoro. </br>
This is working with the help of alert. </br>
After the time is up alarm is playing and the label changes: </br>

<img src="WorldHolidays/readme_files/TIMESUP.gif" alt="demo_gif" width="372"/> 

## Room for improvements

- times should be entered in `hh:mm:ss` format instead of seconds.
 
