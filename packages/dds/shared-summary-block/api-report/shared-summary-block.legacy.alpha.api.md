## Alpha API Report File for "@fluidframework/shared-summary-block"

> Do not edit this file. It is a report generated by [API Extractor](https://api-extractor.com/).

```ts

// @alpha @legacy
export interface ISharedSummaryBlock extends ISharedObject {
    get<T>(key: string): Jsonable<T>;
    set<T>(key: string, value: Jsonable<T>): void;
}

// @alpha @legacy
export const SharedSummaryBlock: ISharedObjectKind<ISharedSummaryBlock> & SharedObjectKind<ISharedSummaryBlock>;

// @alpha @legacy
export type SharedSummaryBlock = ISharedSummaryBlock;

// (No @packageDocumentation comment for this package)

```
