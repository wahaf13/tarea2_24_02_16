//
//  ViewController.swift
//  tarea2_24_enero
//
//  Created by Wendy Hernandez on 24/01/16.
//  Copyright © 2016 Wendy Hernandez. All rights reserved.
//wendys


import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var busca: UISearchBar!
    @IBOutlet weak var resultado: UITextView!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var etiqueta1: UILabel!
    @IBOutlet weak var etiqueta2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func petocion(sender: UISearchBar){
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+busca.text!
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        /*let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        resultado.text = texto! as String*/
        
        do{
            
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
            let dico1 = json as! NSDictionary
            let dico2 = dico1["publishers"] as! NSDictionary
            let dico3 = dico2["goodreads"] as! NSDictionary
            self.etiqueta1.text = dico3["title"] as! NSString as String
            
        }
        catch _{
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

