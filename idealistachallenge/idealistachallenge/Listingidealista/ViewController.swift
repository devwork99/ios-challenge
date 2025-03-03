//
//  ViewController.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 25/02/2025.
//

import UIKit
import Combine

enum ListAction : String {
    case refresh
}


class ViewController: UIViewController {

    
    
    
    private let vm = ListViewModel(networkService:NetworkManager())
    
    
    private var cancellable = Set<AnyCancellable>()
        
    var action : ListAction = .refresh
    
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
        
        //bind the publishers
        bind()
        
        //observe the publisers for any change
        observe()
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

    
    //MARK: - Combine Methods
    
    private func bind(){
        
        //receive output from ViewModel
        vm.output.sink { completion in
            switch completion {
            case .failure(let error):
                print("Error == \(error.localizedDescription)")
            case .finished:
                print("Finished -> List Fetch")
            }
        } receiveValue: { elements in
            print("Count == \(elements)")
        }
        
        .store(in: &cancellable)
        
        
        
        //let send the refresh signal to ViewModel
        vm.refreshSubject.send(.refresh)
    }
    
    private func observe(){
        
    }
    
}

