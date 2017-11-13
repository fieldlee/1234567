//
//  ColorUtility.swift
//  OrderCommitV2
//
//  Created by Mukhar Gupta on 20/04/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import UIKit

class ColorUtility:NSObject
{
    
    //AppTheme colors
    class func navBarTintColor() -> UIColor{
        return  UIColor(red: 7/255, green: 154/255, blue: 214/255, alpha: 1)
    }
    class func navBarBackgroundColor() -> UIColor{
        return  UIColor(red: 66/255, green: 75/255, blue: 84/255, alpha: 1)
    }
    
    class func segmentBarTintColor() -> UIColor{
        return  UIColor(red: 7/255, green: 154/255, blue: 214/255, alpha: 1)
    }
    
    class func popoverBackgroudColor() -> UIColor  {
        return UIColor.white
    }
    
    //LoginViewController
    class func LoginBackgroundColor() -> UIColor{
        return  UIColor(red: 50/255, green: 58/255, blue: 68/255, alpha: 1)
    }
    class func SignInButtonBackgroundColor() -> UIColor{
        return  UIColor(red: 64/255, green: 152/255, blue: 188/255, alpha: 1)
    }
    class func TextFieldBackgroundColor() -> UIColor{
        return  UIColor(red: 235/255, green: 234/255, blue: 236/255, alpha: 1)
    }
    
