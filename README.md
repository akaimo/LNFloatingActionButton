# LNFloatingActionButton
![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/LNFloatingActionButton.svg?style=flat)](http://cocoapods.org/pods/LNFloatingActionButton)
[![License](https://img.shields.io/cocoapods/l/LNFloatingActionButton.svg?style=flat)](http://cocoapods.org/pods/LNFloatingActionButton)
[![Platform](https://img.shields.io/cocoapods/p/LNFloatingActionButton.svg?style=flat)](http://cocoapods.org/pods/LNFloatingActionButton)
  
LNFloatingActionButton is an easily customizable Floating Action Button.

## Preview
<img src="https://github.com/akaimo/LNFloatingActionButton/blob/master/Images/normal_cell.gif" width='187' alt="Preview gif"><img src="https://github.com/akaimo/LNFloatingActionButton/blob/master/Images/title_cell.gif" width='187' alt="Preview gif"><img src="https://github.com/akaimo/LNFloatingActionButton/blob/master/Images/ellipse_cell.gif" width='187' alt="Preview gif">

## Requirements
- Swift 3.0 or later
- iOS 8.0 or later

## Installation
#### [Carthage](https://github.com/Carthage/Carthage)
```
github "akaimo/LNFloatingActionButton"
```

#### [CocoaPods](https://github.com/cocoapods/cocoapods)
```
pod 'LNFloatingActionButton', '~> 0.1'
```

## Usage
It is designed like UITableView.
```swift
var cells: [LNFloatingActionButtonCell] = []

let cell = LNFloatingActionButtonCell()
cell.image = UIImage(named: "action_image")
cells.append(cell)

let fab = LNFloatingActionButton()
fab.delegate = self
fab.dataSource = self
fab.closedImage = UIImage(named: "close_image")
view.addSubview(fab)

// LNFloatingActionButtonDataSource
func numberOfCells(_ floatingActionButton: LNFloatingActionButton) -> Int {
    return cells.count
}
    
func cellForIndex(_ index: Int) -> LNFloatingActionButtonCell {
    return cells[index]
}

// LNFloatingActionButtonDelegate
func floatingActionButton(_ floatingActionButton: LNFloatingActionButton, didSelectItemAtIndex index: Int) {
    // action ...
    floatingActionButton.close()
}
```

### Setting Button
##### Button Image
```swift
fab.closedImage = UIImage(named: "close")
// default is nil
// When it is nil, closeImage turn
fab.openedImage = UIImage(named: "open")
```

##### Change the size
```swift
fab.size = 45
```

##### Change the colors
```swift
fab.color = .white
// Change color while tapping
fab.touchingColor = .lightGray
```
