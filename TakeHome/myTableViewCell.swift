//
//  myTableViewCell.swift
//  TakeHome
//
//  Created by Nick on 9/30/17.
//  Copyright © 2017 ZipRealty. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    var customImageView: UIImageView!
    var customLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        //add UIImageView
        customImageView = UIImageView()
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.backgroundColor = UIColor.red
        self.addSubview(customImageView)
        
        //add UILabel
        customLabel = UILabel()
        customLabel.numberOfLines = 1
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customLabel)
        
        //**** constraint to UIImageView ****
        //setup space with imageview and label
        let horizontalCons = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[myView]-10-[myLabel]-10-|", options: .alignAllCenterY, metrics: nil, views: ["myLabel":customLabel, "myView":customImageView])
        self.addConstraints(horizontalCons)
        
        //top to superview's margin is 10
        let constraintTop = NSLayoutConstraint(item: customImageView, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: 10)
        //aspect ratio with 1:1
        let constraintAspectRadio = customImageView.heightAnchor.constraint(equalTo: customImageView.widthAnchor, multiplier: 1.0)
        //setup centerY with cell
        let constraintY = NSLayoutConstraint(item: customImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraints([constraintTop, constraintAspectRadio, constraintY])
        
        
        //**** constraint to UILabel ****
        //setup centerY with cell
        //let labelConstraintCenterY = NSLayoutConstraint(item: customLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        //setup uilabel's height is equal 21
        //let labelConstraintHeight = NSLayoutConstraint(item: customLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 21)
        //self.addConstraints([labelConstraintCenterY])
        
        //Update use layout Anchor
        customLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        customLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
