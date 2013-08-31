//
//  AlbumsViewController.m
//  PhotoBox
//
//  Created by Nico Prananta on 8/31/13.
//  Copyright (c) 2013 Touches. All rights reserved.
//

#import "AlbumsViewController.h"

#import "AlbumCell.h"
#import "Album.h"

#import "PhotosViewController.h"

@interface AlbumsViewController ()

@end

@implementation AlbumsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setAlbumsCount:0 max:0];
    NSString *identifier = @"albumCell";
    [self.dataSource setCellIdentifier:identifier];
    
}

- (void)setAlbumsCount:(int)count max:(int)max{
    if (count == 0) {
        self.title = NSLocalizedString(@"Albums", nil);
    } else {
        self.title = [NSString stringWithFormat:@"%@ (%d/%d)", NSLocalizedString(@"Albums", nil), count, max];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ResourceType)resourceType {
    return AlbumResource;
}

- (void)didFetchItems {
    int count = self.items.count;
    [self setAlbumsCount:count max:self.totalItems];
}

- (NSString *)segue {
    return @"pushPhotosFromAlbums";
}

#pragma mark - Segue


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:[self segue]]) {
        AlbumCell *cell = (AlbumCell *)sender;
        Album *album = cell.item;
        PhotosViewController *destination = (PhotosViewController *)segue.destinationViewController;
        [destination setItem:album];
    }
}

@end