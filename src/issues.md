# Known Issues so far
In the case of:
```hs
getUsers :: Query
getUsers = selectAll $ from "Users" ""
```

The way from and select work, since they take an argument AND chain to the next query element,
we currently need an empty string "" in order to terminate that trailing (++) call.

Possible fixes?
 -- Maybe type ? --> select :: ColumnField -> Query -> Maybe Query
 -- Guarded statement for function definition for anything that takes an arg and chains