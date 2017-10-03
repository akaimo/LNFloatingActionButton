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

## Additional settings
### Floating Action Button
##### Button Image
```swift
fab.closedImage = UIImage(named: "close")
// default is nil
// When it is nil, display closedImage
fab.openedImage = UIImage(named: "open")

// Size of image relative to fab size
fab.internalRatio = 0.75
```

##### Change the size
```swift
fab.size = 45
```

##### Change the colors
```swift
fab.color = .white
// Change color while tapping
tab.responsible = true
fab.touchingColor = .lightGray
```

##### Overlay
```swift
fab.isBackgroundView = true
fab.backgroundViewColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
```

##### Button shadow
```swift
fab.shadowOffset = CGSize(width: 0.0, height: 2.0)
fab.shadowOpacity = 0.5
fab.shadowRadius = 2.0
fab.shadowPath = fab.circlePath
```

##### Reference position of cell
```swift
// default is .center
fab.cellHorizontalAlign = .left
```

##### Title position of cell
```swift
// default is .left
fab.titleLabelPosition = .right
```

##### Cell margin
```swift
// Cell to cell margin
fab.cellMargin = 10.0
// FAB to cell margin
fab.btnToCellMargin = 15.0
```

### Floating Action Button Cell
##### Cell image
```swift
cell.image = UIImage(named: "")

// Size of image relative to fab size
cell.internalRatio = 0.75
```

##### Change the size
```swift
cell.size = 45
```

##### Change the colors
```swift
cell.color = .white
// Change color while tapping
cell.responsible = true
cell.touchingColor = .lightGray
```
