//
//  ListCell.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 03/03/2025.
//

import Foundation
import UIKit


class ListCell: UITableViewCell {
    
            
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var cellIdentifier :  String {
        return "\(String(describing:ListCell.self)).cellIdentifier"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        addLayout()
    }
    
    
    static func prepare(tableView:UITableView) -> Void {
        tableView.register(ListCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    
    var product : ListElementIdealista? {
        didSet{
            _lblTitle.text = product?.description
            _lblCityName.text = product?.municipality
            _lblCounter.text =  "1/\(product?.multimedia.images.count ?? 0)"
            //let counter =  "1/\(product?.multimedia.images.count ?? 0)"
            //_lblCounter.setTitle(counter, for: .normal)
            _lblCityName.text = product?.district ?? ""
            _lblAmountPerMonth.text = "\(product?.price ?? 0)"  + " €/month"
            //_lblGarrageIncluded.alpha = (product?.parkingSpace?.hasParkingSpace)? 1 : 0
            if product?.parkingSpace?.hasParkingSpace ?? false {
                _lblGarrageIncluded.alpha = 1
            }
            _lbl4Beds.text = "\(product?.rooms ?? 0)" + " bed"
            _lblAreaSquareMeter.text = "\(product?.size ?? 0)" + " total m2"
            //_lblPostDate.text = product.date
            
            
        }
    }
    
    
    static private let _tintColor = UIColor(red:288/256, green:148/256, blue:122/256, alpha: 1.0)
    
    private let _contentView : UIView = {
        let some = UIView(frame:.zero)
        some.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        some.layer.borderColor = UIColor.white.cgColor
        some.layer.borderWidth = 0.3
        return some
    }()
    
    
    private let _imgHeader : UIImageView = {
        let some = UIImageView()
        some.backgroundColor = .clear
        some.image = UIImage(systemName:"photo")
        some.contentMode = .scaleAspectFill
        //some.addCornorRadius(radius: 8.0)
        return some
    }()
    
    private let _btnGallery : UIButton = {
        let some = UIButton(type: .custom)
        some.setImage(UIImage(systemName:"photo.stack"), for: .normal)
        some.layer.borderWidth = 0.6
        some.layer.borderColor = UIColor.white.cgColor
        some.layer.cornerRadius = 5
        return some
    }()
    
    private let _btnMap : UIButton = {
        let some = UIButton(type: .custom)
        some.setImage(UIImage(systemName:"mappin.circle"), for: .normal)
        some.layer.borderWidth = 0.6
        some.layer.borderColor = UIColor.white.cgColor
        some.layer.cornerRadius = 5
        return some
    }()
    
    
    private let _lblCounter : UILabel = {
        let some = UILabel()
        some.text = "1/25"
        some.textColor = .white
        some.font = UIFont.systemFont(ofSize:12)
        some.textAlignment = .center
        //some.backgroundColor = .lightGray
        some.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        some.layer.cornerRadius = 5
        return some
    }()
    
    
    /*
    private let _lblCounter : UIButton = {
        let some = UIButton(type:.custom)
        some.setTitle("1/25", for: .normal)
        some.setTitleColor(.white, for: .normal)
        some.titleEdgeInsets = UIEdgeInsets(top:10, left:20, bottom:10, right:20)
        some.isUserInteractionEnabled = false
        some.titleLabel?.font = UIFont.systemFont(ofSize:12)
        some.contentVerticalAlignment = .top
        some.contentHorizontalAlignment = .left
        some.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        some.layer.cornerRadius = 5
        return some
    }()
    */
    
    
    private let _lblTitle : UILabel = {
        let some = UILabel()
        some.text = "Some title long text goes in here, Some title long text goes in here, "
        some.numberOfLines = 2
        some.font = UIFont.boldSystemFont(ofSize:16)
        some.textColor = .white
        return some
    }()
    
    private let _lblCityName : UILabel = {
        let some = UILabel()
        some.text = "Vila Real"
        some.font = UIFont.systemFont(ofSize:14)
        some.textColor = .white
        return some
    }()
    
    private let _lblAmountPerMonth : UILabel = {
        let some = UILabel()
        some.text = "1100 $/month"
        some.textColor = .white
        return some
    }()
    
    private let _lblGarrageIncluded : UILabel = {
        let some = UILabel()
        some.text = "Garage included"
        some.font = UIFont.systemFont(ofSize:12)
        some.alpha = 0.0
        some.textColor = .white
        return some
    }()
    
    
    private let _lbl4Beds : UILabel = {
        let some = UILabel()
        some.text = "4 beds"
        some.textAlignment = .left
        some.textColor = .white
        some.font = UIFont.systemFont(ofSize:12)
        return some
    }()
    
    private let _lblAreaSquareMeter : UILabel = {
        let some = UILabel()
        some.text = "220 total m2"
        some.textAlignment = .left
        some.textColor = .white
        some.font = UIFont.systemFont(ofSize:12)
        return some
    }()
    
    
    private let _lblPostDate : UILabel = {
        let some = UILabel()
        some.text = "01 Mar"
        some.textAlignment = .right
        some.textColor = UIColor.brown.withAlphaComponent(0.5)
        some.font = UIFont.systemFont(ofSize:12)
        return some
    }()
    
    //last line
    
    private let _btnHeart : UIButton = {
        let some = UIButton(type: .custom)
        some.setBackgroundImage(UIImage(systemName:"heart"), for: .normal)
        some.tintColor = UIColor.yellow
        //288,148,122
        //some.tintColor = _tintColor
        return some
    }()
    
    private let _btnDelete : UIButton = {
        let some = UIButton(type: .custom)
        some.setBackgroundImage(UIImage(systemName:"arrow.up.bin"), for: .normal)
        some.tintColor = UIColor.yellow
        //some.tintColor = _tintColor
        return some
    }()
    
    
    private let _btnText : UIButton = {
        let some = UIButton(type: .custom)
        some.tintColor = UIColor.yellow
        
        some.setTitle("Contact", for: .normal)
        some.setImage(UIImage(systemName:"text.bubble.fill"), for: .normal)
        some.semanticContentAttribute = .forceRightToLeft
        return some
    }()
    
    private let _btnCall : UIButton = {
        let some = UIButton(type: .custom)
        some.tintColor = UIColor.yellow
        
        some.setTitle("Call", for:.normal)
        some.setImage(UIImage(systemName:"phone"), for: .normal)
        some.semanticContentAttribute = .forceRightToLeft
        return some
    }()
    
    
    private func addLayout(){
        
        
        addSubview(_contentView)
        
        
        _contentView.addSubview(_imgHeader)
        _contentView.addSubview(_btnGallery)
        _contentView.addSubview(_btnMap)
        _contentView.addSubview(_lblCounter)
        
        _contentView.addSubview(_lblTitle)
        _contentView.addSubview(_lblCityName)
        
        _contentView.addSubview(_lblAmountPerMonth)
        _contentView.addSubview(_lblGarrageIncluded)
        
        _contentView.addSubview(_lbl4Beds)
        _contentView.addSubview(_lblAreaSquareMeter)
        _contentView.addSubview(_lblPostDate)
        
        //last line
        
        _contentView.addSubview(_btnHeart)
        _contentView.addSubview(_btnDelete)
        
        
        _contentView.addSubview(_btnText)
        _contentView.addSubview(_btnCall)
        
        

        _contentView.translatesAutoresizingMaskIntoConstraints = false
        _contentView.leftAnchor.constraint(equalTo:self.leftAnchor, constant:5).isActive = true
        _contentView.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-5).isActive = true
        _contentView.topAnchor.constraint(equalTo:self.topAnchor, constant:0).isActive = true
        _contentView.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant:-20).isActive = true
        
        
        _imgHeader.translatesAutoresizingMaskIntoConstraints = false
        _imgHeader.leftAnchor.constraint(equalTo:_contentView.leftAnchor).isActive = true
        _imgHeader.rightAnchor.constraint(equalTo:_contentView.rightAnchor).isActive = true
        _imgHeader.topAnchor.constraint(equalTo:_contentView.topAnchor).isActive = true
        _imgHeader.heightAnchor.constraint(equalToConstant:UIScreen.main.bounds.size.height * 0.3).isActive = true
        
        _lblCounter.translatesAutoresizingMaskIntoConstraints = false
        _lblCounter.rightAnchor.constraint(equalTo: _contentView.rightAnchor, constant:-15).isActive = true
        _lblCounter.bottomAnchor.constraint(equalTo: _imgHeader.bottomAnchor, constant: -15).isActive = true
        
        
        _btnGallery.translatesAutoresizingMaskIntoConstraints = false
        _btnGallery.leftAnchor.constraint(equalTo:_contentView.leftAnchor, constant: 10).isActive = true
        _btnGallery.topAnchor.constraint(equalTo:_imgHeader.bottomAnchor,constant: 10.0).isActive = true
        _btnGallery.widthAnchor.constraint(equalToConstant:40.0).isActive = true
        _btnGallery.heightAnchor.constraint(equalToConstant:40.0).isActive = true
        
        
        _btnMap.translatesAutoresizingMaskIntoConstraints = false
        _btnMap.leftAnchor.constraint(equalTo:_btnGallery.rightAnchor, constant: 5).isActive = true
        _btnMap.centerYAnchor.constraint(equalTo:_btnGallery.centerYAnchor).isActive = true
        _btnMap.widthAnchor.constraint(equalTo:_btnGallery.widthAnchor).isActive = true
        _btnMap.heightAnchor.constraint(equalTo:_btnGallery.heightAnchor).isActive = true
        
        
        _lblTitle.translatesAutoresizingMaskIntoConstraints = false
        _lblTitle.leftAnchor.constraint(equalTo: _contentView.leftAnchor, constant:10).isActive = true
        _lblTitle.rightAnchor.constraint(equalTo: _contentView.rightAnchor, constant:-10).isActive = true
        _lblTitle.topAnchor.constraint(equalTo: _btnGallery.bottomAnchor,constant: 15).isActive = true
        
        _lblCityName.translatesAutoresizingMaskIntoConstraints = false
        _lblCityName.leftAnchor.constraint(equalTo: _lblTitle.leftAnchor).isActive = true
        _lblCityName.rightAnchor.constraint(equalTo: _lblTitle.rightAnchor).isActive = true
        _lblCityName.topAnchor.constraint(equalTo: _lblTitle.bottomAnchor,constant: 10).isActive = true
        
        _lblAmountPerMonth.translatesAutoresizingMaskIntoConstraints = false
        _lblAmountPerMonth.leftAnchor.constraint(equalTo:_btnGallery.leftAnchor).isActive = true
        _lblAmountPerMonth.topAnchor.constraint(equalTo:_lblCityName.bottomAnchor,constant:10).isActive = true
        _lblAmountPerMonth.heightAnchor.constraint(equalToConstant:22.0).isActive = true
        
        
        
        _lblGarrageIncluded.translatesAutoresizingMaskIntoConstraints = false
        _lblGarrageIncluded.leftAnchor.constraint(equalTo:_lblAmountPerMonth.rightAnchor,constant:10).isActive = true
        _lblGarrageIncluded.centerYAnchor.constraint(equalTo:_lblAmountPerMonth.centerYAnchor).isActive = true
        
        _lblGarrageIncluded.rightAnchor.constraint(equalTo:_contentView.rightAnchor).isActive = true
        
        
        _lbl4Beds.translatesAutoresizingMaskIntoConstraints = false
        _lbl4Beds.leftAnchor.constraint(equalTo:_btnGallery.leftAnchor).isActive = true
        _lbl4Beds.topAnchor.constraint(equalTo:_lblAmountPerMonth.bottomAnchor, constant:10).isActive = true
        _lbl4Beds.heightAnchor.constraint(equalToConstant:20.0).isActive = true
        
        
        _lblAreaSquareMeter.translatesAutoresizingMaskIntoConstraints = false
        _lblAreaSquareMeter.leftAnchor.constraint(equalTo:_lbl4Beds.rightAnchor, constant:10).isActive = true
        _lblAreaSquareMeter.centerYAnchor.constraint(equalTo:_lbl4Beds.centerYAnchor, constant:0).isActive = true
        _lblAreaSquareMeter.heightAnchor.constraint(equalTo:_lbl4Beds.heightAnchor).isActive = true
        _lblAreaSquareMeter.rightAnchor.constraint(equalTo:_contentView.rightAnchor).isActive = true
        
        
        _lblPostDate.translatesAutoresizingMaskIntoConstraints = false
        _lblPostDate.rightAnchor.constraint(equalTo:_contentView.rightAnchor, constant:-15).isActive = true
        _lblPostDate.centerYAnchor.constraint(equalTo:_lbl4Beds.centerYAnchor).isActive = true
        _lblPostDate.heightAnchor.constraint(equalTo:_lbl4Beds.heightAnchor).isActive = true
        
        //last line
        
        _btnHeart.translatesAutoresizingMaskIntoConstraints = false
        _btnHeart.rightAnchor.constraint(equalTo:_contentView.rightAnchor, constant: -10).isActive = true
        _btnHeart.topAnchor.constraint(equalTo:_lbl4Beds.bottomAnchor,constant: 35.0).isActive = true
        _btnHeart.widthAnchor.constraint(equalToConstant:20.0).isActive = true
        _btnHeart.heightAnchor.constraint(equalToConstant:20.0).isActive = true
        
        _btnDelete.translatesAutoresizingMaskIntoConstraints = false
        _btnDelete.rightAnchor.constraint(equalTo:_btnHeart.leftAnchor, constant: -10).isActive = true
        _btnDelete.centerYAnchor.constraint(equalTo:_btnHeart.centerYAnchor,constant:0.0).isActive = true
        _btnDelete.widthAnchor.constraint(equalTo:_btnHeart.widthAnchor).isActive = true
        _btnDelete.heightAnchor.constraint(equalTo:_btnHeart.heightAnchor).isActive = true
        
        
        _btnText.translatesAutoresizingMaskIntoConstraints = false
        _btnText.leftAnchor.constraint(equalTo:_btnGallery.leftAnchor,constant:0).isActive = true
        _btnText.centerYAnchor.constraint(equalTo:_btnHeart.centerYAnchor,constant:0).isActive = true
        _btnText.widthAnchor.constraint(equalToConstant:20.0).isActive = true
        _btnText.heightAnchor.constraint(equalToConstant:20.0).isActive = true
        
        _btnCall.translatesAutoresizingMaskIntoConstraints = false
        _btnCall.leftAnchor.constraint(equalTo:_btnText.rightAnchor, constant:15).isActive = true
        _btnCall.centerYAnchor.constraint(equalTo:_btnHeart.centerYAnchor, constant:0).isActive = true
        _btnCall.widthAnchor.constraint(equalToConstant:20.0).isActive = true
        _btnCall.heightAnchor.constraint(equalToConstant:20.0).isActive = true
        
    }
    
    
    
    
    
    
    
    
}
