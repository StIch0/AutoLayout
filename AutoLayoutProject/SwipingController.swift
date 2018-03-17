//
//  SwipingController.swift
//  AutoLayoutProject
//
//  Created by Pavel Burdukovskii on 05/03/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let cellId : String = "swipeCell"
    let pages = [PageModel(imageName: "Ba_Dum_Tss_Cat", discriptionText: "Ba_Dum_Tss_Cat"),
                PageModel(imageName: "55f1e6e6b5bc4", discriptionText: "55f1e6e6b5bc4"),
                PageModel(imageName: "K_bwwlls43Q", discriptionText: "K_bwwlls43Q"),
                PageModel(imageName: "kanye_profile", discriptionText: "kanye_profile")]
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    private lazy var pageControl : UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 4//pages.count
        page.currentPageIndicatorTintColor = .red
        page.pageIndicatorTintColor = .gray
        return page
    }()

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
    @objc private func handleNext(){
        let nextItem = min(pageControl.currentPage + 1,pages.count-1)
        let indexPath = IndexPath(item: nextItem, section: 0)
        pageControl.currentPage = nextItem
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("Next")
    }
    @objc private func handlePrev(){
        let nextItem = max(pageControl.currentPage - 1,0)
        let indexPath = IndexPath(item: nextItem, section: 0)
        pageControl.currentPage = nextItem
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("Prev")

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionViewLayout.invalidateLayout()

            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            else {
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBottomControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(SwipeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell : SwipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SwipeCell
        let page = pages[indexPath.row]
        cell.page = page
           return cell
    }
    
}
 
