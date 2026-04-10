//
//  ViewController.swift
//  A2_iOS_Sofiia_101469384
//
//  Created by Sofiia Beliak on 2026-04-08.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var productIDLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productProviderLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    var products: [Product] = []
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()

        if products.isEmpty {
            insertDefaultProducts()
            fetchProducts()
        }

        displayProduct()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProducts()
        if !products.isEmpty {
            if currentIndex >= products.count {
                currentIndex = products.count - 1
            }
            displayProduct()
        }
    }

    func fetchProducts() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            products = try context.fetch(request)
        } catch {
            print("Error fetching products: \(error)")
        }
    }

    func displayProduct() {
        guard !products.isEmpty else {
            productIDLabel.text = "ID: No Product"
            productNameLabel.text = "Name: "
            productDescriptionLabel.text = "Description: "
            productPriceLabel.text = "Price: "
            productProviderLabel.text = "Provider: "
            return
        }

        let product = products[currentIndex]
        productIDLabel.text = "ID: \(product.productID ?? "")"
        productNameLabel.text = "Name: \(product.productName ?? "")"
        productDescriptionLabel.text = "Description: \(product.productDescription ?? "")"
        productPriceLabel.text = "Price: $\(product.productPrice)"
        productProviderLabel.text = "Provider: \(product.productProvider ?? "")"
    }

    func insertDefaultProducts() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

        let sampleProducts = [
            ("P001", "iPhone 15", "Apple smartphone", 1299.99, "Apple"),
            ("P002", "MacBook Air", "Lightweight laptop", 1599.99, "Apple"),
            ("P003", "Galaxy S24", "Samsung smartphone", 1199.99, "Samsung"),
            ("P004", "iPad Air", "Tablet device", 899.99, "Apple"),
            ("P005", "Sony Headphones", "Noise cancelling headphones", 349.99, "Sony"),
            ("P006", "Apple Watch", "Smart watch", 599.99, "Apple"),
            ("P007", "Dell XPS 13", "Ultrabook laptop", 1499.99, "Dell"),
            ("P008", "Canon Camera", "Digital camera", 999.99, "Canon"),
            ("P009", "PlayStation 5", "Gaming console", 699.99, "Sony"),
            ("P010", "Nintendo Switch", "Portable game console", 399.99, "Nintendo")
        ]

        for item in sampleProducts {
            let product = Product(context: context)
            product.productID = item.0
            product.productName = item.1
            product.productDescription = item.2
            product.productPrice = item.3
            product.productProvider = item.4
        }

        do {
            try context.save()
        } catch {
            print("Error saving default products: \(error)")
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard !products.isEmpty else { return }
        currentIndex = (currentIndex + 1) % products.count
        displayProduct()
    }
  
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        guard !products.isEmpty else { return }
        currentIndex = (currentIndex - 1 + products.count) % products.count
        displayProduct()
    }
   
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        fetchProducts()

        guard let text = searchTextField.text, !text.isEmpty else { return }

        if let foundIndex = products.firstIndex(where: {
            ($0.productName?.lowercased().contains(text.lowercased()) ?? false) ||
            ($0.productDescription?.lowercased().contains(text.lowercased()) ?? false)
        }) {
            currentIndex = foundIndex
            displayProduct()
        } else {
            let alert = UIAlertController(title: "Not Found",
                                          message: "No matching product found.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
