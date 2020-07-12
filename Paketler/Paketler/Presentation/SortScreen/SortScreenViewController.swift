//
//  SortScreenViewController.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class SortScreenViewController: UIViewController {
    var viewModel:SortScreenViewModel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SortScreenViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.load()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Constants.SELECTED_SORT_ID != nil {
            setSelectedSort()
            tableView.reloadData()
        }
    }
    
    func setSelectedSort() {
        if viewModel.dataSource != nil {
            for i in 0..<viewModel.dataSource.count {
                if Constants.SELECTED_SORT_ID == viewModel.dataSource[i].idSort {
                    viewModel.dataSource[i].selected = true
                    break
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("SortNoti"), object: nil)
    }
       
    
    @IBAction func doneButtonAction(_ sender: Any) {
        dismiss(animated: true) {}
    }
    
}

extension SortScreenViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.dataSource == nil {
            return 0
        }
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! SortScreenTableViewCell
        cell.updateRow(model: viewModel.dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectSort(at: indexPath.row)
        tableView.reloadData()
    }
    
    
}

