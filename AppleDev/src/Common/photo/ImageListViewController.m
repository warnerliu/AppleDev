//
//  ImageListViewController.m
//  NativeStorage
//
//  Created by warner on 15/9/9.
//  Copyright (c) 2015年 warner. All rights reserved.
//

#import "ImageListViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>

@interface ImageListViewController (){
    NSMutableArray *assetsGroupArray;
    NSMutableDictionary *assetsDictionary;
    ALAssetsLibrary *assetsLibrary;
}

@end

@implementation ImageListViewController


-(void)viewDidLoad{
    
    assetsGroupArray = [[NSMutableArray alloc]init];
    assetsDictionary = [[NSMutableDictionary alloc]init];
    assetsLibrary = [[ALAssetsLibrary alloc]init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            [assetsGroupArray addObject:group];
            NSLog(@"assets group size:%d",(int)[assetsGroupArray count]);
        }else {
            if ([assetsGroupArray count] > 0) {
                NSLog(@"assetsArray size > 0");
                for (ALAssetsGroup *obj in assetsGroupArray) {
                    NSMutableArray *assetsArray = [[NSMutableArray alloc]init];
                    [obj enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                        if (result) {
                            [assetsArray addObject:result];
                        }else{
                           
                            [assetsDictionary setObject:assetsArray forKey:[obj valueForProperty:ALAssetsGroupPropertyName]];
                        }
                    }];
                }
                [self.tableView reloadData];
            }else {
                NSLog(@"empty assets");
            }
        }
    } failureBlock:^(NSError *error) {
        ;
    }];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.tableView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    [self.tableView setBackgroundColor:[UIColor greenColor]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *kNormal = @"kNormal";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNormal];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kNormal];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }

    NSMutableArray *array = [assetsDictionary objectForKey:[[assetsGroupArray objectAtIndex:indexPath.section]valueForProperty:ALAssetsGroupPropertyName]];
    ALAsset *cellAsset = [array objectAtIndex:indexPath.row];
    CLLocation *location = [cellAsset valueForProperty:ALAssetPropertyLocation];
    NSURL *fileUrl = [cellAsset valueForProperty:ALAssetPropertyAssetURL];
    cell.textLabel.text = [fileUrl absoluteString];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[assetsGroupArray objectAtIndex:section] numberOfAssets];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [assetsGroupArray count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ALAssetsGroup *group =[assetsGroupArray objectAtIndex:section];
    return [group valueForProperty:ALAssetsGroupPropertyName];
}



@end
