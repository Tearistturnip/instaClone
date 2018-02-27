//
//  FeedViewController.swift
//  instaClone
//
//  Created by Justin Lee on 2/26/18.
//  Copyright © 2018 Justin Lee. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var images: [PFObject] = []

    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.rowHeight = UITableViewAutomaticDimension
        homeTableView.estimatedRowHeight = 50
        homeTableView.delegate = self
        homeTableView.dataSource = self
        fetchImages()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    @IBAction func shareSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToChoose", sender: nil)
    }
    
    func fetchImages(){
        let query = Post.query()
        query?.addAscendingOrder("createAt")
        query?.includeKey("media")
        query?.limit = 20
        images = (try! query?.findObjects())!
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "instaCell", for: indexPath) as! instaCell
        
        /*
        let imagePost = images[indexPath.row]["media"] as? PFFile
        cell.photoView = imagePost as? PFImageView
 
 */
        if let user = images[indexPath.row] as? PFUser {
            // User found! update username label with username
            cell.userLabel.text = user.username as! String
            print(user.username as! String)
        } else {
            // No user found, set default username
            cell.userLabel.text = "🤖"
        }
        let caption = images[indexPath.row]["caption"]
        cell.captionLabel.text = caption as? String
        print(caption as? String)
        let createdAt = images[indexPath.row]["_created_at"]
        cell.createdLabel.text = createdAt as? String
        
        
        return cell
        
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


    
    

