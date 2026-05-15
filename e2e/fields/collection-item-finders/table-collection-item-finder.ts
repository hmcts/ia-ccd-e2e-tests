import { CollectionItemFinder } from './collection-item-finder';
import { by } from 'protractor';

export class TableCollectionItemFinder implements CollectionItemFinder {
  public async findCollectionItem(collectionContainer, collectionItemNumber: number) {
    if (await collectionContainer.$$('ccd-read-complex-field').isDisplayed()) {
      return collectionContainer
        .all(by.xpath('.//ccd-read-complex-field'))
        .filter(e => e.isDisplayed())
        .get(collectionItemNumber - 1);
    }
    return collectionContainer
      .all(by.xpath('.//ccd-field-read'))
      .filter(e => e.isDisplayed())
      .get(collectionItemNumber - 1);
  }
}
