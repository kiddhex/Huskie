data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- if we wanted to refer to the point themselves (and not nested coordinates) we could use as patterns

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y1+b))

-- if we don't want to deal directly with points, we can make some auxiliary functions that create shapes of some size at the zero coordinates
-- and then nudge those

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

-- if we wanted to export the functions and types that we defined here in a module, we could start off like this:
-- module Shapes
-- ( Point(..)
-- , Shape(..)
-- , surface
-- , nudge
-- , baseCircle
-- , baseRect
-- ) where

-- by doing Shape(..) we exported all the value constructors for shape, so circle and rectangle.