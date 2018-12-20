export interface FieldFinder {

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
