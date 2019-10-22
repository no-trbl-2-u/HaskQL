-- Queries will be a collection of functions that will be able
-- to be composed to generate an SQL query string.
-- Usage:
-- -- selectAll(from "myTable")
-- -- selectAll $ from "myTable"
module Queries
  ( select
  , selectAll
  , from
  , where_
  , getUser
  , getUsers
  ) where

import           Data.Maybe (fromMaybe)

type Query = String

type Table = String

type Predicate = String

type ColumnField = String

(?.) :: Maybe a -> a -> a
Just x ?. _ = x
Nothing ?. y = y

select :: ColumnField -> Query -> Query
select cf = (("SELECT " ++ cf) ++)

selectAll :: Query -> Query
selectAll = ("SELECT *" ++)

from :: Table -> Query -> Query
from table ""  = (" FROM " ++ table) ++ ""
from table nxt = (" FROM " ++ table) ++ nxt

where_ :: Predicate -> Query
where_ predicate = " WHERE " ++ predicate

-- Example Usage
type Name = String

getUsers :: Query
getUsers = selectAll $ from "Users" ""

getUser :: Name -> Query
getUser name = select "username" $ from "Users" $ where_ "name = " ++ name
-- fromMyTable $ where_ "ID < 10"
-- selectAll . from "myTable" $ where_ "username == user"
-- select "username" $ from "myTable" $ where_ "username === user"
