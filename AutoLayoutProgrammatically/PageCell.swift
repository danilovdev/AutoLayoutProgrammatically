//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Alexey Danilov on 21/10/2017.
//  Copyright © 2017 DanilovDev. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else {
                return
            }
            self.imageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText,
                                                           attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
                                                                                                                                                                                                     NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            self.descriptionTextView.attributedText = attributedText
            self.descriptionTextView.textAlignment = .center
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "earth_img"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",
                                                       attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\nLoad Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load Load ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
                                                                                                                                                                                                 NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayot()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayot() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(self.imageView)
        self.imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
         addSubview(self.descriptionTextView)
        self.descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        self.descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        self.descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        self.descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