    //MerchantPlan CollectionView
    class func CollectioViewBorderColor() -> UIColor{
        return  UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
    }
    class func inCompletedMerchantPlanColor() -> UIColor{
        return  UIColor(red: 7/255, green: 154/255, blue: 214/255, alpha: 1)
    }
    class func completedMerchantPlanColor() -> UIColor{
        return  UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }

    
    //New MerchantPlan Table View
    class func PlaceHolderColor() -> UIColor{
        return  UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)
    }
    class func FilledTextColor() -> UIColor{
        return  UIColor.black
    }
    class func SectionHeaderBackgroundColor() -> UIColor{
        return  UIColor(red: 236/255, green: 235/255, blue: 243/255, alpha: 1)
    }
    
    class func groupSearchHeaderBackgroundColor() -> UIColor{
        return  UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1)
    }
    
    //SearchBar textfield Color
    class func SearchBarBackgroundColor() -> UIColor{
        return  UIColor(red: 232/255, green: 232/255, blue: 234/255, alpha: 1)
    }
    
    class func SearchBarCursorColor() -> UIColor{
        return  UIColor(red: 6/255, green: 132/255, blue: 182/255, alpha: 1)
    }
    class func alertActionColor() -> UIColor{
        return  UIColor(red: 6/255, green: 132/255, blue: 182/255, alpha: 1)
    }
    class func searchBarViewBackgroudColor() -> UIColor {
        return  UIColor(red: 239/255, green: 239/255, blue: 240/255, alpha: 1)
    }
    
    //Placeholder text Color
    class func PlaceholderTextColor() -> UIColor{
        return  UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)
    }
    
    //Disabled Button text Color
    class func DisabledButtonTextColor() -> UIColor{
        return  UIColor(red: 166/255, green: 170/255, blue: 169/255, alpha: 1)
    }
    
    class func NavigationButtonColor() -> UIColor{
        return  UIColor.white

    }
    class func ViewBorderColor() -> UIColor{
        return  UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
    }
    
    class func colorForDayLabel()-> UIColor {
        return  UIColor(red: 62/255, green: 65/255, blue: 71/255, alpha: 1)
    }
    //Add New Tag
    class func AddNewTagNavBarColor() -> UIColor{
        return  UIColor(red: 244/255, green: 242/255, blue: 248/255, alpha: 1)
        
    }
    class func AddNewTagViewBackgroundColor() -> UIColor{
        return  UIColor(red: 240/155, green: 239/255, blue: 245/255, alpha: 1)
        
    }
    class func AddNewTagBorderColor() -> UIColor{
        return  UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1)
    }
    //Edit Tag
    class func editTagTextFieldBackgroundColor() -> UIColor{
        return  UIColor(red: 241/255, green: 240/255, blue: 245/255, alpha: 1)
    }
    class func editTagTextFieldBorderColor() -> UIColor{
        return  UIColor(red: 166/255, green: 170/255, blue: 169/255, alpha: 1)
    }
    //Data Collection Tag
    class func dataCollectionTagBorderColor() -> UIColor{
        return  UIColor(red: 166/255, green: 170/255, blue: 169/255, alpha: 1)
    }
    
    //PopoverNavBarBackgroundColor
    class func PopoverNavBarBackgroundColor() -> UIColor{
        return  UIColor(red: 245/255, green: 244/255, blue: 249/255, alpha: 1)
    }
    

    //Alert Background Color
    //PopoverNavBarBackgroundColor
    class func alertBackGroundColor() -> UIColor{
        return  UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    }

    //Current appointment color
    class func currentAppointmentColor() -> UIColor {
        return UIColor(red: 0.804, green: 0.741, blue: 0.435, alpha: 1.000)
    }

    class func currentDateColor() -> UIColor {
        return  UIColor(red: 5/255, green: 132/255, blue: 182/255, alpha: 1)
    }
    
    
    class func currentAppointmentYearColor() -> UIColor {
        return  UIColor(red: 150/255, green: 193/255, blue: 217/255, alpha: 1)
    }

    // Event Status Color
    class func appointmentRed() -> UIColor {
        return  UIColor(red: 241/255, green: 124/255, blue: 103/255, alpha: 1)
    }
    
    class func appointmentYellow() -> UIColor {
        return  UIColor(red: 243/255, green: 215/255, blue: 181/255, alpha: 1)
    }
    
    class func appointmentBlue() -> UIColor {
        return  UIColor(red: 123/255, green: 191/255, blue: 234/255, alpha: 1)
    }
    
    //Task Status Color
    class func warningTaskColor() -> UIColor {
        return  UIColor(red: 255/255, green: 148/255, blue: 0/255, alpha: 1)
    }
    
    class func errorTaskColor() -> UIColor {
        return  UIColor(red: 255/255, green: 38/255, blue: 0/255, alpha: 1)
    }
    
    class func completedTaskColor() -> UIColor {
        return  UIColor(red: 161/255, green: 161/255, blue: 162/255, alpha: 1)
    }
    
    
    class func numberWeekDayColor() -> UIColor {
        return  UIColor(red: 62/255, green: 65/255, blue: 71/255, alpha: 1)
    }

    class func loginInsetColor() -> UIColor {
        return  UIColor(red: 254/255, green: 253/255, blue: 255/255, alpha: 1)
    }
    
    class func loginApplicationColor() -> UIColor {
        return  UIColor(red: 83/255, green: 88/255, blue: 95/255, alpha: 1)
    }
    
    //Fonts
    class func HelveticaB16()->UIFont {
        return UIFont(name: "Helvetica-Bold", size: 16)!
    }
    
    class func HelveticaB17()->UIFont {
        return UIFont(name: "Helvetica-Bold", size: 17)!
    }
    class func Helvetica17()->UIFont {
        return UIFont(name: "Helvetica", size: 17)!
    }
    
    class func Helvetica11()->UIFont {
        return UIFont(name: "Helvetica", size: 11)!
    }
    
    class func Helvetica13()->UIFont {
        return UIFont(name: "Helvetica", size: 13)!
    }
    
    class func Helvetica16()->UIFont {
        return UIFont(name: "Helvetica", size: 16)!
    }
    
    class func Helvetica15()->UIFont {
        return UIFont(name: "Helvetica", size: 15)!
    }

    class func Helvetica20()->UIFont {
        return UIFont(name: "Helvetica", size: 20)!
    }
    class func Helvetica22()->UIFont {
        return UIFont(name: "Helvetica", size: 22)!
    }
}
