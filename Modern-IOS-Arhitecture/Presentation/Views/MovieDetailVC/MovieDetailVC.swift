//
//  MovieDetailVC.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import UIKit

class MovieDetailVC: UIViewController {

    var movie : MovieModel? = nil
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblVote: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle  = ""
        self.navigationItem.hidesBackButton = true

        setData()
        
    }


    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden  = true
        self.imgImage.layer.cornerRadius = 15
    }
    

    
    // MARK: - IBActions
    
    @IBAction func onBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK: - Functions
extension MovieDetailVC {
    
    func setData(){
        if let mov = self.movie {
            self.lblTitle.text = mov.title
            self.lblReleaseDate.text = mov.release_date
            self.lblVote.text = String(mov.vote_count ?? 0)
            self.lblDescription.text = mov.overview
            
            if let imgUrl = mov.poster_path {
                let imgURL = Config.BaseImageUrl + imgUrl
                let iURL  = NSURL(string: imgURL )
                self.imgImage.af.setImage(withURL: iURL as! URL,placeholderImage: UIImage.init(named: "image-2"))
            }
            else {
                // show error image here
            }
        }
        else
        {
            self.dismiss(animated: true)
        }
    }
}
