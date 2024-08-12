# Tasks
A simple TaskList App built using SwiftUI.  

## Features Implemented
1. <b>Sheet -></b> User can add task by clicking the Add Task button.  
2. <b>UserDefaults -></b> The tasks are saved in an array which is stored as UserDefaults on the device.
3. <b>@Environment Dismiss -></b> The Add Task sheet has the <i>@Environment(\.dismiss)</i> to dismiss the sheet.  
4. <b>@Environment Color Scheme -></b> The backgound color of a task changes based on whether it is completed or not.  
The app uses the <i>@Environment(\.colorScheme)</i> to determine the color of the background of the completed task, color of the text and the dismiss button in Add Task sheet. The app also supports light and dark mode bt usnig the <i>@Environment(\.colorScheme)</i>.  

## Images
- Light Mode
<img src="ToDoList/Assets.xcassets/lightMode.imageset/Screenshot 2024-08-12 at 12.04.38.png" alt="Light Mode" width="300">

- Dark Mode
<img src="ToDoList/Assets.xcassets/darkMode.imageset/Screenshot 2024-08-12 at 12.06.10.png" alt="Dark Mode" width="300">

- Add Task
<img src="ToDoList/Assets.xcassets/addTask.imageset/Screenshot 2024-08-12 at 12.07.20.png" alt="Add Task" width="300">
