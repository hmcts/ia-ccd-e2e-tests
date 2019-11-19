import { ComplexFieldFinder } from './complex-field-finder';
import { by } from 'protractor';

export class TableCollectionFinder implements ComplexFieldFinder {

    public async findComplexField(
        container,
        instanceNumber: number,
        complexFieldLabel: string
    ) {
        return await container
            .all(by.xpath(
                '//th[normalize-space()="' + complexFieldLabel + '" and not(.//ccd-markdown)]/..'
            ))
            .filter(e => e.isDisplayed())
            .get(instanceNumber - 1);
    }
}
