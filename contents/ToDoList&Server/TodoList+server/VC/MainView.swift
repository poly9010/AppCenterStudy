//
//  ViewController.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/21.
//

import UIKit

var memoList = [MemoInfo]()
class MainView: UIViewController, sendUpdateDelegate {
    func sendData(data: MemoInfo) {
        for (i,_) in memoList.enumerated(){
            
            if (memoList[i].id == data.id){
                
                memoList[i] = data
                encoding()
            }
    }
    }
    
    
   
    
    @IBOutlet weak var mainTableView : UITableView!
    
    @IBAction func plusBtn(_ sender:Any){
        guard let plusVC  = self.storyboard?.instantiateViewController(withIdentifier: "PlusView") as? PlusView else{
                return
            }
        plusVC.modalPresentationStyle = .fullScreen
        self.present(plusVC, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mainTableView.reloadData()
    }
    
    


}

extension MainView: UITableViewDelegate,UITableViewDataSource {
    
    //MARK: tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "custumCell", for: indexPath) as? custumCell else{
                return UITableViewCell()
        }
        
        
        cell.deleteCallBackMethod = {

            memoList = memoList.filter { $0.id != cell.id }
            encoding()
            self.mainTableView.reloadData()

        }

        let memo = memoList[indexPath.row]
        cell.updateCell(memo: memo)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let editVC  = self.storyboard?.instantiateViewController(withIdentifier: "EditView") as? EditView else{
            return
        }
        editVC.delegate = self
        editVC.data = memoList[indexPath.row]
        editVC.modalPresentationStyle = .fullScreen
        self.present(editVC,animated: true,completion: nil)
//        self.performSegue(withIdentifier: "EditView", sender: nil)

    }
}

