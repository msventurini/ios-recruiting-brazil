//
//  MovieCell.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 10/10/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    let image = UIImageView(frame: .zero)
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set() {
        image.image = (UIImage(named: "DBSSHPoster"))
    }
    

    private func configure() {
        
        //let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.image = moviePosterPlaceHolder
        
        addSubview(image)
        
        let padding: CGFloat = 8
        
        layer.cornerRadius = 10
        clipsToBounds = true
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            image.heightAnchor.constraint(equalTo: self.widthAnchor)
            
            
        ])
        
    }
    
    
}
