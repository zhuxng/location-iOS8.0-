//
//  ViewController.m
//  iOS8.0-location
//
//  Created by 朱星 on 16/9/10.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

#pragma mark - 懒加载
-(CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 10;
        //这是一个枚举类型。
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        
        if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
        {
            
            
            [self.locationManager requestWhenInUseAuthorization];
        }
        
    }
    return _locationManager;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

 
    [self.locationManager startUpdatingLocation];
    
   

    
}

#pragma mark - CLLocationManagerDelegate


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"定位信息");
}

@end
