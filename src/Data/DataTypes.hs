{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}

module Data.DataTypes (
  Expense(..),
  migrateAll
                      ) where

import Control.Monad.IO.Class  (liftIO)
import Database.Persist
import Database.Persist.TH

-- Use Template Haskell to generate the necessary code for the User data type
share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Expense
  amount Int
  type String
  paidBy String
  paidFor [String]
  note String
  deriving Eq
|]
