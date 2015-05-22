module Main where

import System.Environment
import System.IO

help = "-d to dos, -u to unix"

main = do 
  args <- getArgs
  let line_mode = case args of  {
      ["-u"] -> Just LF;
      ["-d"] -> Just CRLF ;
      _ -> Nothing }
  case line_mode of 
    Nothing -> putStrLn help
    Just mode -> do hSetNewlineMode stdout (nativeNewlineMode {outputNL = mode})
                    interact id

