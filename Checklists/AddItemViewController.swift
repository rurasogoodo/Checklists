//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Nick_Romanenko on 2/20/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // выключаем на этом вью-контроллере большой шрифт для Тайтла
        navigationItem.largeTitleDisplayMode = .never
        
    }

    //MARK:- Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        //возвращаемся на предыдущий вью-контроллер
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        //возвращаемся на предыдущий вью-контроллер
        navigationController?.popViewController(animated: true)
    }
}
