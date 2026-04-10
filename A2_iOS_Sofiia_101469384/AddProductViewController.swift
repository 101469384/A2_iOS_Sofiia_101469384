//
//  AddProductViewController.swift
//  A2_iOS_Sofiia_101469384
//
//  Created by Sofiia Beliak  on 2026-04-08.
//
import UIKit
import CoreData

class AddProductViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var providerTextField: UITextField!
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard
            let id = idTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !id.isEmpty,
            let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty,
            let desc = descriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !desc.isEmpty,
            let provider = providerTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !provider.isEmpty,
            let priceText = priceTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !priceText.isEmpty,
            let price = Double(priceText)
        else {
            let alert = UIAlertController(title: "Error",
                                          message: "Please fill all fields correctly.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

        let product = Product(context: context)
        product.productID = id
        product.productName = name
        product.productDescription = desc
        product.productPrice = price
        product.productProvider = provider

        do {
            try context.save()
            if let nav = navigationController {
                nav.popViewController(animated: true)
            } else {
                dismiss(animated: true)
            }
        } catch {
            let alert = UIAlertController(title: "Save Error",
                                          message: "Could not save product.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            print("Error saving product: \(error)")
        }
    }
}
