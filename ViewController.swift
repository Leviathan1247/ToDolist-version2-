//
//  ViewController.swift
//  ToDoList (version2)
//
//  Created by Левиафан on 2024-05-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var todoElements: [Todo] = [Todo(name: " ", isCompleted: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func addTodoTap(_ sender: Any) {
        let alert = UIAlertController(title: "Создать задачу", message: " ", preferredStyle: .alert)
        alert.addTextField()
        let saveButton = UIAlertAction(title: "Сохранить", style: .default) {
            _ in
            if let textName = alert.textFields?.first?.text {
                self.todoElements.append(Todo(name: textName, isCompleted: false))
                self.tableView.reloadData()
            }
        }
        alert.addAction(saveButton)
        let cancelButton = UIAlertAction(title: "Удалить", style: .destructive)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        let todoCell = todoElements[indexPath.row]
        cell.delegate = self
        cell.updateCell(with: todoCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoElements.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func cellTapped(cell: TodoTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        let todo = todoElements[index.row]
        todo.isCompleted.toggle()
        tableView.reloadData()
    }

}

