//
//  ViewController.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 25/02/2025.
//

import UIKit
import Combine
//import SnapKit

enum ListAction : String {
    case refresh
}


class ViewController: UIViewController {

    
    
    
    private let vm = ListViewModel(networkService:NetworkManager())
    
    
    private var cancellable = Set<AnyCancellable>()
        
    var action : ListAction = .refresh
    
    
    private var _dataSource = [ListElementIdealista]()
    
    
    private var _tableView = {
        let some = UITableView(frame:CGRect.zero, style: .plain)
        some.separatorStyle = .none
        //some.dataSource = (self as UITableViewDataSource)
        //some.delegate = (self as UITableViewDelegate)
        return some
    }()
    
    
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
        view.addSubview(_tableView)
        _tableView.delegate = self
        _tableView.dataSource = self
        
        
        //update the layouts
        addLayout()
        
        //bind the publishers
        bind()
        
        //observe the publisers for any change
        observe()
    }

    private func addLayout(){
        
        view.backgroundColor = UIColor(named:"ListBackgroundColor")
        
        _myLbl.translatesAutoresizingMaskIntoConstraints = false
        _myLbl.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        _myLbl.centerYAnchor.constraint(equalTo:view.centerYAnchor).isActive = true
        
        _btnSubmit.translatesAutoresizingMaskIntoConstraints = false
        _btnSubmit.topAnchor.constraint(equalTo:_myLbl.bottomAnchor, constant:20).isActive = true
        _btnSubmit.centerXAnchor.constraint(equalTo:_myLbl.centerXAnchor, constant:0.0).isActive = true
        _btnSubmit.heightAnchor.constraint(equalToConstant:30.0).isActive = true
        
        
        _tableView.translatesAutoresizingMaskIntoConstraints = false
        _tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        _tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        _tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        _tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        ListCell.prepare(tableView:_tableView)
//        _tableView.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
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
        } receiveValue: {elements in
            print("Count == \(elements.count)")
            self._dataSource.removeAll()
            self._dataSource.append(contentsOf: elements)
            self._tableView.reloadData()
        }
        
        .store(in: &cancellable)
        
        
        
        //let send the refresh signal to ViewModel
        vm.refreshSubject.send(.refresh)
    }
    
    private func observe(){
        
    }
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.cellIdentifier) as? ListCell else{
            return UITableViewCell()
        }
        cell.product = _dataSource[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated: true)
    }
}
