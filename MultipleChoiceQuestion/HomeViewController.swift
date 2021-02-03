//
//  ViewController.swift
//  MultipleChoiceQuestion
//
//  Created by Kevin on 2021/2/2.
//

import UIKit

class HomeViewController: UIViewController {
    var questions: [Question]! = []
    var position = 0
    var currentPoint = 0
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var choice4Button: UIButton!
    @IBOutlet weak var currentPositionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentPoint = 0
        position = 0
        questions = []
        pointLabel.text = String("分數：\(currentPoint) 分")
        currentPositionLabel.text = String("第 \(position+1) 題 / 共 10 題")
        setQuestions()
        showQuestion()
    }
    
    @IBAction func UnWind(for segue :UIStoryboardSegue)
    {
        currentPoint = 0
        position = 0
        questions = []
        pointLabel.text = String("分數：\(currentPoint) 分")
        currentPositionLabel.text = String("第 \(position+1) 題 / 共 10 題")
        setQuestions()
        showQuestion()
    }
    
    func initialize() {
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let choice = sender.currentTitle
        var ans = 0
        switch choice {
        case questions[position].choice1:
            ans = 1
        case questions[position].choice2:
            ans = 2
        case questions[position].choice3:
            ans = 3
        case questions[position].choice4:
            ans = 4
        default:
            break
        }
        if questions[position].answer == ans {
            currentPoint += 10
            pointLabel.text = String("分數：\(currentPoint) 分")
        }
        if position < 9 {
            position += 1
            showQuestion()
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    func showQuestion(){
        questionLabel.text = questions[position].question
        choice1Button.setTitle(questions[position].choice1, for: .normal)
        choice2Button.setTitle(questions[position].choice2, for: .normal)
        choice3Button.setTitle(questions[position].choice3, for: .normal)
        choice4Button.setTitle(questions[position].choice4, for: .normal)
        currentPositionLabel.text = String("第 \(position+1) 題 / 共 10 題")
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.point = currentPoint
        return controller
    }
    
    func setQuestions(){
        questions.append(Question(question: "以下哪一個大洲的面積最大？", choice1: "大洋洲", choice2: "南美洲", choice3: "非洲", choice4: "亞洲", answer: 4))
        questions.append(Question(question: "地球表面凸起，會形成以下哪一種自然景物", choice1: "河谷", choice2: "海洋", choice3: "盆地", choice4: "山脈", answer: 4))
        questions.append(Question(question: "風力發電的原理是以風推動發電機的哪一個部分產生動力", choice1: "主軸", choice2: "車葉", choice3: "變連箱", choice4: "發電站", answer: 2))
        questions.append(Question(question: "以下哪一項不是水的用途？", choice1: "飲用", choice2: "呼吸", choice3: "煮食", choice4: "清潔", answer: 2))
        questions.append(Question(question: "以下哪一種情況會減慢水的蒸發速度？", choice1: "高溫", choice2: "低溫", choice3: "水接觸空氣的範圍加大", choice4: "空氣流通", answer: 2))
        questions.append(Question(question: "以下哪一項不是空氣的特性？", choice1: "沒有顏色", choice2: "沒有氣味", choice3: "有固定的形狀", choice4: "佔有空間", answer: 3))
        questions.append(Question(question: "人類吸入甚麼氣體以維持生命？", choice1: " 二氧化碳", choice2: "一氧化硫", choice3: "氮", choice4: "氧", answer: 4))
        questions.append(Question(question: "貝爾發明了甚麼通訊設備？", choice1: "電話", choice2: "電報機", choice3: "網路", choice4: "電腦", answer: 1))
        questions.append(Question(question: "以下哪一種科技產品不能傳遞信息？", choice1: "電話", choice2: "電視", choice3: "收音機", choice4: "微波爐", answer: 4))
        questions.append(Question(question: "以下哪一項是保護呼吸系統的方法？", choice1: " 保持空氣流通", choice2: "飲食定時和定量", choice3: "用被子蒙著頭睡覺", choice4: "吃高鹽分的食物", answer: 1))
        questions.append(Question(question: "我們用甚麼工具能夠看見細菌和病毒？", choice1: "放大鏡", choice2: "反光鏡", choice3: "顯微鏡", choice4: "哈哈鏡", answer: 3))
        questions.append(Question(question: "以下哪一種方法可以消滅細菌和病毒？", choice1: "用枱燈晾曬衣服", choice2: "把香水放在浴室內", choice3: "用漂白水清潔家具", choice4: "把消毒藥水貯存在冰箱裏", answer: 3))
        questions.shuffle()
    }
}
