//
//  ViewController.m
//  MyCalender
//
//  Created by LAI KIN WA on 16/7/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "collectionViewController.h"


@interface collectionViewController ()<UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate>

@property (nonatomic, copy) NSArray *images;
@property (strong, nonatomic) MyCollectionViewCell *selectedCell;

@end

@implementation collectionViewController

static NSString * const reuseIdentifier=@"MyCollectionCell";
static const CGFloat kCellMargin=5;

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate=self;
//    _images = @[@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer"];
//
//    double itemSize=[UIScreen mainScreen].bounds.size.width/3-3;
//    NSLog(@"itemSize: %f",itemSize);
//
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
//    layout.sectionInset=UIEdgeInsetsMake(20, 0, 10, 0);
//    layout.itemSize=CGSizeMake(itemSize, itemSize);
//
//    layout.minimumInteritemSpacing=3;
//    layout.minimumLineSpacing=3;
//
//    self.collectionView.collectionViewLayout=layout;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData
{
    _images = @[@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer",@"night",@"sunrise",@"sunset",@"univer"];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    detailViewController *vc = segue.destinationViewController;
//    NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
//    vc.index = selectedIndexPath.row;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    NSLog(@"images count: %long",images.count);
    return _images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

- (MyCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell" forIndexPath:indexPath];
    
    cell.imageView.image=[UIImage imageNamed:_images[indexPath.row]];
//    NSLog(@"indexPath: %long",indexPath.row);
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionView*)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
//
//    return CGSizeMake(123, 123);
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedCell=(MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIStoryboard *storyboard=(UIStoryboard *)[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    detailViewController *detailController=[storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    detailController.uiImage=[UIImage imageNamed:_images[indexPath.row]];
    [self.navigationController pushViewController:detailController animated:YES];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"showDetailSegue"]){
//        detailViewController *controller=(detailViewController *)segue.destinationViewController;
//        self.selectedCell=(MyCollectionViewCell *)sender;
//        NSIndexPath *path=[self.collectionView indexPathForCell:self.selectedCell];
//
//        controller.uiImage=[UIImage imageNamed:_images[path.row]];
//    }
//}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isPad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
    CGFloat length = (CGRectGetWidth(self.view.frame) / 3) - (kCellMargin * 2);
    if (isPad) {
        // fixed size for iPad in landscape and portrait
        length = 256 - (kCellMargin * 2);
    }
    return CGSizeMake(length, length);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

#pragma mark - UINavigationControllerDelegate Methods
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    // Sanity
    if (fromVC != self && toVC != self) return nil;
    
    // Determine if we're presenting or dismissing
    ZOTransitionType type = (fromVC == self) ? ZOTransitionTypePresenting : ZOTransitionTypeDismissing;
    
    // Create a transition instance with the selected cell's imageView as the target view
    ZOZolaZoomTransition *zoomTransition = [ZOZolaZoomTransition transitionFromView:_selectedCell.imageView
                                                                               type:type
                                                                           duration:0.5
                                                                           delegate:self];
    zoomTransition.fadeColor = self.collectionView.backgroundColor;
    
    return zoomTransition;
}

#pragma mark - ZOZolaZoomTransitionDelegate Methods

- (CGRect)zolaZoomTransition:(ZOZolaZoomTransition *)zoomTransition
        startingFrameForView:(UIView *)targetView
              relativeToView:(UIView *)relativeView
          fromViewController:(UIViewController *)fromViewController
            toViewController:(UIViewController *)toViewController {
    
    if (fromViewController == self) {
        // We're pushing to the detail controller. The starting frame is taken from the selected cell's imageView.
        return [_selectedCell.imageView convertRect:_selectedCell.imageView.bounds toView:relativeView];
    } else if ([fromViewController isKindOfClass:[detailViewController class]]) {
        // We're popping back to this master controller. The starting frame is taken from the detailController's imageView.
        detailViewController *detailController = (detailViewController *)fromViewController;
        return [detailController.detailImage convertRect:detailController.detailImage.bounds toView:relativeView];
    }
    
    return CGRectZero;
}

- (CGRect)zolaZoomTransition:(ZOZolaZoomTransition *)zoomTransition
       finishingFrameForView:(UIView *)targetView
              relativeToView:(UIView *)relativeView
          fromViewController:(UIViewController *)fromViewController
            toViewController:(UIViewController *)toViewController {
    
    if (fromViewController == self) {
        // We're pushing to the detail controller. The finishing frame is taken from the detailController's imageView.
        detailViewController *detailController = (detailViewController *)toViewController;
        return [detailController.detailImage convertRect:detailController.detailImage.bounds toView:relativeView];
    } else if ([fromViewController isKindOfClass:[detailViewController class]]) {
        // We're popping back to this master controller. The finishing frame is taken from the selected cell's imageView.
        return [_selectedCell.imageView convertRect:_selectedCell.imageView.bounds toView:relativeView];
    }
    
    return CGRectZero;
}

- (NSArray *)supplementaryViewsForZolaZoomTransition:(ZOZolaZoomTransition *)zoomTransition {
    // Here we're returning all UICollectionViewCells that are clipped by the edge
    // of the screen. These will be used as "supplementary views" so that the clipped
    // cells will be drawn in their entirety rather than appearing cut off during the
    // transition animation.
    
    NSMutableArray *clippedCells = [NSMutableArray arrayWithCapacity:[[self.collectionView visibleCells] count]];
    for (UICollectionViewCell *visibleCell in self.collectionView.visibleCells) {
        CGRect convertedRect = [visibleCell convertRect:visibleCell.bounds toView:self.view];
        if (!CGRectContainsRect(self.view.frame, convertedRect)) {
            [clippedCells addObject:visibleCell];
        }
    }
    return clippedCells;
}

- (CGRect)zolaZoomTransition:(ZOZolaZoomTransition *)zoomTransition
   frameForSupplementaryView:(UIView *)supplementaryView
              relativeToView:(UIView *)relativeView {
    
    return [supplementaryView convertRect:supplementaryView.bounds toView:relativeView];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"yearHeader" forIndexPath:indexPath];
        reusableView = header;
    }

    return reusableView;
}





































@end

