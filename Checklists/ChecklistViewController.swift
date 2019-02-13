//
//  ViewController.swift
//  Checklists
//
//  Created by Nick_Romanenko on 2/13/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    let row0text = "Walk the dog"
    let row1text = "Brush the teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Table View Data Source
    
    // устанавливаем количество ячеек для таблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Указываем прототип ячейки, который будет дублироваться для таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // находим у ячейки Лейбл по Тегом "1000"
        let label = cell.viewWithTag(1000) as! UILabel
        
        // указываем, что будет в Лейбле под тегом "1000", если его местоположение будет в нужно строке
        if indexPath.row == 0 {
            label.text = row0text
        } else if indexPath.row == 1 {
            label.text = row1text
        } else if indexPath.row == 2 {
            label.text = row2text
        } else if indexPath.row == 3 {
            label.text = row3text
        } else if indexPath.row == 4 {
            label.text = row4text
        }
        
        // проверяем значение/отсутствие "галочек" в каждой ячейке и ставим соответствующее обозначение
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    //MARK: - Table View Delegate
    
    // указываем, что делать, если нажали на какую-то ячейку в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ставим/убираем "галочку" на выделенной ячейке
        if let cell = tableView.cellForRow(at: indexPath) {
            
            var isChecked = false
            
            if indexPath.row == 0 {
                row0checked = !row0checked
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
                isChecked = row2checked
            } else if indexPath.row == 3 {
                row3checked = !row3checked
                isChecked = row3checked
            } else if indexPath.row == 4 {
                row4checked = !row4checked
                isChecked = row4checked
            }
            
            // снимаем/добавляем "галочку" для ячейки
            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        // снимаем "выделение" с этой нажатой ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
        }
        
        // снимаем/добавляем "галочку" для ячейки
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
}

