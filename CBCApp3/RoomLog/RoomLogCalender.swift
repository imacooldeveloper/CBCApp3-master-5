//
//  RoomLogCalender.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/18/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomLogCalender: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    
    
    
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        monthLayout()
        view.backgroundColor = .white
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = .red
        myCollectionView.register(CalenderCell.self, forCellWithReuseIdentifier: "cell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    let lastMonth: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Prev", for: .normal)
        but.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .normal)
        return but
    }()
    let nextMonth: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Next", for: .normal)
        but.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .normal)
        return but
    }()
    let monthName: UILabel = {
        let month = UILabel()
        month.text = "October"
        month.textColor = .black
       month.font = UIFont.boldSystemFont(ofSize: 20)
        month.textAlignment = .center
        return month
    }()
    
    let monday: UILabel = {
        let month = UILabel()
        month.text = "Monday"
        month.textColor = .black
        
        month.textAlignment = .center
        return month
    }()
    let tuesday: UILabel = {
        let month = UILabel()
        month.text = "Tuesday"
        month.textColor = .black
        
        month.textAlignment = .center
        return month
    }()
    let wendsday: UILabel = {
        let month = UILabel()
        month.text = "Wendsday"
        month.textColor = .black
        
        month.textAlignment = .center
        return month
    }()
    let thursday: UILabel = {
        let month = UILabel()
        month.text = "Thursday"
        month.textColor = .black
        month.textAlignment = .center
        
        return month
    }()
    let friday: UILabel = {
        let month = UILabel()
        month.text = "Friday"
        month.textColor = .black
        
        month.textAlignment = .center
        return month
    }()
    let saturday: UILabel = {
        let month = UILabel()
        month.text = "Saturday"
        month.textColor = .black
        
        month.textAlignment = .center
        return month
    }()
    let sunday: UILabel = {
        let month = UILabel()
        month.text = "Sunday"
        month.textColor = .black
        month.textAlignment = .center
        
        return month
    }()
    var days = [
    "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"
    ]
    

    func monthLayout() {
        let monthStack = UIStackView(arrangedSubviews: [lastMonth,monthName,nextMonth])
        view.addSubview(monthStack)
        monthStack.distribution = .fillEqually
        monthStack.anchor(top: view.topAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, topPadding: 100, bottomPadding: 0, leftPadding: 100, rightPadding: 100, width: 0, height: 0)
        monthName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let dayOfWeekStack = UIStackView(arrangedSubviews: [sunday,monday,tuesday,wendsday,thursday,friday,saturday])
        view.addSubview(dayOfWeekStack)
        dayOfWeekStack.distribution = .fillEqually
        dayOfWeekStack.spacing = 10
        dayOfWeekStack.anchor(top: monthName.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, topPadding: 40, bottomPadding: 0, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
        view.addSubview(myCollectionView)
        myCollectionView.anchor(top: dayOfWeekStack.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)

    }
    
    
   
    
    
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let myCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor = .red
        myCollectionView.allowsMultipleSelection=false
        

        return myCollectionView
    }()
   
    
    
//    func initializeView() {
//        currentMonthIndex = Calendar.current.component(.month, from: Date())
//        currentYear = Calendar.current.component(.year, from: Date())
//        todaysDate = Calendar.current.component(.day, from: Date())
////        firstWeekDayOfMonth=getFirstWeekDay()
//
//        //for leap years, make february month of 29 days
//        if currentMonthIndex == 2 && currentYear % 4 == 0 {
//            numOfDaysInMonth[currentMonthIndex-1] = 29
//        }
//        //end
//
//        presentMonthIndex=currentMonthIndex
//        presentYear=currentYear
//
////        setupViews()
//
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
//        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//
//        cell.backgroundColor = .red
       let theCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CalenderCell
        theCell?.backgroundColor = .red
        return theCell!
    }
    

    
}


class CalenderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
