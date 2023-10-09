//
//  MainCollectionViewCell.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static var id: String {"\(Self.self)"}
    
    private let fiveConstraint: CGFloat = 5
    private let tenConstraint: CGFloat = 10
    private let minusTenConstraint: CGFloat = -10
    private let imageViewHeight: CGFloat = 150
    

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSixteen
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemForteen
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemForteen
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemTwelve
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI setup
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(dateLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageViewHeight),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: tenConstraint),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: tenConstraint),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: minusTenConstraint),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: fiveConstraint),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: tenConstraint),
            
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: fiveConstraint),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: tenConstraint),
            
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: fiveConstraint),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: tenConstraint),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: minusTenConstraint)
        ])
    }
    
    // MARK: - Cell config
    func configure(with item: Advertisement) {
        titleLabel.text = item.title
        priceLabel.text = item.price
        locationLabel.text = item.location
        dateLabel.text = item.createdAt
    }
}
