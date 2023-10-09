//
//  DetailViewController.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    private let detailId: String
    var viewModel: DetailViewModel
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .systemBackground
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.fetchDetailedAdvertisment(id: detailId)
        bindViewModel()
    }
    
    // MARK: - Init
    
    init(detailId: String) {
        self.viewModel = DetailViewModel()
        self.detailId = detailId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Funcs
    
    private func bindViewModel() {
        viewModel.detailData.bind { [weak self] detailData in
            DispatchQueue.main.async {
                self?.configureDetailData()
            }
        }
    }
    
    private func configureDetailData() {
        let detail = viewModel.detailData.value
        
        detailView.titleLabel.text = detail.title
        detailView.priceLabel.text = detail.price
        detailView.locationLabel.text = detail.location
        detailView.createdDateLabel.text = detail.createdDate
        detailView.descriptionLabel.text = detail.description
        detailView.emailLabel.text = detail.email
        detailView.phoneNumberLabel.text = detail.phoneNumber
        detailView.addressLabel.text = detail.address
        
        let url = URL(string: detail.imageURL)
        detailView.imageView.kf.setImage(with: url)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}

