import qualified System.Environment as Env
import qualified System.IO as IO
import qualified Data.Maybe as Maybe
import qualified Calcul

main :: IO ()
main = do
    args <- Env.getArgs
    pure_main args
    where
        pure_main :: [String] -> IO ()
        pure_main args
            | length args == 1 = inner
            | otherwise = IO.hPutStrLn IO.stderr ".."
            where
                inner :: IO ()
                inner
                    | n == Nothing = IO.hPutStrLn IO.stderr "..."
                    | otherwise = putStr calculs
                    where
                        n = readMaybe (args!!0)
                        calculs = Calcul.calcul (Maybe.fromJust n)

readMaybe :: (Read r) => String -> Maybe r
readMaybe s =
    case reads s of
    [(i, "")] -> Just i
    _ -> Nothing
