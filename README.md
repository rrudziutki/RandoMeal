
# RandoMeal

RandoMeal is an app that helps you choose the perfect meal, in moments when you can't make up your mind.
It was build with use of https://www.themealdb.com API, UIKit and Storyboard with Autolayout and MVVM architectural pattern.
In the future there will be Realm database added to the project.

## Description
It fetches information from API, regarding random meals from around the world and displays it.
The user can see images and detailed descriptions of their drawn dish.

On the first screen there are displayed: name, image of the current dish and two buttons - one enabling change of a meal and second used for showing details about current meal.

<img src="https://user-images.githubusercontent.com/76843934/187752484-28ae1ac3-8b85-463a-b92a-d6229f3d654c.png" width="640">


In the second screen user can see full description of the meal and in the near future, they will be able to save them in the Realm database.

<img src="https://user-images.githubusercontent.com/76843934/187753148-5061b1af-500a-4b0d-b38c-8171d0f7de68.png" width="640">


The third screen shows users' saved meals. Every meal is saved in local Realm database.

<img src="https://user-images.githubusercontent.com/76843934/190098640-686acbae-2146-4ca9-b00e-48c10435ed47.png" width="640">


Every cell is interactive and after long press tap gesture - it shows custom context menu.

<img src="https://user-images.githubusercontent.com/76843934/190099859-8bfe8d00-a320-455a-b896-c28d8f153141.png" width="640">


By using autolayout I achieved responsive and scalable UI on every type of the device:

<img src="https://user-images.githubusercontent.com/76843934/187753353-239b7799-fec7-4c65-a263-289900f47476.png" width="640">
<img src="https://user-images.githubusercontent.com/76843934/187753340-d609d2e2-7f60-47a1-bbdc-7e1e4cbb4703.png" width="640">

## In progress
- More information about chosen meals
