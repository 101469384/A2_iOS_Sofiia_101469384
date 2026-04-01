//
//  ViewController.swift
//  TodoApp
//
//  Created by Sofiia Beliak on 2026-04-01.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To-Do App"
    }

    @IBAction func addTask(_ sender: Any) {
        guard let taskText = textField.text, !taskText.isEmpty else { return }

        let newTask = Task(context: context)
        newTask.title = taskText

        do {
            try context.save()
            textField.text = ""
            performSegue(withIdentifier: "goToList", sender: nil)
        } catch {
            print("Error saving task")
        }
    }
}
