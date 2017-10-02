//
//  TitleCellViewController.swift
//  LNFloatingActionButton-Example
//
//  Created by Shuhei Kawaguchi on 2017/10/02.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import LNFloatingActionButton

class TitleCellViewController: UIViewController {
    
    var cells: [LNFloatingActionButtonCell] = []
    var floatingActionButton: LNFloatingActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let cell: LNFloatingActionButtonTitleCell = {
            let cell = LNFloatingActionButtonTitleCell()
            cell.title = "like button"
            cell.image = UIImage(named: "like")
            return cell
        }()
        cells.append(cell)
        
        let cell2: LNFloatingActionButtonTitleCell = {
            let cell = LNFloatingActionButtonTitleCell()
            cell.title = "home button"
            cell.image = UIImage(named: "home")
            return cell
        }()
        cells.append(cell2)
        
        let fab: LNFloatingActionButton = {
            let fab = LNFloatingActionButton(x: view.frame.size.width - 100, y: view.frame.size.height - 100)
            fab.dataSource = self
            fab.delegate = self
            fab.color = .white
            fab.shadowOffset = CGSize(width: 0.0, height: 2.0)
            fab.shadowOpacity = 0.5
            fab.shadowRadius = 2.0
            fab.shadowPath = fab.circlePath
            fab.closedImage = UIImage(named: "plus")
            fab.cellMargin = 10
            return fab
        }()
        view.addSubview(fab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension TitleCellViewController: LNFloatingActionButtonDelegate {
    func floatingActionButton(_ floatingActionButton: LNFloatingActionButton, didSelectItemAtIndex index: Int) {
        print(index)
    }
}

extension TitleCellViewController: LNFloatingActionButtonDataSource {
    func numberOfCells(_ floatingActionButton: LNFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LNFloatingActionButtonCell {
        return cells[index]
    }
}
