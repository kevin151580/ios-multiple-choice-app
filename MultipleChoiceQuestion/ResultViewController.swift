//
//  ResultViewController.swift
//  MultipleChoiceQuestion
//
//  Created by Kevin on 2021/2/3.
//

import UIKit

class ResultViewController: UIViewController {
    var point = 0
    @IBOutlet weak var pointLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = String("總分：\(point)")
    }
}
