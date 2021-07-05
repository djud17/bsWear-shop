//
//  ProductCardViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 04.07.2021.
//

import UIKit

class ProductCardViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var swipeView: UIView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var sizeSegmentControl: UISegmentedControl!
    
    var product: Product?
    var productImages: [ProductImage] = []
    let currency = " \u{20BD}"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedProduct = product {
            productImages = selectedProduct.productImages
            var adress = ""
            if productImages.isEmpty {
                adress = selectedProduct.mainImage
            } else {
                adress = productImages[0].imageURL
            }
            let url = URL(string: "http://blackstarshop.ru/\(adress)")!
            
            productImage.load(url)
            productNameLabel.text = selectedProduct.name
            productPriceLabel.text = "\(beautyPrice(selectedProduct.price,currency))"
            descriptionLabel.text = selectedProduct.description
            
            sizeSegmentControl.removeAllSegments()
            for (index,el) in selectedProduct.offers.enumerated() {
                sizeSegmentControl.insertSegment(withTitle: el.size, at: index, animated: true)
            }
        }
        addGestureRecogniser()
        pageControl.numberOfPages = productImages.count
        
    }

    @IBAction func swipeImage(_ sender: Any) {
        changeImage()
    }
    
    func addGestureRecogniser() {
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.direction = .left
        swipeLeft.addTarget(self, action: #selector(swipeGestureImage(sender: )))
        
        let swipeRight = UISwipeGestureRecognizer()
        swipeRight.direction = .right
        swipeRight.addTarget(self, action: #selector(swipeGestureImage(sender: )))
        
        for swipe in [swipeLeft,swipeRight] {
            swipeView.addGestureRecognizer(swipe)
        }
    }
    
    @objc func swipeGestureImage(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            pageControl.currentPage -= 1
            changeImage()
        case .left:
            pageControl.currentPage += 1
            changeImage()
        default:
            changeImage()
        }
    }
    
    func changeImage() {
        let index = pageControl.currentPage
        let url = URL(string: "http://blackstarshop.ru/\(productImages[index].imageURL)")!
        productImage.load(url)
    }
    
    
    @IBAction func buyProduct(_ sender: Any) {
        if let prod = product {
            let index = sizeSegmentControl.selectedSegmentIndex
            if index >= 0 {
                var selectedProduct = SelectedProduct()
                selectedProduct.productImage = prod.mainImage
                selectedProduct.productName = prod.name
                selectedProduct.productPrice = prod.price
                selectedProduct.productSize = prod.offers[index].size
                
                Persistance.shared.realmWrite(selectedProduct)
            }
        }
    }
}
