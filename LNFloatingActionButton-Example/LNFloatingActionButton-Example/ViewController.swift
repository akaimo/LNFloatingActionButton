//
//  ViewController.swift
//  LNFloatingActionButton-Example
//
//  Created by Shuhei Kawaguchi on 2016/11/26.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import LNFloatingActionButton

class ViewController: UIViewController {
    @IBOutlet weak var sampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "sample"
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        sampleTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if indexPath.row == 0 {
            cell.textLabel?.text = "normal cell"
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "EllipseCellViewController") as! EllipseCellViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            return
        }
    }
}
