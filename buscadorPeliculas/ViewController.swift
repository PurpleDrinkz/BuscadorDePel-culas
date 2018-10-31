//
//  ViewController.swift
//  buscadorPeliculas
//
//  Created by Alumno on 24/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var aiCargarPelicula: UIActivityIndicatorView!
    @IBOutlet weak var lblMovie: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var lblNotFound: UILabel!
    var tituloBuscador : String?
    
    
    
    
    @IBAction func doTapSearch(_ sender: Any) {
        
        tituloBuscador = txtSearch.text
        
        let urlMovieSearch = "https://www.omdbapi.com/?apikey=f6a3d230&t=\(tituloBuscador!)"
        
        Alamofire.request(urlMovieSearch).responseJSON{
            response in
            
            self.aiCargarPelicula.startAnimating()
            
            if let dictMovie = response.result.value as? NSDictionary{
                
               
                
                if let title = dictMovie.value(forKey: "Title") as? String{
                    self.lblMovie.text = title
                    
                }
                
                if let year = dictMovie.value(forKey: "Year") as? String{
                    self.lblYear.text = year
                }
                
                if let rating = dictMovie.value(forKey: "Rated") as? String{
                    self.lblRating.text = rating
                }
                
                if let duration = dictMovie.value(forKey: "Runtime") as? String{
                    self.lblRuntime.text  = duration
                }
                
                if let genre = dictMovie.value(forKey: "Genre") as? String{
                    self.lblGenre.text = genre
                }
                
                if let director = dictMovie.value(forKey: "Director") as? String{
                    self.lblDirector.text = director
                }
                
                if let response = dictMovie.value(forKey: "Response") as? String{
                    if response == "False"
                    {
                        self.lblNotFound.isHidden = false
                        
                        self.lblMovie.text = "Movie: "
                        self.lblYear.text = "Year: "
                        self.lblRating.text = "Rating: "
                        self.lblRating.text = "Rating: "
                        self.lblRuntime.text = "Runtime: "
                        self.lblGenre.text = "Genre: "
                        self.lblDirector.text = "Director: "
                        
                    }
                    if response == "True"
                    {
                        self.lblNotFound.isHidden = true
                        
                    }
                }
                
                
                    self.aiCargarPelicula.stopAnimating()
                
            }else{
                
            }
            
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

