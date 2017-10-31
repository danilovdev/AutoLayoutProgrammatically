//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Alexey Danilov on 21/10/2017.
//  Copyright © 2017 DanilovDev. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "earth_img", headerText: "First Header", bodyText: "Loading some information."),
        Page(imageName: "planet_img", headerText: "Second Header", bodyText: "Description of something interesting."),
        Page(imageName: "solar_system_img", headerText: "Third Header", bodyText: "There are a lot of things."),
        Page(imageName: "sun_img", headerText: "Fourth Header", bodyText: "iOS Developing is great!")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(self.pageControl.currentPage + 1, self.pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        self.pageControl.currentPage = nextIndex
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrev() {
        let nextIndex = max(self.pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        self.pageControl.currentPage = nextIndex
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    public lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = self.pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1.0)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBottomControls()
        
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(PageCell.self,
                                      forCellWithReuseIdentifier: "cellId")
        self.collectionView?.isPagingEnabled = true
    }
    
    fileprivate func setupBottomControls() {
        let bottomStackView = UIStackView(arrangedSubviews: [
            self.previousButton,
            self.pageControl,
            self.nextButton])
        self.view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            bottomStackView.heightAnchor.constraint(equalToConstant: 50),
            bottomStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
}
