module Main where

import System.Environment
import System.IO
import Control.Applicative

help = "-d to dos, -u to unix"

main = do 
  args <- getArgs
  let line_mode = case args of  {
   ["-u"] -> Just LF;
   ["-d"] -> Just CRLF;
   _ -> Nothing }
  case line_mode of 
    Nothing -> putStrLn help
    Just mode -> do 
                 hSetNewlineMode stdin (universalNewlineMode)
                 hSetNewlineMode stdout (universalNewlineMode {outputNL = mode})
                 interact id
