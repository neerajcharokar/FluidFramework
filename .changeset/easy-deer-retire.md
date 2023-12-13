---
"@fluidframework/datastore-definitions": major
"@fluid-experimental/devtools-core": major
"@fluidframework/map": major
"@fluidframework/matrix": major
"@fluidframework/sequence": major
"@fluidframework/shared-summary-block": major
"@fluid-experimental/sharejs-json1": major
"@fluid-private/test-end-to-end-tests": major
"@fluidframework/test-runtime-utils": major
"@fluid-experimental/tree2": major
---

Update `Jsonable` and `Serializable` types from @fluidframework-definitions to require a generic parameter and if that type is `any` or `unknown` use a new result `JsonableTypeWith<>` that more accurately represents the limitation of serialization. Additional modifications:

-   `Jsonable`'s `TReplacement` parameter default has also been changed from `void` to `never`, which now disallows `void`.
-   Unrecognized primitive types like `symbol` are now filtered to `never` instead of `{}`.
-   Recursive types with arrays (`[]`) are now supported.

`Serializable` is commonly used for DDS values and now requires more precision when using them. For example SharedMatrix (unqualified) has an `any` default that meant values were `Serializable<any>` (i.e. `any`), but now `Serializable<any>` is `JsonableTypeWith<IFluidHandle>` which may be problematic for reading or writing. Preferred correction is to specify the value type but casting through `any` may provide a quick fix.