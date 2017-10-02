//
//  NormalCellViewController.swift
//  LNFloatingActionButton-Example
//
//  Created by Shuhei Kawaguchi on 2017/10/01.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import LNFloatingActionButton

class NormalCellViewController: UIViewController {
    
    var cells: [LNFloatingActionButtonCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let cell: LNFloatingActionButtonCell = {
           let c = LNFloatingActionButtonCell()
            c.size = 30
            c.image = UIImage(named: "like")
            return c
        }()
        cells.append(cell)
        
        let cell2: LNFloatingActionButtonCell = {
           let c = LNFloatingActionButtonCell()
            c.size = 30
            c.image = UIImage(named: "home")
            return c
        }()
        cells.append(cell2)
        
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
            button.cellMargin = 20
            return button
        }()
        view.addSubview(fab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension NormalCellViewController: LNFloatingActionButtonDelegate {
    func floatingActionButton(_ floatingActionButton: LNFloatingActionButton, didSelectItemAtIndex index: Int) {
        print(index)
        floatingActionButton.close()
    }
}

extension NormalCellViewController: LNFloatingActionButtonDataSource {
    func numberOfCells(_ floatingActionButton: LNFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LNFloatingActionButtonCell {
        return cells[index]
    }
}
