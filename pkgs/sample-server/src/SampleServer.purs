module SampleServer where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import SampleCommon (pi)

main :: Effect Unit
main = do
  log ("abc" <> show pi)
