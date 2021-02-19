//
//  CollectionViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 02/02/2021.
//

#import "CollectionViewController.h"
#import "CellItem.h"

@interface CollectionViewController()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *explorerView;
@end

@interface CollectionViewController(UITableViewDataSource) <UITableViewDataSource>
@end

@interface CollectionViewController(UITableViewDelegate) <UITableViewDelegate>
@end

@implementation CollectionViewController {
  CellItem* items;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.title = @"Map4D iOS SDK";
  if (items == nil) {
    items = [[CellItem alloc] init];
  }
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  UITapGestureRecognizer *tapExplorer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapExplorerView)];
  [_explorerView addGestureRecognizer:tapExplorer];
}

- (void)tapExplorerView {
  [self.navigationController popViewControllerAnimated:YES];
}

@end


@implementation CollectionViewController(UITableViewDataSource)

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
  cell.textLabel.text = [items nameOfItemAtIndex:indexPath.row];
  cell.imageView.image = [items iconOfItemAtIndex:indexPath.row];
  return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return items.count;
}

@end


@implementation CollectionViewController(UITableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIViewController *vc = [items viewControllerOfItemAtIndex:indexPath.row];
  if (vc != nil) {
    [self.navigationController pushViewController:vc animated:YES];
  }
}

@end
