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
        
        // берем нужный по индексу элемент массива для соответствующей по индексу строке в таблице
        let item = items[indexPath.row]
        
        // находим у ячейки Лейбл по Тегом "1000"
        let label = cell.viewWithTag(1000) as! UILabel
        
        // присваиваем лейблу текст выбранного элемента
        label.text = item.text
        
        // проверяем значение/отсутствие "галочек" в каждой ячейке и ставим соответствующее обозначение
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    //MARK: - Table View Delegate
    
    // указываем, что делать, если нажали на какую-то ячейку в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ставим/убираем "галочку" на выделенной ячейке
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked = !item.checked
            
            configureCheckmark(for: cell, at: indexPath)
        }
        
        // снимаем "выделение" с этой нажатой ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
}

