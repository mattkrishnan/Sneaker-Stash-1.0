//
//  ViewController.swift
//  Sneaker Stash
//
//  Created by Matthew Krishnan on 3/27/20.
//  Copyright © 2020 Matthew Krishnan. All rights reserved.
//  This App is developed as an educational project.
//  Certain materials are included under the fair use exemption of the U.S. Copyright Law
//  and have been prepared according to the multimedia fair use guidelines and are restricted
//  from further use.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imgLogoPicture: UIImageView!
    
    
    var anotherOneSound: AVAudioPlayer!
    var cashRegister: AVAudioPlayer!
    
    var marketPriceSite = ""
    
    @IBOutlet weak var lblColorway: UILabel!
    
    @IBOutlet weak var lblSize: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var imgSneakerPicture: UIImageView!

    @IBOutlet weak var lblSneakerName: UILabel!
    
    @IBAction func btnMarketPrice(_ sender: Any) {
        
        let app = UIApplication.shared
        if marketPriceSite == ""{
            marketPriceSite = "https://www.stockx.com"
        }
        
        let urlAddress = marketPriceSite
        let urlw = URL(string:urlAddress)
        app.open(urlw!)
        cashRegister.play()
    }
    
    
    @IBAction func btnAnotherOne(_ sender: Any) {
        
        setLabels()
        rotateIcon()
        
    }
    
    var SneakerStash = ["AJ1 Spider-Man Origin Story"]
    
    var SneakerArray = [Sneaker]()
    
    func setLabels() {
        let randomSneaker = SneakerArray.randomElement()
        lblSneakerName.text = randomSneaker!.SneakerName
        let img = UIImage(named: randomSneaker!.SneakerPicture)
        imgSneakerPicture.image = img
        imgSneakerPicture.contentMode = .scaleAspectFit
        
        lblPrice.text = "Price: \(randomSneaker!.SneakerPrice) "
        lblSize.text = "Size: \(randomSneaker!.SneakerSize) "
        lblColorway.text = "\(randomSneaker!.SneakerColor) "
        
        marketPriceSite = randomSneaker!.SneakerURL
        anotherOneSound.play()
    }
    
    func rotateIcon() {
        UIView.animate(withDuration: 1.0, animations: ({
          
            self.imgLogoPicture.transform = self.imgLogoPicture.transform.rotated(by: CGFloat((180.0 * .pi) / 180.0))
            
            //self.imgLogoPicture.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
            
        }))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        anotherOneSound = try?
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "another_one", ofType: "wav")!))
        
        cashRegister = try?
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "cash_register", ofType: "wav")!))
        
        populateSneaker()
        setLabels()
    }
    

    func populateSneaker() {
        let s1 = Sneaker()
        s1.SneakerName = "AJ1 Spider-Man Origin Story"
        s1.SneakerPrice = "$160.00"
        s1.SneakerSize = "11"
        s1.SneakerPicture = "sneakers/orign_story.jpeg"
        s1.SneakerColor = "AJ1H-CC Gym Red/Black/White/Photo Blue"
        s1.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-chicago-crystal"
        SneakerArray.append(s1)
        

        let s2 = Sneaker()
        s2.SneakerName = "Yeezy 350 V2 Black"
        s2.SneakerPrice = "$220.00"
        s2.SneakerSize = "11.5"
        s2.SneakerPicture = "sneakers/350_black.jpg"
        s2.SneakerColor = "FU9006 Black/Black/Black"
        s2.SneakerURL = "https://stockx.com/adidas-yeezy-boost-350-v2-black"
        SneakerArray.append(s2)
        

        let s3 = Sneaker()
        s3.SneakerName = "Yeezy 350 V2 Clay"
        s3.SneakerPrice = "$220.00"
        s3.SneakerSize = "11.5"
        s3.SneakerPicture = "sneakers/350_clay.jpg"
        s3.SneakerColor = "EG7490 Clay/Clay/Clay"
        s3.SneakerURL = "https://stockx.com/adidas-yeezy-boost-350-v2-clay"
        SneakerArray.append(s3)


        let s4 = Sneaker()
        s4.SneakerName = "Yeezy 350 V2 Teal Blue"
        s4.SneakerPrice = "$300.00"
        s4.SneakerSize = "11"
        s4.SneakerPicture = "sneakers/700_teal.jpg"
        s4.SneakerColor = "FW2499 Teal Blue"
        s4.SneakerURL = "https://stockx.com/adidas-yeezy-boost-700-teal-blue"
        SneakerArray.append(s4)


        let s5 = Sneaker()
        s5.SneakerName = "ACG Ruckel Ridge Clay Green"
        s5.SneakerPrice = "$180.00"
        s5.SneakerSize = "11"
        s5.SneakerPicture = "sneakers/acg_ruckle_ridge.jpg"
        s5.SneakerColor = "AQ9333-900 Green/Black/Barley Volt"
        s5.SneakerURL = "https://stockx.com/nike-acg-ruckel-ridge-clay-green"
        SneakerArray.append(s5)


        let s6 = Sneaker()
        s6.SneakerName = "Jordan 3 Retro Black Cement"
        s6.SneakerPrice = "$200.00"
        s6.SneakerSize = "11"
        s6.SneakerPicture = "sneakers/black_cement_3.jpeg"
        s6.SneakerColor = "854262-001 Black/Fire Red/ Grey-White"
        s6.SneakerURL = "https://stockx.com/air-jordan-3-retro-black-cement-2018"
        SneakerArray.append(s6)


        let s7 = Sneaker()
        s7.SneakerName = "Jordan 11 Retro Playoffs Bred"
        s7.SneakerPrice = "$100.00"
        s7.SneakerSize = "11"
        s7.SneakerPicture = "sneakers/brown_dunk.jpg"
        s7.SneakerColor = "BQ6826-201 Baroque Brown/Black"
        s7.SneakerURL = "https://stockx.com/nike-sb-dunk-high-baroque-brown"
        SneakerArray.append(s7)


        let s8 = Sneaker()
        s8.SneakerName = "Jordan 4 Retro Bred"
        s8.SneakerPrice = "$200.00"
        s8.SneakerSize = "11"
        s8.SneakerPicture = "sneakers/bred-4.jpg"
        s8.SneakerColor = "308497-060 Black/Fire Red-Cement"
        s8.SneakerURL = "https://stockx.com/air-jordan-4-retro-bred-2019"
        SneakerArray.append(s8)

        let s31 = Sneaker()
        s31.SneakerName = "Air Max 1 Inside Out"
        s31.SneakerPrice = "$130.00"
        s31.SneakerSize = "11"
        s31.SneakerPicture = "sneakers/brown_dunk.jpg"
        s31.SneakerColor = "858876-713 Club-Gold/Desert-Sand/University Red"
        s31.SneakerURL = "https://stockx.com/nike-air-max-1-inside-out-club-gold-black"
        SneakerArray.append(s31)
        
        let s9 = Sneaker()
        s9.SneakerName = "Converse Chuck Taylor All-Star"
        s9.SneakerPrice = "$110.00"
        s9.SneakerSize = "11"
        s9.SneakerPicture = "sneakers/chuck.jpg"
        s9.SneakerColor = "167954C BLACK/EGRET-NATURAL"
        s9.SneakerURL = "https://stockx.com/converse-chuck-taylor-all-star-70s-hi-fear-of-god-black-natural"
        SneakerArray.append(s9)

        let s10 = Sneaker()
        s10.SneakerName = "Nike SB Dunk Low Corduroy Dusty Peach"
        s10.SneakerPrice = "$90.00"
        s10.SneakerSize = "11"
        s10.SneakerPicture = "sneakers/cuordoroy_dunk.jpg"
        s10.SneakerColor = "BQ6817-201 Dusty Peach/Photo Blue"
        s10.SneakerURL = "https://stockx.com/nike-sb-dunk-low-corduroy-dusty-peach"
        SneakerArray.append(s10)
        
        
        let s11 = Sneaker()
        s11.SneakerName = "React Element 55 Black Aurora Green"
        s11.SneakerPrice = "$130.00"
        s11.SneakerSize = "11.5"
        s11.SneakerPicture = "sneakers/element_55.jpg"
        s11.SneakerColor = "BQ6166-004 Black/Aurora Green-Cool Grey"
        s11.SneakerURL = "https://stockx.com/nike-react-element-55-black-aurora-green"
        SneakerArray.append(s11)
        

        let s12 = Sneaker()
        s12.SneakerName = "Epic React Flyknit White Bright Crimson"
        s12.SneakerPrice = "$150.00"
        s12.SneakerSize = "11.5"
        s12.SneakerPicture = "sneakers/epic_react.jpg"
        s12.SneakerColor = "AQ0067-103 True White/Black/Crimson Volt"
        s12.SneakerURL = "https://stockx.com/nike-epic-react-flyknit-white-bright-crimson"
        SneakerArray.append(s12)
        

        let s13 = Sneaker()
        s13.SneakerName = "Yeezy Boost 700 V2 Geode"
        s13.SneakerPrice = "$300.00"
        s13.SneakerSize = "11"
        s13.SneakerPicture = "sneakers/geode_700.jpg"
        s13.SneakerColor = "EG6860 Geode"
        s13.SneakerURL = "https://stockx.com/adidas-yeezy-boost-700-v2-geode"
        SneakerArray.append(s13)


        let s14 = Sneaker()
        s14.SneakerName = "Jordan 3 Retro Flyknit Black"
        s14.SneakerPrice = "$200.00"
        s14.SneakerSize = "11"
        s14.SneakerPicture = "sneakers/glow_3.jpeg"
        s14.SneakerColor = "AQ1005-001 Black/Anthracite"
        s14.SneakerURL = "https://stockx.com/air-jordan-3-retro-flyknit-black"
        SneakerArray.append(s14)


        let s15 = Sneaker()
        s15.SneakerName = "Air Force One Low Gore-Tex Black"
        s15.SneakerPrice = "$90.00"
        s15.SneakerSize = "11"
        s15.SneakerPicture = "sneakers/gortex_am1.jpg"
        s15.SneakerColor = "CK2630-001 Black/Light-Carbon/Ceramic"
        s15.SneakerURL = "https://stockx.com/nike-air-force-one-low-gore-tex-black-light-carbon"
        SneakerArray.append(s15)


        let s16 = Sneaker()
        s16.SneakerName = "Yeezy Boost 700 Inertia"
        s16.SneakerPrice = "$300.00"
        s16.SneakerSize = "11"
        s16.SneakerPicture = "sneakers/inertia_700.jpg"
        s16.SneakerColor = "EG7597 Grey/Grey/Inertia"
        s16.SneakerURL = "https://stockx.com/adidas-yeezy-boost-700-inertia"
        SneakerArray.append(s16)


        let s17 = Sneaker()
        s17.SneakerName = "Air Max 1 Inside Out"
        s17.SneakerPrice = "$130.00"
        s17.SneakerSize = "11"
        s17.SneakerPicture = "sneakers/inside_out.jpg"
        s17.SneakerColor = "858876-713 Club-Gold/Desert-Sand/University Red"
        s17.SneakerURL = "https://stockx.com/nike-air-max-1-inside-out-club-gold-black"
        SneakerArray.append(s17)


        let s18 = Sneaker()
        s18.SneakerName = "Jordan 4 Retro Levi's Black (Levi's Tag)"
        s18.SneakerPrice = "$225.00"
        s18.SneakerSize = "11"
        s18.SneakerPicture = "sneakers/levi_4.jpeg"
        s18.SneakerColor = "AO2571-001 Black/Canvas"
        s18.SneakerURL = "https://stockx.com/air-jordan-4-retro-levis-black"
        SneakerArray.append(s18)


        let s19 = Sneaker()
        s19.SneakerName = "NMD R1 Core Black"
        s19.SneakerPrice = "$170.00"
        s19.SneakerSize = "11.5"
        s19.SneakerPicture = "sneakers/nmd_r1.jpg"
        s19.SneakerColor = "S79168 Core Black/Lush Red"
        s19.SneakerURL = "https://stockx.com/adidas-nmd-core-black-lush-red"
        SneakerArray.append(s19)


        let s20 = Sneaker()
        s20.SneakerName = "Jordan 1 Defiant SB NYC to Paris"
        s20.SneakerPrice = "$175.00"
        s20.SneakerSize = "11"
        s20.SneakerPicture = "sneakers/paris_nyc.jpg"
        s20.SneakerColor = "CD6578-006 Light Bone/Crimson Tint"
        s20.SneakerURL = "https://stockx.com/air-jordan-1-sb-nyc-to-paris"
        SneakerArray.append(s20)
        
        let s21 = Sneaker()
        s21.SneakerName = "Jordan 1 Retro High Pine Green"
        s21.SneakerPrice = "$160.00"
        s21.SneakerSize = "11"
        s21.SneakerPicture = "sneakers/pine_green.jpeg"
        s21.SneakerColor = "555088-302 Pine Green/Sail-Black"
        s21.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-pine-green"
        SneakerArray.append(s21)
        

        let s22 = Sneaker()
        s22.SneakerName = "Jordan 1 Retro High Rookie of the Year"
        s22.SneakerPrice = "$160.00"
        s22.SneakerSize = "11"
        s22.SneakerPicture = "sneakers/rotm_1.jpeg"
        s22.SneakerColor = "555088-700 Golden Harvest/Black-Sail"
        s22.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-rookie-of-the-year"
        SneakerArray.append(s22)
        

        let s23 = Sneaker()
        s23.SneakerName = "Jordan 1 Retro High Shadow"
        s23.SneakerPrice = "$160.00"
        s23.SneakerSize = "11"
        s23.SneakerPicture = "sneakers/shadow.jpg"
        s23.SneakerColor = "555088-013 Black/Medium Grey-White"
        s23.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-shadow-2018"
        SneakerArray.append(s23)


        let s24 = Sneaker()
        s24.SneakerName = "Air Max 1 Tinker Sketch to Shelf"
        s24.SneakerPrice = "$150.00"
        s24.SneakerSize = "11"
        s24.SneakerPicture = "sneakers/sketch.jpg"
        s24.SneakerColor = "CJ4286-001 Black/Black/White"
        s24.SneakerURL = "https://stockx.com/nike-air-max-1-tinker-sketch-to-shelf-black"
        SneakerArray.append(s24)


        let s25 = Sneaker()
        s25.SneakerName = "Jordan 3 Retro Tinker Hatfield"
        s25.SneakerPrice = "$200.00"
        s25.SneakerSize = "11"
        s25.SneakerPicture = "sneakers/tinker_3.jpg"
        s25.SneakerColor = "AQ3835-160 White/Black/Fire Red/Cement"
        s25.SneakerURL = "https://stockx.com/air-jordan-3-retro-tinker-hatfield"
        SneakerArray.append(s25)


        let s26 = Sneaker()
        s26.SneakerName = "Nike Air Max 90 UNC"
        s26.SneakerPrice = "$110.00"
        s26.SneakerSize = "11"
        s26.SneakerPicture = "sneakers/unc_am90.jpg"
        s26.SneakerColor = "AJ1285-105 University Blue/Navy/White"
        s26.SneakerURL = "https://stockx.com/nike-air-max-90-unc"
        SneakerArray.append(s26)


        let s27 = Sneaker()
        s27.SneakerName = "Jordan 1 Retro High NC to Chi"
        s27.SneakerPrice = "$170.00"
        s27.SneakerSize = "11"
        s27.SneakerPicture = "sneakers/unc_chi.jpg"
        s27.SneakerColor = "CD0461-046 Black/Gym Red/Powder Blue"
        s27.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-unc-chicago-leather-w"
        SneakerArray.append(s27)


        let s28 = Sneaker()
        s28.SneakerName = "Jordan 1 Low SB UNC"
        s28.SneakerPrice = "$110.00"
        s28.SneakerSize = "11"
        s28.SneakerPicture = "sneakers/unc_low.jpg"
        s28.SneakerColor = "CJ7891-401 Dark Powder Blue/White"
        s28.SneakerURL = "https://stockx.com/air-jordan-1-low-sb-unc"
        SneakerArray.append(s28)


        let s29 = Sneaker()
        s29.SneakerName = "Yeezy Boost 700 Wave Runner"
        s29.SneakerPrice = "$300.00"
        s29.SneakerSize = "11"
        s29.SneakerPicture = "sneakers/wave_700.jpg"
        s29.SneakerColor = "B75571 Grey/Chalk White/Core Black"
        s29.SneakerURL = "https://stockx.com/adidas-yeezy-wave-runner-700-solid-grey"
        SneakerArray.append(s29)


        let s30 = Sneaker()
        s30.SneakerName = "Jordan 1 Retro High Wheat"
        s30.SneakerPrice = "$160.00"
        s30.SneakerSize = "11"
        s30.SneakerPicture = "sneakers/wheat.jpeg"
        s30.SneakerColor = "555088-710 Golden Harvest"
        s30.SneakerURL = "https://stockx.com/air-jordan-1-retro-high-wheat"
        SneakerArray.append(s30)
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event:
        UIEvent?){
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setLabels()
    }
    

}

