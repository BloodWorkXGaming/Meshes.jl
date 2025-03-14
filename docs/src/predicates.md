# Predicates

```@example intersects
using JSServe: Page # hide
Page(exportable=true, offline=true) # hide
```

```@example intersects
using Meshes # hide
import WGLMakie as Mke # hide
```

This section lists predicates that can be used to check properties of geometric
objects, both of themselves and relative to other geometric objects. 

One important note to make is that these predicates are not necessarily exact.
For example, rather than checking if a point `p` is exactly in a sphere of radius
`r` centered at `c`, we check if `norm(p-c) ≈ r` with an absolute tolerance depending
on the point type, so `p` might be slightly outside the sphere but still be considered
as being inside.

Exact arithmetic is expensive to apply and approximations are typically sufficient;
exact predicates are available in [ExactPredicates.jl](https://github.com/lairez/ExactPredicates.jl)
if you need them.

## isparametrized

```@docs
isparametrized
paramdim
```

## isperiodic

```@docs
isperiodic
```

## issimplex

```@docs
issimplex
```

## isclosed

```@docs
isclosed
```

## isconvex

```@docs
isconvex
```

## issimple

```@docs
issimple
```

## hasholes

```@docs
hasholes
```

## point ∈ geometry

```@docs
Base.in(::Point, ::Geometry)
```

## geometry₁ ⊆ geometry₂

```@docs
Base.issubset(::Geometry, ::Geometry)
```

## intersects

```@docs
intersects
supportfun
```

```@example intersects
outer = Point2[(0,0),(1,0),(1,1),(0,1)]
hole1 = Point2[(0.2,0.2),(0.4,0.2),(0.4,0.4),(0.2,0.4)]
hole2 = Point2[(0.6,0.2),(0.8,0.2),(0.8,0.4),(0.6,0.4)]
poly  = PolyArea([outer, hole1, hole2])
ball1 = Ball((0.5,0.5), 0.05)
ball2 = Ball((0.3,0.3), 0.05)
ball3 = Ball((0.7,0.3), 0.05)
ball4 = Ball((0.3,0.3), 0.15)

intersects(poly, ball1)
```

```@example intersects
intersects(poly, ball2)
```

```@example intersects
intersects(poly, ball3)
```

```@example intersects
intersects(poly, ball4)
```

## iscollinear 

```@docs 
iscollinear 
``` 

## iscoplanar 

```@docs 
iscoplanar 
```
