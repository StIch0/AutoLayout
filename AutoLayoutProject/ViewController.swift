//
//  ViewController.swift
//  AutoLayoutProject
//
//  Created by Pavel Burdukovskii on 20/02/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let catImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Ba_Dum_Tss_Cat"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let descriptionTextView : UITextView = {
        let textView  = UITextView()
        let attributrString = NSMutableAttributedString(string: "qwerty u i o p a s df  ghj kl zx c v bn m ...werty u i o p a s df  ghj kl zx c v bn m ...werty u i o p a s df  ghj kl zx c v bмn m ...\n", attributes: [textView.text:UIFont.boldSystemFont(ofSize: 18)])
        attributrString.append(NSAttributedString(string: "nnnnvndnfjdnafndjafsajfbadfbsabfdasfhsafbdashfbdshjfbdhjsabfdnsafbads", attributes: [:]))
        textView.attributedText = attributrString
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let topContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    private let pageControl : UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 4
        page.currentPageIndicatorTintColor = .red
        page.pageIndicatorTintColor = .gray
        return page
    }()
      override func viewDidLoad() {
        super.viewDidLoad()
        
         view.addSubview(descriptionTextView)
        setUpBottomControls()
        setUpLayuot()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setUpBottomControls(){
        let bottomStackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomStackView)

        NSLayoutConstraint.activate([
                bottomStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
                bottomStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                bottomStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                bottomStackView.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    func setUpLayuot() -> Void {
        
        //containerView
        view.addSubview(topContainerView)
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.addSubview(catImageView)
        
        //imageView

        catImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        catImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        catImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.75).isActive = true
        
        //textView
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }

}

