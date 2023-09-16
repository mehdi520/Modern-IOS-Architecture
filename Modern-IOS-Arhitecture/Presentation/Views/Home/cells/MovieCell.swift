//
//  MovieCell.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgThumbnail.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(using model : MovieModel)
    {
        self.title.text = model.title
        self.discription.text = model.overview
        if let imgUrl = model.poster_path {
            let imgURL = Config.BaseImageUrl + imgUrl
            let iURL  = NSURL(string: imgURL )
            self.imgThumbnail.af.setImage(withURL: iURL as! URL,placeholderImage: UIImage.init(named: "image-2"))
        }
        else {
            // show error image here
        }
       
       
    }
    
}
