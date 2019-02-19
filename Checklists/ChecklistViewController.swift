//
//  ViewController.swift
//  Checklists
//
//  Created by Nick_Romanenko on 2/13/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [CheckListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // активируем большой шрифт в "navigationBar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = CheckListItem()
        item2.text = "Brush my teeth"
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn iOS development"
        items.append(item3)
        
        let item4 = CheckListItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = CheckListItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
    }

    //MARK: - Table View Data Source
    
    // устанавливаем количество ячеек для таблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Указываем прототип ячейки, который будет дублироваться для таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        // проверяем, какой текст должен быть у этой ячейки, исходя из текста объекта в массиве
        configureText(for: cell, with: item)
        
        // проверяем значение/отсутствие "галочек" в каждой ячейке и ставим соответствующее обозначение
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    //MARK: - Table View Delegate
    
    // указываем, что делать, если нажали на какую-то ячейку в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ставим/убираем "галочку" на выделенной ячейке
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toogleChecked()
            configureCheckmark(for: cell, with: item)
        }
        
        // снимаем "выделение" с этой нажатой ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // указываем, что делать, если свайпнули какой-то элемент таблицы
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // удаляем элемент массива по индексу свайпнутой строки
        items.remove(at: indexPath.row)
        
        // создаем массив, где используем "положение по индексу в таблице для текущего свайпнутого элемента таблицы"
        let indexPaths = [indexPath]
        
        // удаляем свайпнутый элемент таблицы
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    // настраиваем checkMark для нужной ячейки
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    // настраиваем текст для нужной ячейки
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // MARK:- Actions
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let newRowIndex = items.count
        
        // создаем новый экземпляр "CheckListItem"
        let item = CheckListItem()
        item.text = "I am a new row"
        
        // добавляем его в массив
        items.append(item)
        
        // создаем "положение по индексу" для новой строки таблицы
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        // добавляем в тейбл-вью массив из новых строк (в нашем случае массив с нашей новой одной строкой)
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
}

