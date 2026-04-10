//
//  ProductListViewController.swift
//  A2_iOS_Sofiia_101469384
//
//  Created by Sofiia Beliak on 2026-04-08.
//

import UIKit
import CoreData

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchProducts()
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProducts()
    }

    func fetchProducts() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            products = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Error fetching products: \(error)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProductCell")
        let product = products[indexPath.row]
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = product.productDescription
        return cell
    }
}
