//
//  ViewController.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 25/02/2025.
//

import UIKit

class ViewController: UIViewController {

    
    private var _myLbl:UILabel = {
        
        let some = UILabel()
        some.text = "Status"
        some.textColor = .red
        some.backgroundColor = .green
        
        return some
    }()
    
    
    private var _btnSubmit : UIButton = {
        let some = UIButton(type: .custom)
        some.setTitle("Submit".uppercased(), for: .normal)
        some.setTitleColor(.white, for: .normal)
        some.backgroundColor = .gray
        return some
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //add sub views
        view.addSubview(_myLbl)
        view.addSubview(_btnSubmit)
        
        
        
        //update the layouts
        addLayout()
    }

    private func addLayout(){
        
        view.backgroundColor = .white
        
        _myLbl.translatesAutoresizingMaskIntoConstraints = false
        _myLbl.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        _myLbl.centerYAnchor.constraint(equalTo:view.centerYAnchor).isActive = true
        
        _btnSubmit.translatesAutoresizingMaskIntoConstraints = false
        _btnSubmit.topAnchor.constraint(equalTo:_myLbl.bottomAnchor, constant:20).isActive = true
        _btnSubmit.centerXAnchor.constraint(equalTo:_myLbl.centerXAnchor, constant:0.0).isActive = true
        _btnSubmit.heightAnchor.constraint(equalToConstant:30.0).isActive = true
    }

}

