{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_MuninnV1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/bin"
libdir     = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/lib/x86_64-linux-ghc-9.2.7/MuninnV1-0.1.0.0-BMBL3nZvEFqR206F9eMcs"
dynlibdir  = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/share/x86_64-linux-ghc-9.2.7/MuninnV1-0.1.0.0"
libexecdir = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/libexec/x86_64-linux-ghc-9.2.7/MuninnV1-0.1.0.0"
sysconfdir = "/home/moofby/DEV/MuninnV1/.stack-work/install/x86_64-linux-tinfo6/671fd4d5d1a84453b4c8574d7f640e6354edaf1142b9f66c39d70cfd018ea603/9.2.7/etc"

getBinDir     = catchIO (getEnv "MuninnV1_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "MuninnV1_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "MuninnV1_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "MuninnV1_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MuninnV1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MuninnV1_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
