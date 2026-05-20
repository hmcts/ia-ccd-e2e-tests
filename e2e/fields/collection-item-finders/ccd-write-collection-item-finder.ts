import { CollectionItemFinder } from './collection-item-finder';
import { by } from 'protractor';

export class CcdWriteCollectionItemFinder implements CollectionItemFinder {
  public async findCollectionItem(collectionContainer, collectionItemNumber: number) {
    return collectionContainer
      .all(by.xpath('.//div[contains(@class, "collection-title")]/..'))
      .filter(e => e.isDisplayed())
      .get(collectionItemNumber - 1);
  }
}
