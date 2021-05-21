import { Field } from './field';
import { FormFiller } from '../helpers/form-filler';
import { by, ElementFinder } from 'protractor';

export class CcdWriteDateField implements Field {

    private readonly formFiller = new FormFiller();

    private readonly container: ElementFinder;
    private readonly fieldLabel: string;

    public constructor(
        container: ElementFinder,
        fieldLabel: string
    ) {
        this.container = container;
        this.fieldLabel = fieldLabel;
    }

    public getLabel() {
        return this.fieldLabel;
    }

    public getOptions() {
        return [];
    }

    public async getValue() {

        const dayElement = this.getDayElement();
        const monthElement = this.getMonthElement();
        const yearElement = this.getYearElement();
        const hourElement = this.getHourElement();
        const minuteElement = this.getMinuteElement();
        const secondElement = this.getSecondElement();

        let datePart =
            await dayElement.getAttribute('value') + '-' +
            await monthElement.getAttribute('value') + '-' +
            await yearElement.getAttribute('value');

        if (datePart === '--') {
            datePart = '';
        }

        let timePart = '';

        if (await hourElement.isPresent()
            && await minuteElement.isPresent()
            && await secondElement.isPresent()) {

            timePart =
                await hourElement.getAttribute('value') + ':' +
                await minuteElement.getAttribute('value') + ':' +
                await secondElement.getAttribute('value');

            if (timePart === '::') {
                timePart = '';
            }
        }

        return (datePart + ' ' + timePart).trim();
    }

    public async setValue(value) {

        if (!value) {
            value = '--:::';
        }

        // DD-MM-YYYY HH:MM:SS
        const dateParts =
            value
                .replace(/\s+/g, '-')
                .replace(/:/g, '-')
                .split('-');

        await this.formFiller.replaceText(
            this.getDayElement(),
            dateParts[0]
        );

        await this.formFiller.replaceText(
            this.getMonthElement(),
            dateParts[1]
        );

        await this.formFiller.replaceText(
            this.getYearElement(),
            dateParts[2]
        );

        if (dateParts.length > 3) {

            const hourElement = this.getHourElement();

            if (await hourElement.isPresent()) {
                await this.formFiller.replaceText(
                    hourElement,
                    dateParts[3]
                );
            }
        }

        if (dateParts.length > 4) {

            const minuteElement = this.getMinuteElement();

            if (await minuteElement.isPresent()) {
                await this.formFiller.replaceText(
                    minuteElement,
                    dateParts[4]
                );
            }
        }

        if (dateParts.length > 5) {

            const secondElement = this.getSecondElement();

            if (await secondElement.isPresent()) {
                await this.formFiller.replaceText(
                    secondElement,
                    dateParts[5]
                );
            }
        }
    }

    public async isDisplayed() {
        return await (this.getDayElement()).isDisplayed();
    }

    public async isEnabled() {
        return await (this.getDayElement()).isEnabled();
    }

    public isReadOnly() {
        return false;
    }

    private getDayElement() {
        return this.getUnitElement('day');
    }

    private getMonthElement() {
        return this.getUnitElement('month');
    }

    private getYearElement() {
        return this.getUnitElement('year');
    }

    private getHourElement() {
        return this.getUnitElement('hour');
    }

    private getMinuteElement() {
        return this.getUnitElement('minute');
    }

    private getSecondElement() {
        return this.getUnitElement('second');
    }

    private getUnitElement(unit: string) {
        return this.container.element(by.xpath('.//input[(@type="text" or @type="number") and contains(@name, "-' + unit + '")]'));
    }
}
