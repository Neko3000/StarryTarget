//
//  AssignmentAchieveViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/22/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit
import RealmSwift

class AssignmentAchieveViewController: UIViewController {

    //Components
    @IBOutlet weak var AnimationImageView: UIImageView!
    
    @IBOutlet weak var QuoteContentLabel: UILabel!
    @IBOutlet weak var QuoteAuthorLabel: UILabel!
    
    @IBOutlet weak var ReturnBtn: UIButton!
    
    //thread
    private var loadAnimationThread:Thread?
    
    //viewModel
    private var assignmentAchieveControllerViewModel:AssignmentAchieveViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set corner radius
        ReturnBtn.layer.cornerRadius = 8
        ReturnBtn.layer.masksToBounds = true
        
        //instantiate ViewModel
        assignmentAchieveControllerViewModel = AssignmentAchieveViewControllerViewModel()
        QuoteContentLabel.text = " \"\(assignmentAchieveControllerViewModel!.quote!.content)\" "
        QuoteAuthorLabel.text = "- \(assignmentAchieveControllerViewModel!.quote!.author)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set thread
        loadAnimationThread = Thread(target: self, selector: #selector(loadAnimation), object: nil)
        loadAnimationThread?.start()
    }
    
    @objc func loadAnimation()
    {
        let animation = UIImage.animatedImageNamed("moon-cloud/moon-cloud_", duration: 3)
        if(animation != nil)
        {
            performSelector(onMainThread: #selector(setAnimation(animation:)), with: animation, waitUntilDone: true)
        }
    }
    
    @objc func setAnimation(animation:UIImage)
    {
        AnimationImageView.image = animation
        AnimationImageView.contentMode = .scaleAspectFill
        AnimationImageView.startAnimating()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.AnimationImageView.alpha = 1
        })
    }
    
    func loadQuote()
    {
        let realm = try! Realm()
        let quotes = realm.objects(Quote.self)
        let randomIndex = Int(random: Range<Int>(0..<quotes.count))

        QuoteContentLabel.text = "\"\(quotes[randomIndex].content)\""

        QuoteAuthorLabel.text = "- \(quotes[randomIndex].author)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
