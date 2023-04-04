{-# LANGUAGE OverloadedStrings          #-}

module DataTest where

import Data.DataTypes
import Data.DataTypes (Expense(Expense))
import Database.Persist.Sqlite

dataTests = do
  let ex = Expense 100 "" "" [] "Hi"
  -- Run database migrations to create the necessary tables
  runSqlite "mydb.sqlite" $ runMigration migrateAll
  -- Insert a new user into the database
  exId <- runSqlite "mydb.sqlite" $ insert $ ex
  -- Query the database to retrieve the newly-inserted user
  Just ex0 <- runSqlite "mydb.sqlite" $ get exId
  putStrLn $ "Expense Note: " ++ expenseNote ex0
  -- Open a connection to a SQLite database file
  --runSqlite "mydb.sqlite" $ \conn -> do
    -- Run database migrations to create the necessary tables
    --runSqlConn (runMigration migrateAll) conn
    -- Insert a new user into the database
    --userId <- runSqlConn (insert $  Expense 100 "" "" [] "Hi") conn
    -- Query the database to retrieve the newly-inserted user
    --Just ex <- runSqlConn (get userId) conn
    --putStrLn $ "Expense note: " ++ expenseNote ex
