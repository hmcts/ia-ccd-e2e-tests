export interface FieldFinder {

    getFieldType();

    findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    );

    findHavingEmptyLabel(
        container,
        instanceNumber: number
    );
}
