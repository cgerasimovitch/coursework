//
//  HabitTableViewCell.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    static let cellId = "HabitTableViewCell"
    let habitsStore = HabitsStore.shared
    let tableHeader = HabitsViewHeaderView()
    //MARK: - Subviews list
    var habitcellTitle = UILabel()
    var cellSubtitle = UILabel()
    var cellCounterTitle = UILabel()
    let checkMarkView = UIView()
    let checkMarkMarkLabel = UILabel()
   
    var habitTableViewCellIndex = 0 as Int
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addEverySubview()
        setupEverySubview()
        habitTableViewCellIndex = 0
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func addEverySubview(){
        self.contentView.addSubview(habitcellTitle)
        self.contentView.addSubview(cellSubtitle)
        self.contentView.addSubview(cellCounterTitle)
        self.contentView.addSubview(checkMarkView)
        checkMarkView.addSubview(checkMarkMarkLabel)
    }
    
    func setupEverySubview(){
        titleSetup(labelHere: habitcellTitle)
        titleSetupLayout(labelHere: habitcellTitle)
        subtitleSetup(labelHere: cellSubtitle)
        subtitleSetupLayout(labelHere: cellSubtitle)
        counterTitleSetup(labelHere: cellCounterTitle)
        counterTitleSetupLayout(labelHere: cellCounterTitle)
        checkmarkSetup(viewHere: checkMarkView)
        checkmarkSetupLayout(viewHere: checkMarkView)
        checkmarkMarkSetup(labelhere: checkMarkMarkLabel)
        checkmarkMarkSetupLayout(labelHere: checkMarkMarkLabel)
    }
    
   
    
    // MARK: - Setup every subview
    func titleSetup(labelHere: UILabel){
        labelHere.text = ""
        labelHere.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
    }
    func titleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 220),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            labelHere.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func subtitleSetup(labelHere: UILabel){
        labelHere.text = ""
        labelHere.textColor = .systemGray2
        labelHere.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
    }
    func subtitleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 220),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: habitcellTitle.bottomAnchor, constant: 4),
            labelHere.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func counterTitleSetup(labelHere: UILabel){
        labelHere.text = ""
        labelHere.textColor = .systemGray
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
    }
    
    func counterTitleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 188),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: cellSubtitle.bottomAnchor, constant: 30),
            labelHere.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            labelHere.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func checkmarkSetup(viewHere: UIView){
        viewHere.backgroundColor = .white
        viewHere.layer.borderColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00).cgColor
        viewHere.layer.borderWidth = 2
        viewHere.layer.cornerRadius = 19
        viewHere.isUserInteractionEnabled = true
        //Add gesture
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(checkmarkAction))
        gesture.numberOfTapsRequired = 1
        viewHere.addGestureRecognizer(gesture)
    }
    
    @objc func checkmarkAction(){
        if habitsStore.habits[habitTableViewCellIndex].isAlreadyTakenToday == false{
            
        checkMarkView.backgroundColor = UIColor(cgColor: checkMarkView.layer.borderColor!)
        checkMarkMarkLabel.text = "✓"
        habitsStore.track(habitsStore.habits[habitTableViewCellIndex])
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        
        else {return}
        
    }
    
    func checkmarkSetupLayout(viewHere: UIView){
        viewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewHere.widthAnchor.constraint(equalToConstant: 38),
            viewHere.heightAnchor.constraint(equalToConstant: 38),
            viewHere.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            viewHere.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25)
        ])
    }
    
    func checkmarkMarkSetup(labelhere: UILabel){
        labelhere.text = "✓"
        labelhere.textColor = .white
        labelhere.textAlignment = .center
        
    }
    
    func checkmarkMarkSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 33),
            labelHere.heightAnchor.constraint(equalToConstant: 33),
            labelHere.centerXAnchor.constraint(equalTo: checkMarkView.centerXAnchor),
            labelHere.centerYAnchor.constraint(equalTo: checkMarkView.centerYAnchor)
            
        ])
    }
    
    

}
