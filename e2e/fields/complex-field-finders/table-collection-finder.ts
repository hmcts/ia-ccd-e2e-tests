import { ComplexFieldFinder } from './complex-field-finder';
import { by } from 'protractor';

export class TableCollectionFinder implements ComplexFieldFinder {

    public async findComplexField(
        container,
        complexFieldLabel: string
    ) {
        return await container
            .all(by.xpath(
                '//tr[.//th[normalize-space()="' + complexFieldLabel + '"]]'
            ))
            .filter(e => e.isDisplayed())
            .first();
    }
}
