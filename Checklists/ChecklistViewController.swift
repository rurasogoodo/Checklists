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
        return cell
    }
    
    //MARK: - Table View Delegate
    
    // указываем, что делать, если нажали на какую-то ячейку в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ставим/убираем "галочку" на выделенной ячейке
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(for: cell, at: indexPath)
        }
        
        // снимаем "выделение" с этой нажатой ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isCheked = false
        
        if indexPath.row == 0 {
            isCheked = row0checked
        } else if indexPath.row == 1 {
            isCheked = row1checked
        } else if indexPath.row == 2 {
            isCheked = row2checked
        } else if indexPath.row == 3 {
            isCheked = row3checked
        } else if indexPath.row == 4 {
            isCheked = row4checked
        }
        
        // снимаем/добавляем "галочку" для ячейки
        if isCheked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
}

