//
//  ViewController.swift
//  Counter
//
//  Created by Руслан Коршунов on 27.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logField: UITextView!
    @IBOutlet weak var toZero: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var counerButton: UIButton!
    @IBOutlet weak var labelUILabel: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        labelUILabel.textAlignment = .center
        labelUILabel.text = String(counter)
        logField.text = "История изменений:"
        
    }
    
    @IBAction func increaseCounterOnTouch(_ sender: Any) {
        counter += 1
        labelUILabel.text = String(counter)
        addLog(action: "+")
    }
    @IBAction func degreseCounterOnTouch(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            addLog(action: "попытка уменьшить значение счётчика ниже 0")
            counter = 0
            return
        }
        labelUILabel.text = String(counter)
        addLog(action: "-")
    }
    
    @IBAction func counterToZero(_ sender: Any) {
        counter = 0
        labelUILabel.text = String(counter)
        addLog(action: "0")
    }
    func perfomDate() -> String {
        let today: Date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        return dateFormatter.string(from: today)

    }
    func addLog(action: String){
        scrollTextField(textView: logField)
        let data: String = perfomDate()
        if (action.count > 2) {
            logField.textStorage.append(NSAttributedString(string: "\n" + data + " " + action))
            return
        }
        switch action {
        case "0":
            logField.textStorage.append(NSAttributedString(string: "\n" + data + " " + "значение изменено на " + action))
        default:
            logField.textStorage.append(NSAttributedString(string: "\n" + data + " " + "значение изменено на " + action + "1"))
        }
        scrollTextField(textView: logField)
//        logField.textStorage.append(NSAttributedString(string: "\n" + data + " " + "значение изменено на " + action + "1"))
    }
    func scrollTextField(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
}

