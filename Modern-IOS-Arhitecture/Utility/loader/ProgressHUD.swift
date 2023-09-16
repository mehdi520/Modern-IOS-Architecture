

import Foundation
import MBProgressHUD
import UIKit

class ProgressHUD {
    static func showPD(in vc:UIViewController){
        let progressView = MBProgressHUD.showAdded(to: vc.view, animated: true)
        progressView.mode = .indeterminate
        progressView.bezelView.color = UIColor.black.withAlphaComponent(0.3)
        
    }
    
    static func hidePD(in vc:UIViewController){
        MBProgressHUD.hide(for: vc.view, animated: true)
        
    }
}
