//
//  EllipseCellViewController.swift
//  LNFloatingActionButton-Example
//
//  Created by Shuhei Kawaguchi on 2017/10/01.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import LNFloatingActionButton

class EllipseCellViewController: UIViewController {
    
    var cells: [LNFloatingActionButtonCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let ellipseCell: LNFloatingActionButtonEllipseCell = {
            let cell = LNFloatingActionButtonEllipseCell()
            cell.ellipseSize = CGSize(width: 150, height: 30)
            cell.titleTextAlignment = .center
            cell.title = "like button"
            cell.image = UIImage(named: "like")
            return cell
        }()
        cells.append(ellipseCell)
        
        let ellipse2Cell: LNFloatingActionButtonEllipseCell = {
            let cell = LNFloatingActionButtonEllipseCell()
            cell.ellipseSize = CGSize(width: 150, height: 30)
            cell.titleTextAlignment = .center
            cell.title = "home button"
            cell.image = UIImage(named: "home")
            return cell
        }()
        cells.append(ellipse2Cell)
        
        let fab: LNFloatingActionButton = {
            let button = LNFloatingActionButton(x: view.frame.size.width - 100, y: view.frame.size.height - 100)
            button.delegate = self
            button.dataSource = self
            button.color = .white
            button.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.shadowOpacity = 0.5
            button.shadowRadius = 2.0
            button.shadowPath = button.circlePath
            button.closedImage = UIImage(named: "plus")
            button.cellHorizontalAlign = .right
            button.isBackgroundView = true
            return button
        }()
        view.addSubview(fab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension EllipseCellViewController: LNFloatingActionButtonDelegate {
    func floatingActionButton(_ floatingActionButton: LNFloatingActionButton, didSelectItemAtIndex index: Int) {
        print(index)
        floatingActionButton.close()
    }
}

extension EllipseCellViewController: LNFloatingActionButtonDataSource {
    func numberOfCells(_ floatingActionButton: LNFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LNFloatingActionButtonCell {
        return cells[index]
    }
}
