export interface FieldFinder {

    findByLabel(container, fieldLabel);

    findFirstHavingEmptyLabel(container);
}
