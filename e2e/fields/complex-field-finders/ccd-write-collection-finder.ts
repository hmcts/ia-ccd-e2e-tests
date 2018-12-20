import { ComplexFieldFinder } from './complex-field-finder';
import { by } from 'protractor';

export class CcdWriteCollectionFinder implements ComplexFieldFinder {

    public async findComplexField(
        container,
        instanceNumber: number,
        complexFieldLabel: string
    ) {
        return await container
            .all(by.xpath(
                '//ccd-write-collection-field' +
                '//h3[normalize-space()="' + complexFieldLabel + '"]' +
                '/ancestor::ccd-write-collection-field[position()=1]'
            ))
            .filter(e => e.isDisplayed())
            .get(instanceNumber - 1);
    }
}
