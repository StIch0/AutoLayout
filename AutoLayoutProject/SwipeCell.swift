//
//  SwipeCell.swift
//  AutoLayoutProject
//
//  Created by Pavel Burdukovskii on 05/03/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class SwipeCell: UICollectionViewCell {
    
    var page : PageModel? {
    didSet {
        guard let unrappedPage = page else {
            return
        }
        setUpLayuot()

        catImageView.image = UIImage(named: unrappedPage.imageName)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.contentMode = .scaleAspectFit
        let attributrString = NSMutableAttributedString(string: unrappedPage.discriptionText, attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18)])
        descriptionTextView.attributedText = attributrString
        descriptionTextView.textAlignment = .center
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        }
    }
    
    private let catImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
   private let descriptionTextView : UITextView = {
        let textView  = UITextView()
    
    
        return textView
    }()
    let topContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    func setUpLayuot() -> Void {
        
        //containerView
        addSubview(topContainerView)
        topContainerView.heightAnchor.constraint(equalTo:heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContainerView.addSubview(catImageView)
        
        //imageView
        
        catImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        catImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        catImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.75).isActive = true
        
        addSubview(descriptionTextView)
        //textView
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
