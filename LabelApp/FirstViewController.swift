//
//  ViewController.swift
//  LabelApp
//
//  Created by Иван on 5/23/21.
//

import UIKit

class FirstViewController: UIViewController {
    
    let colorsArray = ["black", "blue", "green", "red", "pink", "cyan" , "yellow"]
    let numberOfLinesArray = [0, 1, 2, 3]
    
    let mainLabel = UILabel()
    let fontSizeSlider = UISlider()
    let textColorPicker = UIPickerView()
    let lineNumberPicker = UIPickerView()
    
    let fontSizeSupportLabel = UILabel()
    let textColorLabel = UILabel()
    let lineNumberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        createAddBarButton()
        
        createMainLabel()
        
        createFontSizeSlider()
        
        createFontSizeSupportLabel()
        
        createTextColorPicker()
        
        createTextColorLabel()
        
        createLineNumberPicker()
        
        createLineNumberLabel()
    }
    
    fileprivate func createMainLabel() {
        mainLabel.frame = CGRect(x: 20, y: 100, width: 372, height: 300)
        mainLabel.font = UIFont(name: "baskerville", size: 30)
        mainLabel.textAlignment = .center
        view.addSubview(mainLabel)
    }
    
    fileprivate func createFontSizeSupportLabel() {
        fontSizeSupportLabel.frame = CGRect(x: 20, y: 415, width: 372, height: 18)
        fontSizeSupportLabel.text = "Change text size"
        fontSizeSupportLabel.textAlignment = .center
        view.addSubview(fontSizeSupportLabel)
    }
    
    fileprivate func createAddBarButton() {
        let addButton = UIBarButtonItem(systemItem: .add)
        addButton.action = #selector(addButtonAction)
        addButton.target = self
        self.navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    fileprivate func createFontSizeSlider() {
        fontSizeSlider.frame = CGRect(x: 20, y: 200, width: 372, height: 20)
        fontSizeSlider.center = view.center
        fontSizeSlider.minimumValue = 1
        fontSizeSlider.maximumValue = 70
        fontSizeSlider.value = 35
        fontSizeSlider.addTarget(self, action: #selector(fontSizeSliderAction), for: .valueChanged)
        view.addSubview(fontSizeSlider)
    }
    
    fileprivate func createTextColorPicker() {
        textColorPicker.frame = CGRect(x: 20, y: 490, width: 372, height: 100)
        textColorPicker.delegate = self
        textColorPicker.dataSource = self
        textColorPicker.tag = 0
        view.addSubview(textColorPicker)
    }
    
    fileprivate func createTextColorLabel() {
        textColorLabel.frame = CGRect(x: 20, y: 480, width: 372, height: 18)
        textColorLabel.text = "Change text color"
        textColorLabel.textAlignment = .center
        view.addSubview(textColorLabel)
    }
    
    fileprivate func createLineNumberPicker() {
        lineNumberPicker.frame = CGRect(x: 20, y: 600, width: 372, height: 100)
        lineNumberPicker.delegate = self
        lineNumberPicker.dataSource = self
        lineNumberPicker.tag = 1
        view.addSubview(lineNumberPicker)
    }
    
    fileprivate func createLineNumberLabel() {
        lineNumberLabel.frame = CGRect(x: 20, y: 600, width: 372, height: 18)
        lineNumberLabel.text = "Change number of lines"
        lineNumberLabel.textAlignment = .center
        view.addSubview(lineNumberLabel)
    }
    
    @objc func addButtonAction() {
        showAlert()
    }
    
    @objc func fontSizeSliderAction(sender: UISlider) {
        mainLabel.font = mainLabel.font.withSize(CGFloat(sender.value))
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Please, enter your string", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Your string"
        }
        let alertAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            if let string = alert.textFields?[0].text {
                self.mainLabel.text = string
            }
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension FirstViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numberOfRowsInComponent = 0
        if pickerView.tag == 0 {
            numberOfRowsInComponent = colorsArray.count
        } else {
            numberOfRowsInComponent = numberOfLinesArray.count
        }
        return numberOfRowsInComponent
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var titleForRow = ""
        if pickerView.tag == 0 {
            titleForRow = colorsArray[row]
        } else {
            titleForRow = String(numberOfLinesArray[row])
        }
        return titleForRow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            let color = Color.init(rawValue: colorsArray[row])
            mainLabel.textColor = color?.create
            textColorPicker.reloadAllComponents()
        } else {
            mainLabel.numberOfLines = numberOfLinesArray[row]
        }
    }
    
    
    
}

