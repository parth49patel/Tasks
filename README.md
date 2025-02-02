# Tasks
A simple and efficient task management app built using SwiftUI and SwiftData.  

## Features Implemented  
### 📝 Task Management  
- Users can add tasks by clicking the "Add Task" button.  
- Tasks are displayed in a list format.  
- Users can mark tasks as completed, and the background color updates accordingly.

### 💾 Data Persistence  
- Uses SwiftData to persist tasks, ensuring they are saved across app sessions.  
- Tasks are assigned an order value to maintain the sequence of items.  

### 🎨 Dynamic UI
- Implements @Environment(.colorScheme) to support light and dark mode.  
- Completed tasks change their background color based on the app’s theme.  

### 🏗️ SwiftUI Integrations  
- @Environment(.dismiss) is used to close the add-task sheet.  
- .onDelete allows users to delete tasks by swiping left.  
- .onMove enables reordering of tasks with drag-and-drop functionality.

## 🔧 How It Works 
1. Click the ➕ button to open the Add Task screen.  
2. Enter a task title and save it.  
3. Tap on a task to toggle its completion status.  
4. Swipe left to delete a task.  
5. Use the edit button to reorder tasks.  

## 🛠️ Technologies Used  
- SwiftUI for UI development  
- SwiftData for local storage  
- MVVM architecture for better code management

## 🚀 Future Enhancements   
- Add notifications for task reminders.  
- Implement categories or tags for better task organization.  
- Sync tasks with CloudKit for multi-device support.
 
## 📷 Screenshots
#### Light Mode
<img src="ToDoList/Assets.xcassets/lightMode.imageset/Screenshot 2024-08-12 at 12.04.38.png" alt="Light Mode" width="300">

#### Dark Mode
<img src="ToDoList/Assets.xcassets/darkMode.imageset/Screenshot 2024-08-12 at 12.06.10.png" alt="Dark Mode" width="300">

#### Add Task
<img src="ToDoList/Assets.xcassets/addTask.imageset/Screenshot 2024-08-12 at 12.07.20.png" alt="Add Task" width="300">

## Installation
1. Clone the repository:  
```diff
git clone https://github.com/parth49patel/TaskList.git  
```
2. Open TaskList.xcodeproj in Xcode.  

3. Build and run the app on a simulator or device.  
