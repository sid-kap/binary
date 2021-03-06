{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ >= 701
{-# LANGUAGE Safe #-}
#endif
-----------------------------------------------------------------------------
-- |
-- Module      : Data.Binary.Builder
-- Copyright   : Lennart Kolmodin, Ross Paterson
-- License     : BSD3-style (see LICENSE)
--
-- Maintainer  : Lennart Kolmodin <kolmodin@gmail.com>
-- Stability   : experimental
-- Portability : portable to Hugs and GHC
--
-- Efficient construction of lazy bytestrings.
--
-----------------------------------------------------------------------------

module Data.Binary.Builder (

    -- * The Builder type
      Builder
    , toLazyByteString

    -- * Constructing Builders
    , empty
    , singleton
    , append
    , fromByteString        -- :: S.ByteString -> Builder
    , fromLazyByteString    -- :: L.ByteString -> Builder
#if MIN_VERSION_bytestring(0,10,4)
    , fromShortByteString   -- :: T.ByteString -> Builder
#endif

    -- * Flushing the buffer state
    , flush

    -- * Derived Builders
    -- ** Big-endian writes
    , putWord16be           -- :: Word16 -> Builder
    , putWord32be           -- :: Word32 -> Builder
    , putWord64be           -- :: Word64 -> Builder
    , putInt16be            -- :: Int16 -> Builder
    , putInt32be            -- :: Int32 -> Builder
    , putInt64be            -- :: Int64 -> Builder

    -- ** Little-endian writes
    , putWord16le           -- :: Word16 -> Builder
    , putWord32le           -- :: Word32 -> Builder
    , putWord64le           -- :: Word64 -> Builder
    , putInt16le            -- :: Int16 -> Builder
    , putInt32le            -- :: Int32 -> Builder
    , putInt64le            -- :: Int64 -> Builder

    -- ** Host-endian, unaligned writes
    , putWordhost           -- :: Word -> Builder
    , putWord16host         -- :: Word16 -> Builder
    , putWord32host         -- :: Word32 -> Builder
    , putWord64host         -- :: Word64 -> Builder
    , putInthost            -- :: Int -> Builder
    , putInt16host          -- :: Int16 -> Builder
    , putInt32host          -- :: Int32 -> Builder
    , putInt64host          -- :: Int64 -> Builder

      -- ** Unicode
    , putCharUtf8

  ) where

import Data.Binary.Builder.Base
