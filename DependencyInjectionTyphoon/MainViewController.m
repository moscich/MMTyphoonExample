//
// Created by Marek Mościchowski on 22/02/14.
// Copyright (c) 2014 Marek Mościchowski. All rights reserved.
//


#import "MainViewController.h"
#import "TyphoonComponentFactory.h"

@interface MainViewController()
@property (nonatomic, strong) NSArray *controllers;
@end

@implementation MainViewController {

}

- (void)viewDidLoad
{
    TyphoonComponentFactory *defaultFactory = [TyphoonComponentFactory defaultFactory];

    self.controllers = [defaultFactory allComponentsForType:[UIViewController class]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UIViewController *controller = [self.controllers objectAtIndex:(NSUInteger)indexPath.row];
    cell.textLabel.text = controller.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = [self.controllers objectAtIndex:(NSUInteger)indexPath.row];

    [self.navigationController pushViewController:controller animated:YES];
}

@end