//
//  RoomLogLogin.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/12/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomLogLoginController: UIViewController {
    let SignUpButton: UIButton = {
        let sign = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(string: "Dont Have an Account?  ", attributes: [NSAttributedStringKey.font :UIFont.boldSystemFont(ofSize: 12) , NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)])
        
        attributedString.append(NSMutableAttributedString(string: "Sign up", attributes: [NSAttributedStringKey.foregroundColor :#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14) ]))
        
        sign.setAttributedTitle(attributedString, for: .normal)
        sign.addTarget(self, action: #selector(handleGetAccount), for: .touchUpInside)
        return sign
    }()
    
    let logoView: UIView = {
        let logo = UIView()
        logo.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return logo
    }()
    
    let CbcLogo: UILabel = {
        let cbc = UILabel()
        cbc.text = "CBC"
        cbc.textColor = .white
        cbc.font = UIFont.boldSystemFont(ofSize: 100)
        return cbc
    }()
    
    let emailText: UITextField = {
        let mail = UITextField()
        mail.borderStyle = .roundedRect
        //        mail.placeholder = "Email"
        mail.attributedPlaceholder = NSAttributedString(string: "   Email", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30)])
        mail.font = UIFont.boldSystemFont(ofSize: 30)
        mail.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mail.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return mail
    }()
    
    let floorNum: UITextField = {
        let floor = UITextField()
        floor.borderStyle = .roundedRect
        //        mail.placeholder = "userName"
        floor.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        floor.attributedPlaceholder = NSAttributedString(string: "   Floor#", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30)])
        floor.font = UIFont.boldSystemFont(ofSize: 30)
        floor.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return floor
    }()
    
    
    let passwordText: UITextField = {
        let password = UITextField()
        password.borderStyle = .roundedRect
        //        mail.placeholder = "Password"
        password.attributedPlaceholder = NSAttributedString(string: "   Password", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30)])
        password.font = UIFont.boldSystemFont(ofSize: 30)
        password.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        password.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return password
    }()
    
    let loginBtn: UIButton = {
        let login = UIButton(type: .system)
        login.setTitle("Login", for: .normal)
        login.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        login.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        login.layer.cornerRadius = 20
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        login.isEnabled = false
        login.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return login
    }()
    
    //MARK: -HANDLE RU LOGIN
    @objc func handleLogin() {
        guard let email = emailText.text, email.count > 0 else { return }
        guard let password = passwordText.text, password.count > 0 else { return }

        // 👇🏻👇🏻Handle RU Login here👇🏻👇🏻
        
       
        let floorController = FloorController()
        let nav = CustomNavigation(rootViewController: floorController)
        present(nav, animated: true, completion: nil)
        
        
        
        
//        let flow = UICollectionViewFlowLayout()
//        let husbandryController = HusbandryFlagController(collectionViewLayout: flow)
//        let navicon = UINavigationController(rootViewController: husbandryController)
//        present(navicon, animated: true) {
//            // Send Info to husbandryController
//        }
        
    }
    
    
    @objc func handleInputChange() {
        let allInputValid = emailText.text?.count ?? 0 > 0 &&    passwordText.text?.count ?? 0 > 0
        
        if allInputValid {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }
    
    @objc func handleGetAccount() {
        print("hello")
        //        let husbandryLoginController = HusbandryLoginController()
        //        navigationController?.pushViewController(husbandryLoginController, animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        navigationController?.isToolbarHidden = true
        navigationItem.title = "Room Log"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        setipViews()
        
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func setipViews() {  
        let loginStack = UIStackView(arrangedSubviews: [emailText,passwordText,loginBtn])
        loginStack.distribution = .fillEqually
        loginStack.axis = .vertical
        loginStack.spacing = 20
        view.addSubview(loginStack)
        loginStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.safeAreaLayoutGuide.leadingAnchor, right: view.safeAreaLayoutGuide.trailingAnchor, topPadding: 60, bottomPadding: 0, leftPadding: 60, rightPadding: 60, width: 0, height: 0)
        
        emailText.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(SignUpButton)
        SignUpButton.anchor(top: nil, bottom: view.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 50)
    }
}
