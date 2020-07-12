//
//  FilterScreenViewController.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class FilterScreenViewController: UIViewController {
      @IBOutlet weak var tableView: UITableView!
        var viewModel:FilterViewModel!
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.delegate = self
            viewModel = FilterViewModel()
            viewModel.load()
            if Constants.SELECTED_FILTER_DATA != nil {
                viewModel.dataSource = Constants.SELECTED_FILTER_DATA
            }
            // Do any additional setup after loading the view.
        }
    
    override func viewDidDisappear(_ animated: Bool) {
        var selected = false
        for item in viewModel.dataSource {
            if item.selected {
                selected = true
                break
            }
        }
        if selected {
            Constants.SELECTED_FILTER_DATA = viewModel.dataSource
        }else{
            Constants.SELECTED_FILTER_DATA = nil

        }
        NotificationCenter.default.post(name: Notification.Name("FilterNoti"), object: nil)
    }
    

        
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {
        })
    
       
    }
    
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }


    extension FilterScreenViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return viewModel.dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = viewModel.dataSource[indexPath.row]
            if model.cellType == CellType.TITLE{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellTitle", for: indexPath) as! FilterTableViewCell
                cell.lblTitle.text = model.title
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! FilterTableViewCell
                cell.lblTitle.text = model.title
                cell.btnCheckbox.isSelected = model.selected
                return cell
            }
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            viewModel.didSelectFilter(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
