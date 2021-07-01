module Url
  ( matchingUrl,
    URL,
    mkUrl,
    Pattern,
    mkPattern,
  )
where

import qualified Data.Text as T
import Universum
import qualified Universum.Unsafe as U

newtype URL = URLConstr [Text] deriving (Eq, Show)

newtype Pattern = PatternConstr [Text] deriving (Eq, Show)

mkUrl :: Text -> URL
mkUrl url = URLConstr (filter (not . T.null) (T.splitOn "/" url))

mkPattern :: Text -> Pattern
mkPattern pat = PatternConstr (T.splitOn ", " pat)

matchingUrl :: Pattern -> URL -> Bool
matchingUrl (PatternConstr patterns) (URLConstr urlParts) = and (zipWith T.isPrefixOf patterns urlParts)
