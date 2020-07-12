//
//  PackageListViewController.swift
//  Paketler
//
//  Created by Gökhan on 10.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class PackageListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel:PackageListViewModelProtocol!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var txtSearchField: CustomTextField!
    @IBOutlet weak var lblPackageCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func donePressed(_ sender:UIBarButtonItem){
        view.endEditing(true)
    }
    func setupUI(){
        txtSearchField.delegate = self
        txtSearchField.addTarget(self, action: #selector(search(_:)), for: UIControl.Event.editingChanged)
        addToolBar(textField: txtSearchField, selector: #selector(donePressed(_:)), target: self, delegate: self)
        imgSearch.isUserInteractionEnabled = true
        let gestureInfo = UITapGestureRecognizer(target: self, action: #selector(selectSearch(_:)))
        imgSearch.addGestureRecognizer(gestureInfo)
        viewModel =  PackageListViewModel(packageData: PackageData())
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.load()
        viewModel.showSortDefault()
        self.tableView.reloadData()
        lblPackageCount.text = "\(viewModel.items.packages?.count ?? 0) Paket"
        NotificationCenter.default.addObserver(self, selector: #selector(showFilter), name: Notification.Name("FilterNoti"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSort), name: Notification.Name("SortNoti"), object: nil)
    }
    
    @objc func showFilter(){
        viewModel.load()
        if Constants.SELECTED_SORT_ID != nil {
            viewModel.showSort(idSort: Constants.SELECTED_SORT_ID)
        }else{
            viewModel.showSortDefault()
        }
        if Constants.SELECTED_FILTER_DATA != nil{
            viewModel.showFilter(filterDataModel: Constants.SELECTED_FILTER_DATA)
        }
        tableView.reloadData()
        lblPackageCount.text = "\(viewModel.items.packages?.count ?? 0) Paket"
        
    }
    
    @objc func showSort(){
        if Constants.SELECTED_SORT_ID != nil {
            viewModel.showSort(idSort: Constants.SELECTED_SORT_ID)
        }
        tableView.reloadData()
    }
    
    @objc func selectSearch(_ gesture:UITapGestureRecognizer){
        viewSearch.isHidden = !viewSearch.isHidden
        imgLogo.isHidden = !imgLogo.isHidden
        if viewSearch.isHidden {
            imgSearch.image = UIImage(named: "ic_search")
            viewModel.didCancelSearch()
            txtSearchField.text = ""
            viewModel.showSortDefault()
            self.tableView.reloadData()
        }else{
            imgSearch.image = UIImage(named: "ic_close_white")
        }
    }
    
    
    @objc func search(_ textField:UITextField){
        print(textField.text ?? "")
        viewModel.didSearch(query: textField.text ?? "")
        self.tableView.reloadData()
    }
    
    func subscriptionType(data:String?) -> String {
        if data != nil {
            switch data! {
            case "monthly":
                return "/ Aylık"
            case "yearly":
                return "/ Yıllık"
            case "weekly":
                return "/ Haftalık"
            default:
                return ""
            }
        }
        
        return ""
    }
    
    func createAppView(imageName:String) ->  UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 30, height: 30)
        imageView.frame.origin = CGPoint(x: 0, y: 0)
        imageView.image = UIImage(named: imageName)
        view.addSubview(imageView)
        return view
    }
    
    func setupApps(cell:PackageTableViewCell,benefits:[String]?) {
        if benefits == nil {
            cell.stackView.isHidden = true
        }else{
            cell.stackView.isHidden = false
            cell.stackView.arrangedSubviews.forEach { view in
                cell.stackView.removeArrangedSubview(view)
            }
            benefits?.forEach({ item in
                if item == "TV+"{
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_tv_plus"))
                }else if item == "Fizy" {
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_fizy"))
                }else if item == "BiP" {
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_bip"))
                }else if item == "lifebox" {
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_lifebox"))
                }else if item == "Platinum" {
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_platinium"))
                }else if item == "Dergilik+" {
                    cell.stackView.addArrangedSubview(createAppView(imageName: "ic_dergilik"))
                }
            })
            
            let index = 6 - benefits!.count
            for _ in 0..<index {
                cell.stackView.addArrangedSubview(UIView())
            }
        }
        
    }
    
    
    func setupDataUi(cell:PackageTableViewCell,tariff:Tariff?){
        cell.viewInternet.isHidden = true
        cell.viewMinutes.isHidden = true
        cell.viewSms.isHidden = true
        cell.viewInternetHeight.constant = 0
        cell.viewMinutesHeight.constant = 0
        cell.viewSmsHeight.constant = 0
        
        if tariff == nil {
            return
        }
        if tariff!.data == "0"{
            cell.contentLine1.isHidden = true
            cell.viewInternet.isHidden = true
        }else{
            cell.viewInternetHeight.constant = 48
            cell.viewInternet.isHidden = false
            cell.lblData.text = mbToGb(data:  tariff?.data)
        }
        if tariff!.talk == "0"{
            cell.contentLine2.isHidden = true
            cell.viewMinutes.isHidden = true
        }else{
            cell.viewMinutesHeight.constant = 48
            cell.viewMinutes.isHidden = false
            cell.lblDk.text =  tariff?.talk != nil ? tariff!.talk! + " DK" : ""
            
        }
        if tariff!.sms == "0"{
            cell.contentLine2.isHidden = true
            cell.viewSms.isHidden = true
        }else{
            cell.viewSmsHeight.constant = 48
            cell.viewSms.isHidden = false
            cell.lblSms.text =  tariff?.sms != nil ? tariff!.sms! + " SMS" : ""
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
    @objc func selectFavori(_ gesture:UITapGestureRecognizer){
        let index = (gesture.view?.tag)!
        viewModel.didSelectFavorite(at: index)
        tableView.reloadData()
    }
    
    @objc func selectInfo(_ gesture:UITapGestureRecognizer){
        let index = (gesture.view?.tag)!
        viewModel.didInfoSelect(at: index)
        tableView.reloadData()
    }
    
    @objc func cancelInfo(_ sender:UIButton){
        let index = sender.tag
        viewModel.didCancelInfo(at: index)
        tableView.reloadData()
    }
}

extension PackageListViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.packages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPackageContent", for: indexPath) as! PackageTableViewCell
        let model = viewModel.items.packages![indexPath.row]
        cell.lblPackageName.text = model.name
        cell.lblPrice.text = toPriceTL(price: model.price ?? 0.0)
        cell.lblSubscriptionType.text = subscriptionType(data: model.subscriptionType)
        setupApps(cell: cell, benefits: model.benefits)
        setupDataUi(cell: cell, tariff: model.tariff)
        let didUseBefore =  (model.didUseBefore ?? false)
        cell.lblDidUseBefore.text = didUseBefore ? "Kullanıldı" : ""
        if didUseBefore {
            cell.cnsTopPackageName.constant = 14
        }else{
            cell.cnsTopPackageName.constant = 20
        }
        let favorite = UserDefaults.standard.bool(forKey: model.name!)
        cell.imgFavorite.isUserInteractionEnabled = true
        cell.imgFavorite.image = favorite ? UIImage(named: "ic_favorite_fill") : UIImage(named: "ic_favorite")
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectFavori(_:)))
        cell.imgFavorite.tag = indexPath.row
        cell.imgFavorite.addGestureRecognizer(gesture)
        cell.lblPackageDetail.text = model.desc
        cell.lblAvabiltyDate.text = "Geçerlilik Tarihi : \(msToStringDate(msDate: model.availableUntil))"
        
        cell.imgInfo.isUserInteractionEnabled = true
        let gestureInfo = UITapGestureRecognizer(target: self, action: #selector(selectInfo(_:)))
        cell.imgInfo.tag = indexPath.row
        cell.imgInfo.addGestureRecognizer(gestureInfo)
        cell.btnDetailClose.tag = indexPath.row
        cell.btnDetailClose.addTarget(self, action: #selector(cancelInfo(_:)), for: UIControl.Event.touchUpInside)
        
        if model.info ?? false {
            cell.viewDetail.isHidden = false
        }else{
            cell.viewDetail.isHidden = true
        }
        return cell
    }
    
    
}

extension PackageListViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
