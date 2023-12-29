# ToDo's App
<table>
  <tr>
    <td>
    <p> Flutter to-do app, enabling users to add, mark as completed, update, and delete tasks. It also offers a handy feature to filter tasks based on completion status—completed, incompleted, or all tasks. Powered by Riverpod for efficient state management and SQLite for local database transactions, this app ensures smooth and responsive task management.
      </p> 
    </td>
  </tr>
</table>

## Project Environment
- You can see the App Preview [here](https://github.com/gusentanan/todoapp/tree/main/arts)

## Architecture 
This app's architecture follows my own opinionated approach, as the official Riverpod documentation doesn't provide specific guidance on structuring code. The architecture consists of three main layers: data, provider, and presentation. 
### Presentation Layer:
The presentation layer is responsible for displaying application data on the screen and facilitating user interaction. It serves as the primary point where the UI reflects changes in the application state, whether triggered by user actions or external events. In this architecture, the presentation layer comprises two main components: 
- Widgets, which represent the visual elements on the screen
- States, responsible for managing asynchronous data mutations and the widget state.

### Providers:
The Providers layer holds objects that encapsulate pieces of state and enable listening to those states. These providers act as bridges between the presentation layer and the data layer, allowing the UI to interact with the application's state. Providers play a crucial role in managing the flow of data and ensuring that the presentation layer stays in sync with the underlying application state.

### Data Layer:
The data layer serves as the foundation of the application, providing the necessary data sources for the application's functionality. It encompasses three distinct classes:

- Data Sources: These are the local databases serving as the primary data source for the application.
- Models: Data classes representing the structure of information returned by the data sources. Models are essential for maintaining a type-safe representation of data.
- Repositories: Repositories facilitate access to models from various sources, ensuring that the application interacts with consistent and type-safe data structures. They act as intermediaries between the data sources and the application, abstracting away the complexities of data retrieval.

In summary, this architectural approach emphasizes a clear separation of concerns, with the presentation layer handling the visual representation of the application state, providers managing state transitions, and the data layer providing a structured and type-safe interface to the underlying data sources.

![todos](https://github.com/gusentanan/todoapp/assets/68723002/db150ea6-431c-4d96-afcd-8a6a03679441)


## Tech Stack
| Dependencies          | Description                                                                                            |
|---------------------  |------------------------------------------------------------------------------------------------------- |
|`Riverpod`             | make it easier to manage and update the state of an app in response to user interaction or other events|
|`sqflite`              | It provides a simple and efficient way to interact with SQLite databases                                                   |
|`path`                | commonly used for working with file and directory paths.                                                                    |
|`equatable`            | simplify the process of implementing equality checks between objects.                                  |


## How to run
Clone this repository and make sure flutter is installed on your machine
- In the project directory get the project dependencies using below command.
  
  ```sh
   flutter pub get
  ```
- Run the project using:
  
  ```sh
   flutter run
  ```

## Hope you found this useful. ⭐ 
