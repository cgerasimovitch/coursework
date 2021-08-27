//
//  CreationViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitViewController: UIViewController {

    let itemNameHeader = UILabel()
    let itemNameTextField = UITextField()
    let itemColorHeader = UILabel()
    let itemColorView = UIView()
    let itemTimeHeader = UILabel()
    let itemCurrentTimeLabel = UILabel()
    let itemDatePicker = UIDatePicker()
    var chosenDate = Date()
    var screenNameContainer = ""
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewDidLoad()
        title = screenNameContainer
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveItem))
    }
    
    override func viewWillLayoutSubviews() {
        addEverySubview()
        setupEverySubview()
    }
    
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveItem(){
        if let name = itemNameTextField.text{
        let newHabit = Habit(name: itemNameTextField.text!,
                             date: chosenDate,
                             color: itemColorView.backgroundColor!)
        let store = HabitsStore.shared
            store.habits.append(newHabit)}
        else {return}
    }
    func addEverySubview() {
        self.view.addSubview(itemNameHeader)
        self.view.addSubview(itemNameTextField)
        self.view.addSubview(itemColorHeader)
        self.view.addSubview(itemColorView)
        self.view.addSubview(itemTimeHeader)
        self.view.addSubview(itemCurrentTimeLabel)
        self.view.addSubview(itemDatePicker)
    }
    
    func setupEverySubview() {
        itemNameHeaderSetup(labelHere: itemNameHeader)
        itemNameHeaderSetupLayout(labelHere: itemNameHeader)
        itemNameTextFieldSetup(textFieldHere: itemNameTextField)
        itemNameTextFieldSetupLayout(textFieldHere: itemNameTextField)
        itemColorHeaderSetup(labelHere: itemColorHeader)
        itemColorHeaderSetupLayout(labelHere: itemColorHeader)
        itemColorViewSetup(viewHere: itemColorView)
        itemColorViewSetupLayout(viewHere: itemColorView)
        itemTimeHeaderSetup(labelHere: itemTimeHeader)
        itemTimeHeaderSetupLayout(labelHere: itemTimeHeader)
        itemCurrentTimeLabelSetup(labelHere: itemCurrentTimeLabel)
        itemCurrentTimeLabelSetupLayout(labelHere: itemCurrentTimeLabel)
        itemDatePickerSetup(datePickerHere: itemDatePicker)
        itemDatePickerSetupLayout(datePickerHere: itemDatePicker)
    }
    // MARK: - Setup every subview
    func itemNameHeaderSetup(labelHere: UILabel){
        labelHere.text = "НАЗВАНИЕ"
    }
    
    func itemNameHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 100),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemNameTextFieldSetup(textFieldHere: UITextField){
        textFieldHere.placeholder = "Бегать по утрам, спать 8 часов и т.п."
    }
    
    func itemNameTextFieldSetupLayout(textFieldHere: UITextField){
        textFieldHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldHere.widthAnchor.constraint(equalToConstant: 295),
            textFieldHere.heightAnchor.constraint(equalToConstant: 22),
            textFieldHere.topAnchor.constraint(equalTo: itemNameHeader.bottomAnchor, constant: 7),
            textFieldHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
    }
    
    func itemColorHeaderSetup(labelHere: UILabel){
        labelHere.text = "ЦВЕТ"
    }
    
    func itemColorHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemColorViewSetup(viewHere: UIView){
        viewHere.backgroundColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00)
        viewHere.layer.cornerRadius = 15
        viewHere.isUserInteractionEnabled = true
        //Add gesture
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(itemColorViewAction))
        gesture.numberOfTapsRequired = 1
        viewHere.addGestureRecognizer(gesture)
    }
    
    @objc func itemColorViewAction(){
        let colorPicker = HabitColorViewController()
       
        // Setting the Initial Color of the Picker
        colorPicker.selectedColor = itemColorView.backgroundColor!

        // Setting Delegate
        colorPicker.delegate = self

        // Presenting the Color Picker
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    
    func itemColorViewSetupLayout(viewHere: UIView){
        viewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewHere.widthAnchor.constraint(equalToConstant: 30),
            viewHere.heightAnchor.constraint(equalToConstant: 30),
            viewHere.topAnchor.constraint(equalTo: itemColorHeader.bottomAnchor, constant: 7),
            viewHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemTimeHeaderSetup(labelHere: UILabel){
        labelHere.text = "ВРЕМЯ"
    }
    func itemTimeHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemColorView.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemCurrentTimeLabelSetup(labelHere: UILabel){
        
    }
    func itemCurrentTimeLabelSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 194),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: itemTimeHeader.bottomAnchor, constant: 7),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    func itemDatePickerSetup(datePickerHere: UIDatePicker){
        datePickerHere.datePickerMode = .time
        datePickerHere.preferredDatePickerStyle = .wheels
        datePickerHere.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let stringDate = formatter.string(from: itemDatePicker.date)
        chosenDate = formatter.date(from: stringDate)!
        print(stringDate)
       
    }
    func itemDatePickerSetupLayout(datePickerHere: UIDatePicker){
        datePickerHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePickerHere.heightAnchor.constraint(equalToConstant: 216),
            datePickerHere.topAnchor.constraint(equalTo: itemCurrentTimeLabel.bottomAnchor, constant: 15),
            datePickerHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            datePickerHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    


}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.itemColorView.backgroundColor = viewController.selectedColor
        
    }
}

