-- Queries will be a collection of functions that will be able
-- to be composed to generate an SQL query string.

-- Usage:
-- -- selectAll(from "myTable")
-- -- selectAll $ from "myTable"

module Queries (
  selectAll,
  from
) where

type Query = String
type Table = String

selectAll :: Query -> Query
selectAll = ("SELECT * " ++ )

from :: Table -> Query
from table = "FROM " ++ table

-- selectAll(from "myTable")