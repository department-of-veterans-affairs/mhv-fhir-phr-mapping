

This example is exactly as chReport-1, except that it shows a simulation of a `recordIdentifier` that is of a different format as seen in the real-world. The alternative format is sometimes referred to as shortAccessionNumber. Unfortunately the shortAccessionNumber is not globally unique, and duplicates are found within a given vista instance. Thus we must add to the value given the specimen dateTime to have a site unique value. Using the specimen dateTime as that will not change with revisions of the report.

This `recordIdentifier` is detected as it will not have a `universalId` or `universalIdType` that is found in the other examples. Note also that the identity has spaces. Note that in Vista there is a different identifier, but we don't get that identifier, so it is not helpful (but we could ask HDR to change?

``` xml

         <recordIdentifier>
            <identity>LR 0703 10</identity>
            <namespaceId>LR</namespaceId>
         </recordIdentifier>
```

Thus:

1. The system value we use the classic TOid, which uses the VA oid and adds the station.
2. The value value we use the `identity` plus, replace the spaces with dash, and add the specimen dateTime
3. Although this is similarly formatted as TOid, it will be indicated as a `secondary` use.
