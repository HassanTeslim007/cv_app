# Simple CV App

A simple 2-page flutter application that displays my basic information. The main page shows the details and it features an edit page where the details can be edited


## The Codebase

The code base tries to simplify each feature and also a separation of logic. it contains pages, widgets, controllers, and core/model. The setup is created for ease in adding future features. There are no external dependencies.

## The Design

It's a simple design using basic Flutter layout widgets. It features a main page that shows basic details, an experience section that can be edited and deleted (using a pop-up menu) with a snack bar that provides a chance to undo an accidental deletion. A skill section that shows my skills and other tools I interact with. You can long-press to delete a skill.
There is a snack bar that navigates to the edit page. It shows current values and they can be edited and saved, there's an add experience section that triggers a dialog to add new experience


## App-link
- [Google Drive Link](https://drive.google.com/file/d/1EIoEozGmwEQh_f5XgoHJLrBlvdHkv14-/view?usp=sharing)


## Challenges
- Since I couldn't use an external library, the major issue was finding my way around the use of a service locator. Calling a new instance of my controller overwrites changes with default values.
- Minor challenges implementing editing experience as dialog won't show on-tap of a pop-up menu item.

## Appetize Link

## Github Repository
- https://github.com/HassanTeslim007/cv_app

