//
//  ViewController.swift
//  UIKit_start
//
//  Created by Nikita Verkhoturov on 07.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: - IB outlets
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLable: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLable()
    
    }

// MARK: - IB actions
    
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLable.text = "The first segment is selected"
            mainLable.textColor = .red
        case 1:
            mainLable.text = "The second segment is selected"
            mainLable.textColor = .blue
        default:
            mainLable.text = "The third segment is selected"
            mainLable.textColor = .yellow
        }
    }
    
    @IBAction func sliderAction() {
        mainLable.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessadge: "Please, enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(withTitle: "Wrong format", andMessadge: "Please, enter your name")
            return
        }
        mainLable.text = textField.text;
    }
    
    
    @IBAction func datePickerAction() {
        mainLable.text = datePicker.date.formatted(date: .long, time: .omitted)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
//        datePicker.isHidden = !sender.isOn
//        switchLable.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    
// MARK: - Private Methods
    
    private func setupMainLable() {
        mainLable.text = slider.value.formatted()
        mainLable.font = UIFont.systemFont(ofSize: 35)
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
}

// MARK - UIAlertController

extension ViewController {
    private func showAlert(withTitle title: String, andMessadge messadge: String) {
        let alert = UIAlertController(title: title, message: messadge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

