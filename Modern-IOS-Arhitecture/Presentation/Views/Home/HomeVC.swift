//
//  HomeVC.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import UIKit

protocol HomeView : class {
    func viewDidLoad() -> ()
    func updateProgress(message: String, isCompleted: Bool)
    func updateStatus(data:[MovieModel],status: Bool,msg:String,identifier:Int)
    
}


class HomeVC: UIViewController {
    @IBOutlet weak var tblMovies: UITableView!
    var presenter : HomePresenter?
    
    var movieDataSource : [MovieModel] = [] {
        didSet{
            self.tblMovies.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title  = "Movies"
        
        initTblViews()
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden  = false
    }
    
    
    
}
// MARK: - Functions
extension HomeVC  {
    func initTblViews()
    {
        tblMovies.delegate = self
        tblMovies.dataSource = self
        tblMovies.separatorStyle = .none
        
        tblMovies.estimatedRowHeight = 120
        tblMovies.rowHeight = 120
        
        let Ordernib = UINib(nibName: "MovieCell", bundle: nil)
        tblMovies.register(Ordernib, forCellReuseIdentifier:"cell")
        tblMovies.tableFooterView = UIView(frame: .zero)
        tblMovies.backgroundColor = nil
        //        self.updateProgress(message: "", isCompleted: false)
        //        self.presenter?.getFavtTrips()
    }
}

// MARK: - Protocols
extension HomeVC : UITableViewDataSource,UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.movieDataSource.count
        
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.selectionStyle = .none
        let item = self.movieDataSource[indexPath.row]
        cell.configure(using: item)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.movieDataSource[indexPath.row]
        self.presenter?.routeToMovieDetail(movie: item)
    }
    
}

// MARK: - View protocols
extension HomeVC : HomeView
{
    func updateStatus(data: [MovieModel], status: Bool, msg: String, identifier: Int) {
        if (status)
        {
            self.movieDataSource = data
            
        }
        else {
            //show error alert here
        }
    }
    
    func updateProgress(message: String, isCompleted: Bool) {
        if isCompleted {
            ProgressHUD.hidePD(in: self)
        }
        else
        {
            ProgressHUD.showPD(in: self)
            
        }
    }
}
