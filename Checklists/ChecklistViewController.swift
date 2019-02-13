//
//  ViewController.swift
//  Checklists
//
//  Created by Nick_Romanenko on 2/13/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Table View Data Source
    
    // устанавливаем количество ячеек для таблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // Указываем прототип ячейки, который будет дублироваться для таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // находим у ячейки Лейбл по Тегом "1000"
        let label = cell.viewWithTag(1000) as! UILabel
        
        // указываем, что будет в Лейбле под тегом "1000", если его местоположение будет в нужно строке
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row == 1 {
            label.text = "Brush the teeth"
        } else if indexPath.row == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row == 4 {
            label.text = "Eat ice cream"
        }
        return cell
    }
    
    //MARK: - Table View Delegate
    
    // указываем, что делать, если нажали на какую-то ячейку в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ставим/убираем "галочку" на выделенной ячейке
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        // снимаем "выделение" с этой нажатой ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

