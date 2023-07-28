//
//  ViewController.swift
//  Counter
//
//  Created by Руслан Коршунов on 27.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var logField: UITextView!
    @IBOutlet weak private var toZeroButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var counerButton: UIButton!
    @IBOutlet weak private var countLabel: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.textAlignment = .center
        countLabel.text = String(counter)
        logField.text = "История изменений:"
        logField.isUserInteractionEnabled = false
    }
    
    @IBAction private func increaseCounterOnTouch(_ sender: Any) {
        counter += 1
        countLabel.text = String(counter)
        addLog(action: "+")
    }
    @IBAction private func degreseCounterOnTouch(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            addLog(action: "попытка уменьшить значение счётчика ниже 0")
            counter = 0
            return
        }
        countLabel.text = String(counter)
        addLog(action: "-")
    }
    
    @IBAction private func counterToZero(_ sender: Any) {
        counter = 0
        countLabel.text = String(counter)
        addLog(action: "0")
    }
    private func perfomDate() -> String {
        let today: Date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        return dateFormatter.string(from: today)

    }
    private func addLog(action: String){
        scrollTextField(textView: logField)
        let data: String = perfomDate()
        if (action.count > 2) {
            logField.textStorage.append(NSAttributedString(string: "\n" + data + " " + action))
            return
        }
        switch action {
        case "0":
            logField.textStorage.append(NSAttributedString(
                string: "\n" + data + " " + "значение изменено на " + action)
            )
        default:
            logField.textStorage.append(NSAttributedString(
                string: "\n" + data + " " + "значение изменено на " + action + "1")
            )
        }
        scrollTextField(textView: logField)
    }
    private func scrollTextField(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
}

