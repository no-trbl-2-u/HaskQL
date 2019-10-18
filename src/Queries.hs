-- Queries will be a collection of functions that will be able
-- to be composed to generate an SQL query string.
-- Usage:
-- -- selectAll(from "myTable")
-- -- selectAll $ from "myTable"
module Queries
  ( selectAll
  , from
  , where_
  ) where

type Query = String

type Table = String

type Predicate = String

selectAll :: Query -> Query
selectAll = ("SELECT * " ++)

from :: Table -> Query -> Query
from table = \n -> ("FROM " ++ table) ++ n

where_ :: Predicate -> Query
where_ predicate = " WHERE " ++ predicate
-- selectAll(from "myTable")
